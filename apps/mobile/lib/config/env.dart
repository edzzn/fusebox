class Env {
  static const supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'http://127.0.0.1:54321',
  );

  static const supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
  );

  static const posthogApiHost = String.fromEnvironment(
    'POSTHOG_API_HOST',
    defaultValue: 'https://us.i.posthog.com',
  );

  static const posthogPersonProfiles = String.fromEnvironment(
    'POSTHOG_PERSON_PROFILES',
    defaultValue: 'identified_only',
  );

  static const posthogProjectApiKey = String.fromEnvironment(
    'POSTHOG_PROJECT_API_KEY',
    defaultValue: 'phc_OK0gGltq5yL2XBWWSyCWtF8wGQISuSl20swJLJjWxgG',
  );
}
