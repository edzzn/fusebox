# Fusebox Mobile Documentation

## Overview

Fusebox Mobile is a Flutter application that provides a modern, secure authentication system using Supabase as the backend.

## Architecture

### Project Structure
```
lib/
├── components/        # Reusable UI components
│   └── auth_email_form.dart  # Authentication form component
├── config/           # Configuration files
│   └── env.dart      # Environment configuration
├── screens/          # App screens/pages
│   ├── auth_screen.dart
│   ├── forgot_password_screen.dart
│   └── home_screen.dart
├── services/         # Business logic and services
└── main.dart         # App entry point
```

### Key Components

#### Authentication Flow
- Sign In
- Sign Up
- Password Reset
- Email Verification

#### Environment Configuration
The app uses environment variables for configuration, managed through:
- `config/env.dart`: Default development values
- `.env`: Local development overrides
- Build-time variables for production

## Development Guide

### Environment Setup

1. **Local Development**
   ```bash
   # Copy environment template
   cp .env.example .env
   
   # Update with your Supabase credentials
   SUPABASE_URL=your_local_supabase_url
   SUPABASE_ANON_KEY=your_local_anon_key
   ```

2. **Code Generation**
   ```bash
   # Run build_runner in watch mode for continuous code generation
   flutter pub run build_runner watch --delete-conflicting-outputs
   ```

3. **Running the App**
   ```bash
   # Development with .env file
   flutter run --dart-define-from-file=.env
   
   # Production build with specific values
   flutter build [platform] --dart-define=SUPABASE_URL=url --dart-define=SUPABASE_ANON_KEY=key
   ```
4. **Linting**
   ```bash
   flutter analyze

   dart run custom_lint
   ```

## Deployment

### Production Build

1. **iOS**
   ```bash
   flutter build ios --dart-define=SUPABASE_URL=prod_url --dart-define=SUPABASE_ANON_KEY=prod_key
   ```

2. **Android**
   ```bash
   flutter build appbundle --dart-define=SUPABASE_URL=prod_url --dart-define=SUPABASE_ANON_KEY=prod_key
   ```

3. **Web**
   ```bash
   flutter build web --dart-define=SUPABASE_URL=prod_url --dart-define=SUPABASE_ANON_KEY=prod_key
   ```

### Environment Variables

| Variable          | Description            | Required |
| ----------------- | ---------------------- | -------- |
| SUPABASE_URL      | Supabase project URL   | Yes      |
| SUPABASE_ANON_KEY | Supabase anonymous key | Yes      |

