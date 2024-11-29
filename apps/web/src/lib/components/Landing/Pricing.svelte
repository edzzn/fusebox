<script lang="ts">
	const plans = [
		{
			name: 'Starter',
			price: '$9',
			features: ['5 Projects', 'Basic Analytics', 'Email Support']
		},
		{
			name: 'Professional',
			price: '$29',
			features: ['Unlimited Projects', 'Advanced Analytics', 'Priority Support']
		},
		{
			name: 'Enterprise',
			price: '$99',
			features: ['Custom Solutions', 'Dedicated Support', 'SLA Guarantee']
		}
	];
</script>

<div id="pricing" class="py-24 bg-white">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="text-center">
			<h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">Pricing Plans</h2>
			<p class="mt-4 text-lg text-gray-500">Choose the perfect plan for your needs</p>
		</div>

		<div class="mt-20 grid grid-cols-1 gap-8 md:grid-cols-3">
			{#each plans as plan}
				<div class="relative p-6 bg-white rounded-lg border border-gray-200">
					<h3 class="text-lg font-medium text-gray-900">{plan.name}</h3>
					<p class="mt-4">
						<span class="text-4xl font-extrabold text-gray-900">{plan.price}</span>
						<span class="text-base font-medium text-gray-500">/month</span>
					</p>
					<ul class="mt-6 space-y-4">
						{#each plan.features as feature}
							<li class="flex items-center">
								<svg
									class="flex-shrink-0 h-5 w-5 text-green-500"
									fill="currentColor"
									viewBox="0 0 20 20"
								>
									<path
										fill-rule="evenodd"
										d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
										clip-rule="evenodd"
									/>
								</svg>
								<span class="ml-2 text-gray-500">{feature}</span>
							</li>
						{/each}
					</ul>
					<a
						href="/auth"
						class="mt-8 block w-full bg-indigo-600 text-center py-2 px-4 border border-transparent rounded-md text-white hover:bg-indigo-700"
					>
						Get Started
					</a>
				</div>
			{/each}
		</div>
	</div>
</div> 