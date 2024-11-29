<script lang="ts">
	import LandingFooter from '$lib/components/Landing/LandingFooter.svelte';
	import LandingNavbar from '$lib/components/Landing/LandingNavbar.svelte';
	import Features from '$lib/components/Landing/Features.svelte';
	import Pricing from '$lib/components/Landing/Pricing.svelte';
	import Contact from '$lib/components/Landing/Contact.svelte';
	import Hero from '$lib/components/Landing/Hero.svelte';
	import type { PageData } from './$types';

	export let data: PageData;

	$: ({ session } = data);
</script>

<LandingNavbar {session} />
<Hero />
<Features />
<Pricing />
<Contact />
<LandingFooter />
