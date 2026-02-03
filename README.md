# AI-Assisted Coding: Best Practices

A curated collection of best practices for AI-assisted coding, gathered from subject matter experts and top engineers.

## Philosophy

This repo captures hard-won lessons from practitioners who ship production code with AI assistance daily. No theory — just what works.

## Structure

```
├── practices/           # Core best practices
│   ├── claude-md-rules.md
│   ├── agent-workflows.md
│   └── ...
├── scripts/             # Utility scripts for AI-assisted workflows
│   └── git-worktrees.sh
└── sources/             # Attribution and links to original sources
```

## Quick Start: Add These to Your CLAUDE.md

```markdown
## Rules

1. Before writing any code, describe your approach and wait for approval. 
   Ask clarifying questions if requirements are ambiguous.

2. If a task requires changes to more than 3 files, stop and break it 
   into smaller tasks first.

3. After writing code, list what could break and suggest tests to cover it.

4. When there's a bug, start by writing a test that reproduces it, 
   then fix it until the test passes.

5. Every time I correct you, add a new rule to this file so it never 
   happens again.
```

## Key Principles

### Outcome-Based Instructions
Switch from task-based ("implement this like this") to outcome-based ("fix this", "build this"). Agents can design, not just execute.

### Run Dangerously (With Protection)
You're not getting the full agent experience if you babysit every permission. Make your machine disposable — able to recover in minutes if things go wrong.

### Embrace Exploratory Work
Overly detailed upfront planning is an antipattern. Kick off exploratory expeditions, then refine. You don't know what you want until you see it running.

### Concurrent Expeditions
Waiting on agents is the new "waiting on the compiler." Use git worktrees to run multiple experiments in parallel.

## Contributing

Found a practice that works? Open a PR with:
1. The practice (clear, actionable)
2. Source attribution
3. Context on when/why it works

## Sources

See [sources/](./sources/) for full attribution to the engineers and experts whose insights are captured here.
