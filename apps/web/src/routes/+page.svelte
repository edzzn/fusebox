<script>
	export let data;
	$: ({ countries } = data);
</script>

<h1>Welcome to Supabase!</h1>
<ul>
	{#each countries as country}
		<li>{JSON.stringify(country)}</li>
	{/each}
</ul>