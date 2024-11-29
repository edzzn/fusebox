import type { Session } from '@supabase/supabase-js';
import type { LayoutServerData } from './$types'

export const load: LayoutServerData = async ({ locals: { safeGetSession }, cookies }): Promise<{ session: Session; cookies: Record<string, string> }> => {
  const { session } = await safeGetSession()
  return {
    session,
    cookies: cookies.getAll(),
  }
}