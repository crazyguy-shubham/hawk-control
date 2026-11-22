# HAWK Control

Secure, mobile-first management dashboard for HAWK (Home Area Watch Keeper). This is the **remote control dashboard**, not a video relay; approved TVs stream locally from the building's Hikvision DVR.

## Live dashboard

- Supabase-hosted dashboard: https://kmflfxwcdmcrrlpifffa.supabase.co/functions/v1/hawk-control
- GitHub Pages (once Pages is enabled): https://crazyguy-shubham.github.io/hawk-control/
- Protected administrative API: https://kmflfxwcdmcrrlpifffa.supabase.co/functions/v1/hawk-admin

## Features

- Email-link administrator sign-in (Supabase Auth)
- TV registration, approval and manual suspension
- Per-TV display mode and camera source assignment
- Device last-check-in indicator and configuration revision
- DVR / RTSP source registration without exposing saved passwords in the UI
- Responsive desktop/mobile navigation, manual and periodic refresh
- CCTV playback continues on installed TVs without this dashboard running

## Security

The frontend only contains a **public Supabase publishable key**. Never put a service-role/secret key in the browser or repository. The backend checks Supabase's authenticated user against `public.hawk_administrators` before returning or changing device data; API data is not directly exposed by anonymous database access. Database tables have RLS enabled. Administrators must sign in using an approved account. Configure Supabase Auth URL allow-list for the final dashboard address before using magic links.

## Deployment

The dashboard is a plain static `index.html` so it can be served by GitHub Pages or any HTTPS static host. The same HTML is currently served by the `hawk-control` Supabase Edge Function. The `hawk-admin` and `hawk-device` Edge Functions are existing backend services and must remain active. Configure Pages in Settings → Pages (choose GitHub Actions) if the repository site is not yet enabled. The included workflow then publishes on pushes to main.

**No paid GitHub plan, cloud media proxy, or laptop-running requirement for the dashboard.** Supabase service usage is subject to the project's limits.

## Status

The hosted function has been deployed. Browser end-to-end administrator sign-in and TV configuration should be tested with the existing approved account; do not assume a TV is currently playing merely because its configuration says enabled.
