# Unslop for HAWK / Codex

The complete `heydamir/unslop` skill is included under `.agents/skills/unslop` for repository-scoped Codex discovery. Source: https://github.com/heydamir/unslop, pinned to upstream commit `620163eedb3529d9cd23a3994ed8d287d06f760d` (checked on 23 Nov 2026). Original credit: Damir Sokolovsky. Licensed CC BY 4.0; license is included in the skill directory.

## Usage

Open this GitHub repository in Codex, then ask: `$unslop audit the HAWK admin dashboard`. The skill is discoverable from the project; no separate installation is necessary for this repository. If Codex is already running and doesn't see the new skill, restart it.

For all local Codex projects on a Windows laptop, clone this repository and run `powershell -NoProfile -File .\scripts\install-unslop-codex.ps1` from the repository root. The script copies the bundled skill into `$HOME\.agents\skills\unslop`, backs up an existing copy, and does not require administrator rights or network access. The user must run it on their own device; checking in a project skill does **not** install it on that device.

The skill can examine web UIs and local app screens. Optional screenshot and story-video support needs Playwright and, for videos, ffmpeg; these are **not** installed by this change.

HAWK's Android TV playback MVP is deliberately fullscreen and control-free. Do not run a UI redesign on the TV playback screen; use Unslop for the administrator dashboard and later optional control interfaces. Always preserve existing auth and device-management behavior; run tests after visual changes.

This commit only adds Codex development assets; it does not modify `index.html`, cloud APIs, database policies or Android TV playback code.
