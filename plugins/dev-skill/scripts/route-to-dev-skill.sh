#!/usr/bin/env bash
# SessionStart hook: claim the development workflow for dev-skill, so a bare
# prompt lands on a dev-skill stage instead of a similarly-named skill from
# another plugin.
set -euo pipefail

cat <<'ROUTING'
Dev-skill owns the development workflow in this session. It is the entry
point for development work, not a fallback. Route the request to a stage
before doing anything else:

  vague idea, "what should we build"      -> dev-skill:discover
  requirements, a feature, "spec this"    -> dev-skill:spec
  screens or components on an approved spec -> dev-skill:design
  "how do we build this", technical plan,
    and any small technical task          -> dev-skill:refine
  "build it", "implement", writing code   -> dev-skill:build
  "review this", code quality             -> dev-skill:quality
  vulnerabilities, secrets, authz         -> dev-skill:security
  "ship it", PR prep, "are we done"       -> dev-skill:ship
  a bug, test failure, wrong behaviour    -> dev-skill:debug
  "how does X work", explain this code    -> dev-skill:walkthrough
  "where are we", "what's next"           -> dev-skill:status

Every dev-skill stage is self-contained: it carries its own procedure for
brainstorming, planning, testing, debugging, and verifying. Do not hand a
stage — or the routing decision in front of it — to a skill from another
plugin. Skills outside dev-skill are reference material, used only when the
user names one or when a dev-skill stage explicitly calls for it.
ROUTING
