# Fusebox

## Overview
Fusebox is a modern, full-stack application providing secure authentication and real-time data management. It consists of a Flutter mobile application and a SvelteKit web interface, both powered by Supabase backend.

## Repository Structure
```
├── docs/           # Documentation
├── mobile/         # Flutter mobile application
├── web/            # SvelteKit web application
└── shared/         # Shared utilities and types
```

## Quick Start

### Prerequisites
- Flutter (latest stable)
- Node.js (v18+)
- pnpm
- Supabase CLI

## Documentation
- [Web Documentation](sveltekit.md)
- [Mobile Documentation](flutter.md)
- [API Documentation](supabase.md)

## Architecture
- **Frontend**: Flutter (Mobile), SvelteKit (Web)
- **Backend**: Supabase
- **Authentication**: Supabase Auth
- **Database**: PostgreSQL (via Supabase)
- **Storage**: Supabase Storage
- **Real-time**: Supabase Realtime