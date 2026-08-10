# Architecture

The base project uses a feature-first structure with explicit layers:

- `presentation`: Flutter UI and controllers
- `domain`: entities, repository contracts, business services
- `data`: concrete repository implementations
- `core`: shared configuration, theme, and failures
- `shared`: reusable widgets

The included in-memory checkout repository exists only to keep the base project runnable. It must be replaced by a secure backend API implementation before production.
