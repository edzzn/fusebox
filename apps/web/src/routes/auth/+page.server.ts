import { redirect } from '@sveltejs/kit'
import type { Actions } from './$types'
import { PostHog } from 'posthog-node'
import { env } from '$env/dynamic/private'

const posthog = new PostHog(
  env.VITE_PUBLIC_POSTHOG_PROJECT_API_KEY,
  { host: env.VITE_PUBLIC_POSTHOG_API_HOST }
)

export const actions: Actions = {
  signup: async ({ request, locals: { supabase } }) => {
    const formData = await request.formData()
    const email = formData.get('email') as string
    const password = formData.get('password') as string

    const { error } = await supabase.auth.signUp({ email, password })

    posthog.capture({
      distinctId: email,
      event: 'signup',
      properties: { email }
    })

    if (error) {
      console.error(error)
      redirect(303, '/auth/error')
    } else {
      redirect(303, '/dashboard')
    }
  },
  login: async ({ request, locals: { supabase } }) => {
    const formData = await request.formData()
    const email = formData.get('email') as string
    const password = formData.get('password') as string

    const { error } = await supabase.auth.signInWithPassword({ email, password })

    posthog.capture({
      distinctId: (await supabase.auth.getUser()).data.user?.id ?? 'anonymous',
      event: 'login'
    })

    if (error) {
      console.error(error)
      redirect(303, '/auth/error')
    } else {
      redirect(303, '/dashboard')
    }
  },
}