import { writable } from 'svelte/store'
import type { User } from '@supabase/supabase-js'
import supabase from './supabase'

export const user = writable<User | null>(null)

// Initialize the store with the current session
supabase.auth.getSession().then(({ data: { session } }) => {
  user.set(session?.user ?? null)
})

// Listen for auth changes
supabase.auth.onAuthStateChange((event, session) => {
  user.set(session?.user ?? null)
}) 