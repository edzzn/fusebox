# Fusebox Web (SvelteKit)

## Overview
The web interface for Fusebox, built with SvelteKit and integrated with Supabase for authentication and data management.

## Tech Stack
- SvelteKit
- TypeScript
- Tailwind CSS
- Supabase
- Playwright (E2E Testing)
- Vitest (Unit Testing)

## Development Setup

### Prerequisites
- Node.js (v18+)
- pnpm

### Installation
```bash
# Install dependencies
pnpm install

# Copy environment template
cp .env.example .env

# Update environment variables
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### Development Server
```bash
# Start development server
pnpm dev

# Start with network access
pnpm dev --host
```

### Building
```bash
# Type checking
pnpm check

# Build for production
pnpm build

# Preview production build
pnpm preview
```


## Project Structure
```
src/
├── lib/            # Shared utilities and components
│   ├── components/ # Reusable UI components
│   ├── stores/     # Svelte stores
│   └── utils/      # Helper functions
├── routes/         # SvelteKit routes/pages
├── hooks.server.ts # Server-side hooks
└── app.d.ts        # TypeScript declarations
```
