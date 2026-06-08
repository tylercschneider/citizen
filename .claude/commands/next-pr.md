---
description: Start the next PR cleanly — read state, grab the next open issue, follow the dev process, finish with a PR
---

You are starting a fresh PR cycle. Do these in order, no shortcuts:

1. **Read `start_here.md`** (repo root) for current state, what's merged, and what's next.
2. **Read `docs/develop_process_rules.md`** and follow it exactly for this whole cycle (strict TDD: one assertion per test, watch each fail for the right reason before writing code, one behavior per commit; feature branch + PR; ≤8–10 files; lint + tests green before opening the PR; never two open PRs).
3. **Confirm `main` is clean and current**: `git checkout main && git pull`. If a previous PR is still open and unmerged, STOP and tell me — do not start a second PR.
4. **Grab the next issue**: `gh issue list --state open`. Take the lowest-numbered open issue unless I named a specific one. `gh issue view <n>` and restate its acceptance criteria back to me before coding.
5. **Branch**: `git checkout -b feat/<short-slug>` off fresh `main`. Confirm with `git branch --show-current`.
6. **Build it** in TDD cycles, one commit per behavior. Run the linter and full test suite. Watch every CI check go green.
7. **Open the PR** against `main`, body closing the issue (`Closes #<n>`).
8. **Update `start_here.md`** to reflect the new state (mark the issue's PR open/awaiting merge, note what's next).
9. **Stop at the merge gate** — do not start the next issue until I merge.

If anything in `start_here.md` conflicts with the issues, trust the issues and flag the discrepancy.
