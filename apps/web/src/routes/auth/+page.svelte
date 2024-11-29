<script>
	let isLogin = true;
</script>

<div class="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
	<div class="sm:mx-auto sm:w-full sm:max-w-md">
		<h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
			{isLogin ? 'Sign in to your account' : 'Create your account'}
		</h2>
		<p class="mt-2 text-center text-sm text-gray-600">
			{#if isLogin}
				Don't have an account?
				<button
					on:click={() => (isLogin = false)}
					class="font-medium text-indigo-600 hover:text-indigo-500"
				>
					Sign up
				</button>
			{:else}
				Already have an account?
				<button
					on:click={() => (isLogin = true)}
					class="font-medium text-indigo-600 hover:text-indigo-500"
				>
					Sign in
				</button>
			{/if}
		</p>
	</div>

	<div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
		<div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
			<form method="POST" action={isLogin ? '?/login' : '?/signup'} class="space-y-6">
				<div>
					<label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
					<div class="mt-1">
						<input
							id="email"
							name="email"
							type="email"
							required
							class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
						/>
					</div>
				</div>

				<div>
					<label for="password" class="block text-sm font-medium text-gray-700">Password</label>
					<div class="mt-1">
						<input
							id="password"
							name="password"
							type="password"
							required
							class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
						/>
					</div>
				</div>

				<div>
					<button
						type="submit"
						class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
					>
						{isLogin ? 'Sign in' : 'Sign up'}
					</button>
				</div>
			</form>
		</div>
	</div>
</div>