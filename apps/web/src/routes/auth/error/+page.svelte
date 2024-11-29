<script lang="ts">
	import { page } from '$app/stores';
</script>

<div class="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
	<div class="sm:mx-auto sm:w-full sm:max-w-md">
		<div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
			<div class="text-center">
				<svg
					class="mx-auto h-12 w-12 text-red-500"
					fill="none"
					stroke="currentColor"
					viewBox="0 0 24 24"
				>
					<path
						stroke-linecap="round"
						stroke-linejoin="round"
						stroke-width="2"
						d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
					/>
				</svg>
				<h2 class="mt-4 text-2xl font-bold text-gray-900">Authentication Error</h2>
				<p class="mt-2 text-sm text-gray-600">
					{$page.url.searchParams.get('message') || 'An error occurred during authentication.'}
				</p>
				<div class="mt-6">
					<a
						href="/auth"
						class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
					>
						Return to Sign In
					</a>
				</div>
			</div>
		</div>
	</div>
</div>