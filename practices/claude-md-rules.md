# CLAUDE.md Rules

Rules to add to your `CLAUDE.md` (or `AGENTS.md`) file that improve AI-assisted coding outcomes.

## Core Rules

### 1. Describe Before Coding

```markdown
Before writing any code, describe your approach and wait for approval. 
Always ask clarifying questions before writing any code if requirements are ambiguous.
```

**Why:** Prevents wasted iterations. Catches misunderstandings before code is written.

### 2. Limit Scope Per Task

```markdown
If a task requires changes to more than 3 files, stop and break it into smaller tasks first.
```

**Why:** Large changes are harder to review, easier to break, and compound errors. Small, focused changes are easier to validate and revert.

### 3. Proactive Risk Assessment

```markdown
After writing code, list what could break and suggest tests to cover it.
```

**Why:** Forces the agent to think about edge cases. Surfaces potential issues before they hit production.

### 4. Test-First Bug Fixes

```markdown
When there's a bug, start by writing a test that reproduces it, then fix it until the test passes.
```

**Why:** Ensures the bug is actually fixed. Prevents regression. Documents the failure mode.

### 5. Self-Improving Rules

```markdown
Every time I correct you, add a new rule to this file so it never happens again.
```

**Why:** The CLAUDE.md file becomes a living document that encodes your preferences and catches repeated mistakes.

---

## Additional Rules (Add as Needed)

### Code Style
```markdown
Follow the existing code style in this repository. When in doubt, match the surrounding code.
```

### Commit Messages
```markdown
Write commit messages in imperative mood ("Add feature" not "Added feature").
Keep the first line under 50 characters.
```

### Dependencies
```markdown
Do not add new dependencies without explicit approval. If a dependency is needed, explain why and list alternatives.
```

### Error Handling
```markdown
Always handle errors explicitly. Never silently swallow exceptions.
```

---

## Source

Original rules from [Santiago Valdarrama](https://twitter.com/svpino), adapted and expanded.
