<script lang="ts">
	import { page } from '$app/stores';

	const navigation = [
		{ name: 'Features', href: '#features' },
		{ name: 'Pricing', href: '#pricing' },
		{ name: 'Contact', href: '#contact' }
	];

	export let session;

	$: path = $page.url.pathname;

</script>


<nav class="bg-white shadow-sm">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex justify-between h-16 items-center">
				<div class="flex-shrink-0">
					<span class="text-2xl font-bold text-indigo-600">SaaSApp</span>
				</div>
				<div class="hidden md:block">
					<div class="flex items-center space-x-8">
						<a href="#features" class="text-gray-700 hover:text-indigo-600">Features</a>
						<a href="#pricing" class="text-gray-700 hover:text-indigo-600">Pricing</a>
						<a href="#contact" class="text-gray-700 hover:text-indigo-600">Contact</a>
						{#if session}
							<a href="/dashboard" class="text-gray-700 hover:text-indigo-600">Dashboard</a>
						{:else}
							<a
								href="/auth"
								class="bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-700"
								>Sign In</a
							>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</nav>