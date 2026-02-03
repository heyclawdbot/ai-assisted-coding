# Agent Workflows

Patterns for working effectively with AI coding agents.

## Outcome-Based Instructions

**Old way (task-based):**
> "Implement a function that takes a user ID, queries the database, and returns the user object with their preferences"

**New way (outcome-based):**
> "Fix the bug where user preferences aren't loading on the settings page"

**Why it works:** Agents are increasingly capable of designing solutions, not just executing them. Give them the outcome you want, let them figure out the implementation.

---

## Run Dangerously (With Protection)

```bash
alias cc="claude --dangerously-skip-permissions"
```

**The tradeoff:** You're not getting the full agent experience if you babysit every permission prompt.

**The protection:** Make your machine disposable. Ensure you can be back up and running in minutes if something goes catastrophically wrong.

**What this looks like:**
- Dotfiles in git
- Dev environment reproducible via script
- Work committed frequently
- Cloud backups of anything irreplaceable

---

## Exploratory Expeditions

Overly detailed upfront planning is an antipattern — with agents, just like with humans.

**Pattern:**
1. Kick off an exploratory expedition with a rough goal
2. See what the agent produces
3. Refine and redirect based on what you learn
4. Ask the agent to commit style/approach guidelines to AGENTS.md

**Why:** You don't know what you want until you see something running. Agents take revisions well.

---

## Concurrent Expeditions with Git Worktrees

Waiting on agents is the new "waiting on the compiler." Use that time productively.

**Pattern:**
1. Start agent on task A in main worktree
2. Create new worktree for task B: `ga feature-b`
3. Start agent on task B while A runs
4. Switch between worktrees as agents complete
5. Clean up: `gd` to remove worktree and branch

**Warning:** Don't spin up so many concurrent tasks that you fry your brain with context-switching.

See [scripts/git-worktrees.sh](../scripts/git-worktrees.sh) for the helper functions.

---

## Continuous Agents

The future points to agents that run continuously, not just on-demand.

**Pattern (emerging):**
- Assign high-level work to an agent
- Agent works autonomously
- Agent reports back at appropriate granularity (not every subtask)
- Human reviews and redirects as needed

**Analogy:** Project management is communication. Agents should report at a level of granularity that humans care about — progress, blockers, decisions that need input.

---

## Source

Insights from [David Heinemeier Hansson (DHH)](https://twitter.com/dhh) and Jeremy from 37signals, discussing AI at 37signals.
