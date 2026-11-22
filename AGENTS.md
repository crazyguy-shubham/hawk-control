# HAWK Control contributor instructions

## Scope and safety
- This repository hosts the HAWK administrator dashboard. It does not carry CCTV video.
- Preserve existing Supabase authentication, administrator authorization, secure device approval and DVR source handling. Do not put credentials or service-role keys in browser code.
- Prioritize the working Monday 23 November 2026 silent, fullscreen Channel Zero Android TV pilot. Design work must not interfere with its behavior or delivery.
- Do not redesign the TV player's playback UI: the pilot intentionally has no controls, menus or overlays.

## UI development workflow
- Whenever changing dashboard layout, colors, typography, icons, motion, labels or other visible UI, read and use the checked-in `$unslop` skill in `.agents/skills/unslop/SKILL.md`.
- Follow its visual audit, product-derived direction and relevant design passes. In polish mode, retain strong existing design choices. Do not unilaterally override the approved HAWK hawk-and-camera logo or established black/charcoal and red identity.
- Preserve feature behavior and test responsiveness, accessible contrast, keyboard focus, sign-in and configuration workflows after a UI edit.
- Keep video streaming, infrastructure, security and bug-fix tasks separate from Unslop, unless they also change visible dashboard UI.
- The skill is design guidance, not a substitute for functional tests or security review.
