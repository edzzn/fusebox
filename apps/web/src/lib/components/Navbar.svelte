<script lang="ts">
	import { page } from '$app/stores';
	import { clickOutside } from '$lib/utils/clickOutside';
	import { fade } from 'svelte/transition';

	const navigation = [
		{ name: 'Dashboard', href: '/dashboard' },
	];

	let isUserMenuOpen = false;
	const toggleUserMenu = () => isUserMenuOpen = !isUserMenuOpen;
	const closeUserMenu = () => isUserMenuOpen = false;

	$: path = $page.url.pathname;
</script>


<nav class="bg-white shadow">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex justify-between h-16">
			<div class="flex">
				<div class="flex-shrink-0 flex items-center">
					<a href="/" class="text-xl font-bold text-indigo-600">YourApp</a>
				</div>

				<div class="hidden sm:ml-6 sm:flex sm:space-x-8">
					{#each navigation as item}
						<a
							href={item.href}
							class={`inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium ${
								path.startsWith(item.href)
									? 'border-indigo-500 text-gray-900'
									: 'border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700'
							}`}
						>
							{item.name}
						</a>
					{/each}
				</div>
			</div>

			<div class="hidden sm:ml-6 sm:flex sm:items-center">
				<div class="ml-3 relative">
					<button
						type="button"
						on:click={toggleUserMenu}
						class="bg-white rounded-full flex text-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
					>
						<span class="sr-only">Open user menu</span>
						<div
							class="h-8 w-8 rounded-full bg-gray-200 flex items-center justify-center text-gray-600"
						>
							<svg
								class="h-5 w-5"
								xmlns="http://www.w3.org/2000/svg"
								fill="none"
								viewBox="0 0 24 24"
								stroke="currentColor"
							>
								<path
									stroke-linecap="round"
									stroke-linejoin="round"
									stroke-width="2"
									d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
								/>
							</svg>
						</div>
					</button>

					{#if isUserMenuOpen}
						<div
							transition:fade
							use:clickOutside={{ callback: closeUserMenu }}
							class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
						>
							<div class="py-1" role="menu" aria-orientation="vertical" aria-labelledby="user-menu">
								<a
									href="/dashboard/profile"
									class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
									role="menuitem"
								>
									Your Profile
								</a>
								<a
									href="/dashboard/settings"
									class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
									role="menuitem"
								>
									Settings
								</a>
								<form method="POST" action="/auth?/logout">
									<button
										type="submit"
										class="block w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100"
										role="menuitem"
									>
										Sign out
									</button>
								</form>
							</div>
						</div>
					{/if}
				</div>
			</div>

			<div class="flex items-center sm:hidden">
				<button
					type="button"
					class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
				>
					<span class="sr-only">Open main menu</span>
					<svg
						class="h-6 w-6"
						xmlns="http://www.w3.org/2000/svg"
						fill="none"
						viewBox="0 0 24 24"
						stroke="currentColor"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							stroke-width="2"
							d="M4 6h16M4 12h16M4 18h16"
						/>
					</svg>
				</button>
			</div>
		</div>
	</div>
</nav> 