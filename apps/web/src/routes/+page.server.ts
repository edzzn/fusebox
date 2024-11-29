import type { PageServerLoad } from './$types'

export const load: PageServerLoad = async ({ locals: { supabase, session } }) => {
  const { data: countries } = await supabase.from('test').select('*').limit(5)
  return { countries: countries ?? [], session: session }
}