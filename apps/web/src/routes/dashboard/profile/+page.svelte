<script lang="ts">
	import type { PageData } from './$types';

	export let data: PageData;
	$: ({ session } = data);

	let isEditing = false;
	let formData = {
		name: session?.user?.email ?? '',
		email: session?.user?.email ?? ''
	};

	function handleSubmit() {
		// TODO: Implement profile update logic
		isEditing = false;
	}
</script>

<div class="py-6">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<h1 class="text-2xl font-semibold text-gray-900">Profile</h1>
	</div>
	<div class="max-w-7xl mx-auto px-4 sm:px-6 md:px-8">
		<div class="py-4">
			<div class="bg-white shadow sm:rounded-lg">
				<div class="px-4 py-5 sm:p-6">
					<div class="flex justify-between items-start">
						<div class="flex items-center space-x-5">
							<div class="flex-shrink-0">
								<div class="relative">
									<div class="h-16 w-16 rounded-full bg-gray-200 flex items-center justify-center">
										{#if session?.user?.identities?.[0]?.identity_data?.avatar_url}
											<img
												src={session.user.identities[0].identity_data.avatar_url}
												alt={session.user.email ?? 'Profile picture'}
												class="h-16 w-16 rounded-full object-cover"
											/>
										{:else}
											<svg
												class="h-10 w-10 text-gray-400"
												fill="currentColor"
												viewBox="0 0 24 24"
											>
												<path
													d="M24 20.993V24H0v-2.996A14.977 14.977 0 0112.004 15c4.904 0 9.26 2.354 11.996 5.993zM16.002 8.999a4 4 0 11-8 0 4 4 0 018 0z"
												/>
											</svg>
										{/if}
									</div>
								</div>
							</div>
							<div>
								<h2 class="text-xl font-bold leading-6 text-gray-900">
									{session?.user?.email ?? 'Welcome'}
								</h2>
								<p class="text-sm text-gray-500">{session?.user?.email}</p>
							</div>
						</div>
						<button
							on:click={() => (isEditing = !isEditing)}
							class="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm leading-4 font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
						>
							{isEditing ? 'Cancel' : 'Edit Profile'}
						</button>
					</div>

					{#if isEditing}
						<form on:submit|preventDefault={handleSubmit} class="mt-6 space-y-6">
							<div class="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
								<div class="sm:col-span-3">
									<label for="name" class="block text-sm font-medium text-gray-700">Name</label>
									<input
										type="text"
										name="name"
										id="name"
										bind:value={formData.name}
										class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
									/>
								</div>

								<div class="sm:col-span-3">
									<label for="email" class="block text-sm font-medium text-gray-700">Email</label>
									<input
										type="email"
										name="email"
										id="email"
										bind:value={formData.email}
										disabled
										class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 bg-gray-50 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
									/>
								</div>
							</div>

							<div class="flex justify-end space-x-3">
								<button
									type="submit"
									class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
								>
									Save Changes
								</button>
							</div>
						</form>
					{:else}
						<div class="mt-6 border-t border-gray-200 pt-6">
							<dl class="grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2">
								<div class="sm:col-span-1">
									<dt class="text-sm font-medium text-gray-500">Name</dt>
									<dd class="mt-1 text-sm text-gray-900">{formData.name || 'Not specified'}</dd>
								</div>
								<div class="sm:col-span-1">
									<dt class="text-sm font-medium text-gray-500">Email</dt>
									<dd class="mt-1 text-sm text-gray-900">{formData.email}</dd>
								</div>
							</dl>
						</div>
					{/if}
				</div>
			</div>
		</div>
	</div>
</div> 