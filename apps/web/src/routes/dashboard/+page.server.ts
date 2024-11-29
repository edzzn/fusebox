import { fail } from '@sveltejs/kit';
import type { Actions, PageServerLoad } from './$types';

export const load: PageServerLoad = async ({ depends, locals: { session, supabase } }) => {
	depends('supabase:db:notes');
	const { data: notes } = await supabase.from('notes').select('id,note').order('id');

	return {
		session,
		notes: notes ?? [],
		stats: {
			totalProjects: 12,
			activeTasks: 24,
			completionRate: '98.5%'
		},
		recentActivity: [
			// ... fetch real activity data
		],
		upcomingDeadlines: [
			// ... fetch real deadlines
		]
	};
};

export const actions: Actions = {
	createNote: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData();
		const note = formData.get('note')?.toString();

		if (!note) {
			return fail(400, { error: 'Note text is required' });
		}

		const { error } = await supabase.from('notes').insert({ note });

		if (error) {
			return fail(500, { error: 'Failed to create note' });
		}

		return { success: true };
	},

	updateNote: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData();
		const id = formData.get('id')?.toString();
		const note = formData.get('note')?.toString();

		if (!id || !note) {
			return fail(400, { error: 'Note ID and text are required' });
		}

		const { error } = await supabase
			.from('notes')
			.update({ note })
			.eq('id', id);

		if (error) {
			return fail(500, { error: 'Failed to update note' });
		}

		return { success: true };
	},

	deleteNote: async ({ request, locals: { supabase } }) => {
		const formData = await request.formData();
		const id = formData.get('id')?.toString();

		if (!id) {
			return fail(400, { error: 'Note ID is required' });
		}

		const { error } = await supabase.from('notes').delete().eq('id', id);

		if (error) {
			return fail(500, { error: 'Failed to delete note' });
		}

		return { success: true };
	}
};
