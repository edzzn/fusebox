<script lang="ts">
	import type { Note } from '$lib/types';
	import type { PageData } from './$types';

	export let data: PageData;

	$: ({ notes } = data);

	let editingNoteId: number | null = null;
	let editingNoteText = '';

	function startEditing(note: Note) {
		editingNoteId = note.id;
		editingNoteText = note.note;
	}

	function cancelEditing() {
		editingNoteId = null;
		editingNoteText = '';
	}
</script>

<div class="bg-gray-50">
	<!-- Page header -->
	<header class="bg-white shadow">
		<div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
			<h1 class="text-3xl font-bold text-gray-900">Dashboard</h1>
		</div>
	</header>

	<main class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
		<!-- Stats cards -->
		<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
			{#each [{ name: 'Total Projects', stat: '12', change: '+2.5%', changeType: 'increase' }, { name: 'Active Tasks', stat: '24', change: '+4.1%', changeType: 'increase' }, { name: 'Completion Rate', stat: '98.5%', change: '+1.2%', changeType: 'increase' }] as { name, stat, change, changeType }}
				<div class="overflow-hidden rounded-lg bg-white shadow">
					<div class="p-5">
						<div class="flex items-center">
							<div class="flex-1">
								<div class="truncate text-sm font-medium text-gray-500">{name}</div>
								<div class="mt-1 text-3xl font-semibold text-gray-900">{stat}</div>
							</div>
							<div class="ml-4">
								<span
									class={`inline-flex items-center rounded-full px-2.5 py-0.5 text-sm font-medium ${
										changeType === 'increase'
											? 'bg-green-100 text-green-800'
											: 'bg-red-100 text-red-800'
									}`}
								>
									{change}
								</span>
							</div>
						</div>
					</div>
				</div>
			{/each}
		</div>

		<!-- Notes Section -->
		<div class="mt-8">
			<div class="rounded-lg bg-white shadow">
				<div class="border-b border-gray-200 px-4 py-5 sm:px-6">
					<h3 class="text-lg font-medium leading-6 text-gray-900">Notes</h3>
				</div>

				<!-- Add Note Form -->
				<div class="border-b border-gray-200 p-4">
					<form method="POST" action="?/createNote" class="flex gap-2">
						<input
							type="text"
							name="note"
							placeholder="Enter your note..."
							class="flex-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
						/>
						<button
							type="submit"
							class="inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
						>
							Add Note
						</button>
					</form>
				</div>

				<!-- Notes List -->
				<ul class="divide-y divide-gray-200">
					{#each notes as note}
						<li class="flex justify-between px-4 py-4 hover:bg-gray-50 sm:px-6">
							{#if editingNoteId === note.id}
								<form method="POST" action="?/updateNote" class="flex flex-1 gap-2">
									<input type="hidden" name="id" value={note.id} />
									<input
										type="text"
										name="note"
										bind:value={editingNoteText}
										class="flex-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									/>
									<button
										type="submit"
										class="inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-3 py-1 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
									>
										Save
									</button>
									<button
										type="button"
										class="inline-flex items-center rounded-md border border-gray-300 bg-white px-3 py-1 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
										on:click={cancelEditing}
									>
										Cancel
									</button>
								</form>
							{:else}
								<p>{note.note}</p>
								<div class="flex items-center gap-2">
									<button
										type="button"
										class="text-indigo-600 hover:text-indigo-800"
										title="Edit note"
										aria-label="Edit note"
										on:click={() => startEditing(note)}
									>
										<svg
											xmlns="http://www.w3.org/2000/svg"
											class="h-5 w-5"
											viewBox="0 0 20 20"
											fill="currentColor"
										>
											<path
												d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
											/>
										</svg>
									</button>
									<form method="POST" action="?/deleteNote" class="inline">
										<input type="hidden" name="id" value={note.id} />
										<button
											type="submit"
											class="text-red-600 hover:text-red-800"
											title="Delete note"
											aria-label="Delete note"
										>
											<svg
												xmlns="http://www.w3.org/2000/svg"
												class="h-5 w-5"
												viewBox="0 0 20 20"
												fill="currentColor"
											>
												<path
													fill-rule="evenodd"
													d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
													clip-rule="evenodd"
												/>
											</svg>
										</button>
									</form>
								</div>
							{/if}
						</li>
					{/each}
				</ul>
			</div>
		</div>

		<!-- Recent Activity -->
		<div class="mt-8">
			<div class="rounded-lg bg-white shadow">
				<div class="border-b border-gray-200 px-4 py-5 sm:px-6">
					<h3 class="text-lg font-medium leading-6 text-gray-900">Recent Activity</h3>
				</div>
				<ul class="divide-y divide-gray-200">
					{#each [{ title: 'Project Alpha updated', time: '2 hours ago', description: 'New features were added to the dashboard' }, { title: 'New team member added', time: '4 hours ago', description: 'Sarah Johnson joined the development team' }, { title: 'Milestone completed', time: '1 day ago', description: 'Phase 1 of Project Beta was completed' }] as activity}
						<li class="px-4 py-4 hover:bg-gray-50 sm:px-6">
							<div class="flex items-center justify-between">
								<div class="flex-1">
									<p class="truncate text-sm font-medium text-indigo-600">{activity.title}</p>
									<p class="mt-1 text-sm text-gray-500">{activity.description}</p>
								</div>
								<div class="ml-4 flex-shrink-0">
									<p class="text-sm text-gray-500">{activity.time}</p>
								</div>
							</div>
						</li>
					{/each}
				</ul>
			</div>
		</div>

		<!-- Quick Actions -->
		<div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
			<div class="rounded-lg bg-white p-6 shadow">
				<h3 class="mb-4 text-lg font-medium text-gray-900">Quick Actions</h3>
				<div class="grid grid-cols-2 gap-4">
					{#each [{ name: 'New Project', icon: '📁' }, { name: 'Add Task', icon: '✅' }, { name: 'Invite Team', icon: '👥' }, { name: 'Generate Report', icon: '📊' }] as action}
						<button
							class="inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
						>
							<span class="mr-2">{action.icon}</span>
							{action.name}
						</button>
					{/each}
				</div>
			</div>

			<div class="rounded-lg bg-white p-6 shadow">
				<h3 class="mb-4 text-lg font-medium text-gray-900">Upcoming Deadlines</h3>
				<ul class="space-y-4">
					{#each [{ task: 'Project Proposal', date: 'Tomorrow', priority: 'High' }, { task: 'Team Meeting', date: 'In 2 days', priority: 'Medium' }, { task: 'Client Presentation', date: 'Next week', priority: 'High' }] as deadline}
						<li class="flex items-center justify-between">
							<div>
								<p class="text-sm font-medium text-gray-900">{deadline.task}</p>
								<p class="text-sm text-gray-500">{deadline.date}</p>
							</div>
							<span
								class={`rounded-full px-2.5 py-0.5 text-xs font-medium ${
									deadline.priority === 'High'
										? 'bg-red-100 text-red-800'
										: 'bg-yellow-100 text-yellow-800'
								}`}
							>
								{deadline.priority}
							</span>
						</li>
					{/each}
				</ul>
			</div>
		</div>
	</main>
</div>
