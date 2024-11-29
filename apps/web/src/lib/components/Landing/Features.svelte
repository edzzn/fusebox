<script lang="ts">
	const features = [
		{
			title: 'Easy Integration',
			description: 'Seamlessly integrate with your existing tools and workflows.',
			icon: '🔄'
		},
		{
			title: 'Real-time Analytics',
			description: 'Get instant insights with our powerful analytics dashboard.',
			icon: '📊'
		},
		{
			title: 'Secure & Reliable',
			description: 'Enterprise-grade security to keep your data safe and accessible.',
			icon: '🔒'
		}
	];
</script>

<div id="features" class="py-24 bg-gray-50">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="text-center">
			<h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">Features</h2>
			<p class="mt-4 text-lg text-gray-500">Everything you need to succeed</p>
		</div>

		<div class="mt-20 grid grid-cols-1 gap-8 md:grid-cols-3">
			{#each features as feature}
				<div class="relative p-6 bg-white rounded-lg shadow-md">
					<div class="text-4xl mb-4">{feature.icon}</div>
					<h3 class="text-lg font-medium text-gray-900">{feature.title}</h3>
					<p class="mt-2 text-base text-gray-500">{feature.description}</p>
				</div>
			{/each}
		</div>
	</div>
</div> 