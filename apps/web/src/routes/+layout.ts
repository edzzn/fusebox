import { createBrowserClient, createServerClient, isBrowser } from '@supabase/ssr';
import type { LayoutLoad } from './$types';
import { browser } from '$app/environment';
import posthog from 'posthog-js';

export const load: LayoutLoad = async ({ data, depends, fetch }) => {
	/**
	 * Declare a dependency so the layout can be invalidated, for example, on
	 * session refresh.
	 */
	depends('supabase:auth');

	const supabaseUrl = import.meta.env.VITE_PUBLIC_SUPABASE_URL;
	const supabaseAnonKey = import.meta.env.VITE_PUBLIC_SUPABASE_ANON_KEY;

	const posthogKey = import.meta.env.VITE_PUBLIC_POSTHOG_PROJECT_API_KEY;
	const posthogHost = import.meta.env.VITE_PUBLIC_POSTHOG_API_HOST;

	if (browser) {
		posthog.init(posthogKey, {
			api_host: posthogHost,
			person_profiles: 'identified_only'
		});
	}

	const supabase = isBrowser()
		? createBrowserClient(supabaseUrl, supabaseAnonKey, {
				global: {
					fetch
				}
			})
		: createServerClient(supabaseUrl, supabaseAnonKey, {
				global: {
					fetch
				},
				cookies: {
					getAll() {
						// @ts-expect-error: data?.cookies is not typed but is expected to be a Record<string, string>
						return data?.cookies;
					}
				}
			});

	/**
	 * It's fine to use `getSession` here, because on the client, `getSession` is
	 * safe, and on the server, it reads `session` from the `LayoutData`, which
	 * safely checked the session using `safeGetSession`.
	 */
	const {
		data: { session }
	} = await supabase.auth.getSession();

	const {
		data: { user }
	} = await supabase.auth.getUser();

	return { session, supabase, user };
};
