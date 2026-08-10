# Security Baseline

- Do not place KNET secrets in Flutter clients.
- Payment initialization and callback verification must run on a trusted backend.
- Role claims must be validated server-side and in Firestore rules.
- Financial records must be immutable from customer/provider clients.
- Use separate Firebase projects for development, staging, and production.
- Enable App Check, logging, backups, and rate limiting before launch.
