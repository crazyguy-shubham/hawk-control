# HAWK Control

Secure, mobile-first management dashboard for HAWK (Home Area Watch Keeper). This is the **remote control dashboard**, not a video relay; approved TVs stream locally from the building's Hikvision DVR.

## Live dashboard

- Primary live dashboard (GitHub Pages): https://crazyguy-shubham.github.io/hawk-control/
- Legacy Supabase dashboard address redirects to the GitHub Pages site: https://kmflfxwcdmcrrlpifffa.supabase.co/functions/v1/hawk-control
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

The dashboard is a plain static `index.html` so it can be served by GitHub Pages or any HTTPS static host. GitHub Pages is active, with a successful deployment verified in GitHub Actions. Supabase Edge Functions cannot directly serve HTML from their standard domains (they rewrite it as plain text), so `hawk-control` now redirects to Pages. The existing `hawk-admin` and `hawk-device` API functions must remain active. The included workflow publishes on pushes to main.

**No paid GitHub plan, cloud media proxy, or laptop-running requirement for the dashboard.** Supabase service usage is subject to the project's limits.

## Status

The GitHub Pages workflow completed successfully on 22 November 2026. Browser end-to-end administrator sign-in and TV configuration should still be tested with the existing approved account; do not assume a TV is currently playing merely because its configuration says enabled.
