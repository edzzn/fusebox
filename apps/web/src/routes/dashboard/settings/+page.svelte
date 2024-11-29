<script lang="ts">
	import { page } from '$app/stores';
	import type { PageData } from './$types';

	export let data: PageData;

	// Mock active section handling
	let activeSection = 'notifications';
	const sections = ['account', 'notifications', 'security', 'billing'];

	// Mock form data
	let accountForm = {
		name: 'John Doe',
		email: 'john@example.com',
		language: 'English',
		timezone: 'UTC-5'
	};

	let notificationSettings = {
		emailNotifications: true,
		pushNotifications: false,
		marketingEmails: true,
		weeklyDigest: true
	};

	let securitySettings = {
		twoFactorAuth: false,
		sessionTimeout: '30 minutes',
		lastPasswordChange: '2 months ago'
	};
</script>

<div class="bg-gray-50 min-h-screen">
	<header class="bg-white shadow">
		<div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
			<h1 class="text-3xl font-bold text-gray-900">Settings</h1>
		</div>
	</header>

	<main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
		<div class="flex flex-col md:flex-row gap-6">
			<!-- Settings Navigation -->
			<nav class="md:w-64 bg-white shadow rounded-lg p-4 h-fit">
				<ul class="space-y-1">
					{#each sections as section}
						<li>
							<button
								class="w-full text-left px-4 py-2 rounded-md {activeSection === section
									? 'bg-indigo-50 text-indigo-600'
									: 'text-gray-700 hover:bg-gray-50'}"
								on:click={() => (activeSection = section)}
							>
								{section.charAt(0).toUpperCase() + section.slice(1)}
							</button>
						</li>
					{/each}
				</ul>
			</nav>

			<!-- Settings Content -->
			<div class="flex-1">
				<div class="bg-white shadow rounded-lg">
					{#if activeSection === 'account'}
						<div class="p-6">
							<h2 class="text-xl font-semibold text-gray-900 mb-6">Account Settings</h2>
							<form class="space-y-6">
								<div>
									<label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
									<input
										type="text"
										id="name"
										bind:value={accountForm.name}
										class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									/>
								</div>
								<div>
									<label for="email" class="block text-sm font-medium text-gray-700">Email</label>
									<input
										type="email"
										id="email"
										bind:value={accountForm.email}
										class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									/>
								</div>
								<div>
									<label for="language" class="block text-sm font-medium text-gray-700">Language</label>
									<select
										id="language"
										bind:value={accountForm.language}
										class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									>
										<option>English</option>
										<option>Spanish</option>
										<option>French</option>
									</select>
								</div>
								<div>
									<label for="timezone" class="block text-sm font-medium text-gray-700">Timezone</label>
									<select
										id="timezone"
										bind:value={accountForm.timezone}
										class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									>
										<option>UTC-5</option>
										<option>UTC+0</option>
										<option>UTC+1</option>
									</select>
								</div>
							</form>
						</div>
					{:else if activeSection === 'notifications'}
						<div class="p-6">
							<h2 class="text-xl font-semibold text-gray-900 mb-6">Notification Preferences</h2>
							<div class="space-y-4">
								{#each Object.entries(notificationSettings) as [key, value]}
									<div class="flex items-center justify-between">
										<span class="text-sm font-medium text-gray-700">
											{key.replace(/([A-Z])/g, ' $1').replace(/^./, (str) => str.toUpperCase())}
										</span>
		
									<button
										class={`relative inline-flex h-6 w-20 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 ${
											value ? 'bg-indigo-600' : 'bg-gray-200'
										}`}
										role="checkbox"
										aria-checked={value}
										aria-label={`Toggle ${key.replace(/([A-Z])/g, ' $1').replace(/^./, (str) => str.toUpperCase())}`}
										on:click={() => (notificationSettings[key as keyof typeof notificationSettings] = !value)}
									>
										<span
											class={`pointer-events-none inline-block h-5 w-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out ${
												value ? 'translate-x-5' : 'translate-x-0'
											}`}
										></span>
									</button>

									</div>
								{/each}
							</div>
						</div>
					{:else if activeSection === 'security'}
						<div class="p-6">
							<h2 class="text-xl font-semibold text-gray-900 mb-6">Security Settings</h2>
							<div class="space-y-6">
								<div class="flex items-center justify-between">
									<div>
										<h3 class="text-sm font-medium text-gray-700">Two-Factor Authentication</h3>
										<p class="text-sm text-gray-500">Add an extra layer of security to your account</p>
									</div>
									<button
										class={`relative inline-flex h-6 w-11 flex-shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 ${
											securitySettings.twoFactorAuth ? 'bg-indigo-600' : 'bg-gray-200'
										}`}
										role="switch"
										aria-checked={securitySettings.twoFactorAuth}
										aria-label="Toggle Two-Factor Authentication"
										on:click={() =>
											(securitySettings.twoFactorAuth = !securitySettings.twoFactorAuth)}
									>
										<span
											class={`pointer-events-none inline-block h-5 w-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out ${
												securitySettings.twoFactorAuth ? 'translate-x-5' : 'translate-x-0'
											}`}
										></span>
									</button>
								</div>
								<div>
									<h3 class="text-sm font-medium text-gray-700">Password</h3>
									<p class="text-sm text-gray-500">Last changed {securitySettings.lastPasswordChange}</p>
									<button
										class="mt-2 inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm leading-4 font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
										aria-label="Change Password"
									>
										Change Password
									</button>
								</div>
								<div>
									<h3 class="text-sm font-medium text-gray-700">Session Timeout</h3>
									<select
										bind:value={securitySettings.sessionTimeout}
										class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
									>
										<option>15 minutes</option>
										<option>30 minutes</option>
										<option>1 hour</option>
										<option>4 hours</option>
									</select>
								</div>
							</div>
						</div>
					{:else if activeSection === 'billing'}
						<div class="p-6">
							<h2 class="text-xl font-semibold text-gray-900 mb-6">Billing Settings</h2>
							<div class="space-y-6">
								<div class="bg-gray-50 p-4 rounded-lg">
									<h3 class="text-sm font-medium text-gray-700">Current Plan</h3>
									<p class="mt-1 text-sm text-gray-500">Free Tier</p>
									<button
										class="mt-3 inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
									>
										Upgrade Plan
									</button>
								</div>
								<div>
									<h3 class="text-sm font-medium text-gray-700">Payment Method</h3>
									<p class="text-sm text-gray-500">No payment method added</p>
									<button
										class="mt-2 inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm leading-4 font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
									>
										Add Payment Method
									</button>
								</div>
							</div>
						</div>
					{/if}

					<!-- Save Button -->
					<div class="px-6 py-4 bg-gray-50 border-t border-gray-200 rounded-b-lg">
						<button
							type="submit"
							class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
						>
							Save Changes
						</button>
					</div>
				</div>
			</div>
		</div>
	</main>
</div> 