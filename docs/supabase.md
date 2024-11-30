# Fusebox Supabase Documentation

## Overview

Supabase configuration and setup for the Fusebox application, handling authentication, database, and storage.

## Database Schema

### Tables

#### Users
```sql
create table public.users (
  id uuid references auth.users primary key,
  email text unique not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);
```

### Row Level Security (RLS)

```sql
-- Users table policies
alter table public.users enable row level security;

create policy "Users can view their own data"
  on public.users for select
  using (auth.uid() = id);

create policy "Users can update their own data"
  on public.users for update
  using (auth.uid() = id);
```

## Authentication

### Configuration

1. **Email Auth**
   - Email confirmation required
   - Password recovery enabled
   - Minimum password length: 6 characters

## Local Development

### Setup

1. **Install Supabase CLI**
   ```bash
   npm install -g supabase-cli
   ```

2. **Start Local Development**
   ```bash
   supabase start
   ```

3. **Database Migrations**
   ```bash
   supabase db reset
   supabase db push
   ```

### Environment Variables

Development:
```env
SUPABASE_URL=http://localhost:54321
SUPABASE_ANON_KEY=your-local-anon-key
```

Production:
```env
SUPABASE_URL=your-project-url
SUPABASE_ANON_KEY=your-production-anon-key
```

## Deployment

### Database Migrations

```bash
# Generate migration
supabase db diff -f migration_name

# Apply migration
supabase db push
```
