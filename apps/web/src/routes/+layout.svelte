<script>
	import '../app.css';
	import { invalidate } from '$app/navigation';
	import { onMount } from 'svelte';
	import Navbar from '$lib/components/Navbar.svelte';
	import LandingNavbar from '$lib/components/Landing/LandingNavbar.svelte';
	import LandingFooter from '$lib/components/Landing/LandingFooter.svelte';
	export let data;
	$: ({ session, supabase } = data);

	onMount(() => {
		const { data } = supabase.auth.onAuthStateChange((_, newSession) => {
			if (newSession?.expires_at !== session?.expires_at) {
				invalidate('supabase:auth');
			}
		});

		return () => data.subscription.unsubscribe();
	});
</script>

<slot />	

<!-- <div class="min-h-screen flex flex-col">
	<LandingNavbar session={session} />


	<main class="flex-grow">
		<slot />
	</main>

	<LandingFooter />
</div>

<style>
	:global(html) {
		scroll-behavior: smooth;
	}
</style> -->