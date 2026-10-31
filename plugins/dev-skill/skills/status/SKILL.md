---
name: status
description: >
  Shows where every piece of work sits in the dev-skill pipeline and what
  the next command is. Use when the user asks "where are we", "what's next",
  "pipeline status", "which specs are in flight", or types /status.
---

# Status

One section per epic with a table of its stories, then one section of
stories that belong to no epic. Each row: version, stage, next command. No
prose essays.

## Steps

1. **Scan the docs.** Read the header line (Version, Status) of every spec,
   grouped by shape:
   - **Epic:** a `docs/specs/{name}/` directory. `spec.md` is the epic
     overview; each `spec-{story}.md` beside it is a child story.
   - **Standalone story:** a top-level `docs/specs/{name}.md`.

   Note `docs/specs/archive/` separately. List `docs/discovery/*.md` briefs
   that have no matching spec.

2. **Map status → next step:**

   | Status    | Next                                             |
   | --------- | ------------------------------------------------ |
   | (brief only) | `/spec` — turn the discovery brief into a spec |
   | Draft     | your review, then `/refine`                      |
   | Refined   | your review, then `/build`                       |
   | Built     | `/quality`, then `/security`, then `/ship`       |
   | Shipped   | done — `/discover` or `/spec` starts the next iteration |
   | Parked    | paused on purpose — resume by setting Status back to the stage it was at |

   The mapping applies per story. An epic's own status is the overview's
   header — never derive it from its stories.

   Cross-check `Built` against reality: if the branch for it doesn't exist
   or tests were never run, say so instead of trusting the label.

3. **Report.** Epics first, then standalone stories:

   - One section per epic: a heading with the epic name, version and status,
     a one-line progress count (e.g. "3/5 stories Built"), then a table of
     its stories (story · version · status · next).
   - A final **Stories (no epic)** section with the same table for standalone
     specs.
   - Discovery briefs with no spec as a short list at the end.

   Add one line for anything stale or contradictory (e.g. two specs for the
   same feature outside archive/). The report is the index — no file is
   written.
