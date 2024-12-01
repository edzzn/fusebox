-- Seed auth.users table with sample data
BEGIN;

WITH user_values AS (
  SELECT
    uuid_generate_v4() AS id,
    '00000000-0000-0000-0000-000000000000'::uuid AS instance_id,
    'authenticated' AS aud,
    'authenticated' AS role,
    (ROW_NUMBER() OVER ()) || '@gmail.com' AS email,
    crypt('password123', gen_salt('bf')) AS encrypted_password,
    now() AS email_confirmed_at,
    NULL::timestamp AS invited_at,
    '' AS confirmation_token,
    NULL::timestamp AS confirmation_sent_at,
    '' AS recovery_token,
    NULL::timestamp AS recovery_sent_at,
    '' AS email_change_token_new,
    '' AS email_change,
    NULL::timestamp AS email_change_sent_at,
    now()::timestamp AS last_sign_in_at,
    '{"provider":"email","providers":["email"]}'::jsonb AS raw_app_meta_data,
    '{}'::jsonb AS raw_user_meta_data,
    false AS is_super_admin,
    '2022-10-04 03:41:27.391146+00'::timestamp AS created_at,
    '2022-10-04 03:41:27.391146+00'::timestamp AS updated_at,
    NULL AS phone,
    NULL::timestamp AS phone_confirmed_at,
    '' AS phone_change,
    '' AS phone_change_token,
    NULL::timestamp AS phone_change_sent_at,
    '' AS email_change_token_current,
    0 AS email_change_confirm_status,
    NULL::timestamp AS banned_until,
    '' AS reauthentication_token,
    NULL::timestamp AS reauthentication_sent_at
  FROM generate_series(1, 100)
)
INSERT INTO auth.users (
  id,
  instance_id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  invited_at,
  confirmation_token,
  confirmation_sent_at,
  recovery_token,
  recovery_sent_at,
  email_change_token_new,
  email_change,
  email_change_sent_at,
  last_sign_in_at,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  created_at,
  updated_at,
  phone,
  phone_confirmed_at,
  phone_change,
  phone_change_token,
  phone_change_sent_at,
  email_change_token_current,
  email_change_confirm_status,
  banned_until,
  reauthentication_token,
  reauthentication_sent_at
)
SELECT * FROM user_values;

/* Optional: Insert into user_profile table
INSERT INTO public.user_profile (
  id,
  created_at,
  username
)
SELECT
  id,
  now(),
  'USER' || ROW_NUMBER() OVER ()
FROM auth.users;
*/

COMMIT;

BEGIN;

WITH user_profiles AS (
  SELECT
    id,
    'USER' || ROW_NUMBER() OVER () as username
  FROM auth.users
),
user_notes AS (
  SELECT 
    u.id as user_id,
    u.username,
    n.note_num,
    CASE (n.note_num % 5)
      WHEN 0 THEN username || '''s Shopping List: milk, eggs, bread, butter'
      WHEN 1 THEN 'Personal Reminder for ' || username || ': Call mom this weekend'
      WHEN 2 THEN username || '''s Project Meeting Notes'
      WHEN 3 THEN 'Birthday Party Ideas for ' || username
      WHEN 4 THEN username || '''s Reading List: 1984, Dune, Foundation'
    END || ' - Note #' || n.note_num::text AS text,
    NOW() - (RANDOM() * INTERVAL '90 days') AS created_at
  FROM user_profiles u
  CROSS JOIN LATERAL (
    SELECT generate_series(1, 5) AS note_num
  ) n
)
INSERT INTO notes (user_id, text, created_at, updated_at)
SELECT 
  user_id,
  text,
  created_at,
  created_at + (RANDOM() * INTERVAL '5 days')
FROM user_notes;

COMMIT;