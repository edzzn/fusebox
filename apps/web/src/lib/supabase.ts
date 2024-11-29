import { createClient } from '@supabase/supabase-js';

const options = {
	auth: {
		autoRefreshToken: true,
		persistSession: true,
		detectSessionInUrl: true
	},
	db: {
		schema: 'public'
	}
};

const supabaseUrl = import.meta.env.VITE_PUBLIC_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_PUBLIC_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
	throw new Error('Missing Supabase environment variables. Please check your .env file.');
}

const supabase = createClient(supabaseUrl, supabaseAnonKey, options);

export default supabase;
