---
date: 2025-11-15T18:19:43+0000
researcher: Jorge Castro
git_commit: 6aa3cf1b650c930989ad391774b661db953d35b2
branch: master
repository: nikeyes.github.io
topic: "Research for stepwise-dev blog post"
tags: [research, stepwise-dev, claude-code, context-engineering, blog-post]
status: complete
last_updated: 2025-11-15
last_updated_by: Jorge Castro
---

# Research: Stepwise-dev Blog Post Content

**Date**: 2025-11-15 19:19:43 CET
**Researcher**: Jorge Castro
**Git Commit**: 6aa3cf1b650c930989ad391774b661db953d35b2
**Branch**: master
**Repository**: nikeyes.github.io

## Research Question

Gather comprehensive information to write a Spanish blog post about the stepwise-dev plugin with the following structure:
1. IDE configuration (Claude Code, CLAUDE.md)
2. Context window vs attention window concepts
3. How to use stepwise-dev
4. Advantages of stepwise-dev vs plain prompting

## Summary

The stepwise-dev plugin is a comprehensive Claude Code plugin that implements a structured Research → Plan → Implement → Validate workflow with advanced context management. It provides 6 slash commands, 5 specialized agents, and a thoughts management system that enables developers to maintain context below 60% while shipping production-quality code in complex codebases.

Key findings:
- **IDE Configuration**: Requires Claude Code with CLAUDE.md for architecture/design rules
- **Context Management**: Empirical evidence shows >60% context leads to errors
- **Workflow**: Structured 4-phase approach with frequent intentional compaction
- **Advantages**: 10x productivity in brownfield codebases with maintained code quality

## Detailed Findings

### Section 1: IDE Configuration Best Practices

#### Claude Code Setup

**What is Claude Code:**
- Official CLI tool from Anthropic for AI-assisted development
- Provides terminal-based interface with file operations, bash commands, and code execution
- Supports plugins, slash commands, and Agent Skills
- Location: Available at https://code.claude.com/

**Essential Configuration:**

1. **CLAUDE.md Global Configuration** (`~/.claude/CLAUDE.md`):
   - Contains global development guidelines that apply to all projects
   - User's current configuration emphasizes TDD workflow:
     - Core Principles: Tests Pass → Reveals Intention → No Business Logic Duplication → Fewest Elements
     - TDD Workflow: Red → Green → Refactor
     - Testing: Test behavior not implementation, avoid mocks, simplest failing test first
     - Code Quality: Descriptive names, one responsibility per component
   - Reference: User's CLAUDE.md available at https://github.com/nikeyes (link to be verified)

2. **Project-specific Configuration** (`.claude/CLAUDE.md`):
   - Per-project architecture and design rules
   - Overrides or extends global configuration
   - Should contain project-specific patterns, conventions, and constraints

3. **Plugin Installation**:
   - Install stepwise-dev from Claude Code marketplace
   - Plugin provides slash commands and agents automatically
   - No manual configuration needed after installation

**Why This Configuration Matters:**

According to the notes from `thoughts/nikey_es/notes/context-engineering.md`:
- "The more you use the context window, the worse the outcomes you'll get" (Geoff Huntley)
- CLAUDE.md provides persistent rules without consuming conversation context
- Architecture guidelines in CLAUDE.md prevent repeated explanations of design patterns
- Enables Claude to work within team conventions without explicit prompting

**Insufficient Configuration:**

Just having CLAUDE.md is NOT enough for quality, maintainable software. You also need:
- Structured workflow (provided by stepwise-dev)
- Context management discipline (research → plan → implement → validate)
- Thoughts directory system for knowledge retention
- Team collaboration patterns

### Section 2: Context Window vs Attention Window

#### Key Concepts

**Context Window:**
- Total amount of tokens (input + output) a model can process in one request
- Current models (as of 2025):
  - Claude Sonnet 4.5: 200,000 tokens (~150,000 words)
  - GPT-4 Turbo: 128,000 tokens
  - Gemini 1.5 Pro: 1,000,000 tokens

**Attention Window:**
- The portion of context window the model actually "pays attention to" effectively
- Smaller than context window
- Quality degrades as context fills up
- Models struggle to maintain coherence across full context

#### Empirical Evidence of Context Issues

**From Ashley Ha's Medium Article** (`thoughts/nikey_es/notes/I mastered the Claude Code workflow.txt`):

1. **The 60% Rule:**
   - "My personal rule: never let context exceed 60%"
   - Context at start of new conversation: ~32%
   - If research goes over 60%, clear context
   - Based on empirical observation of outcome quality

2. **Workflow Context Usage:**
   - Research phase: Can reach 70%+ → /clear
   - Plan phase: 67% after iteration → /clear
   - Implement phase: 42% after validation → continue
   - Each phase clears context to maintain quality

**From Dex Horthy's Context Engineering Article** (`thoughts/nikey_es/notes/context-engineering.md`):

1. **Stanford Study Findings:**
   - AI tools lead to significant rework
   - Image shows "code churn" - developers rewriting AI-generated code
   - AI works well for greenfield projects but counter-productive in brownfield codebases

2. **Context Engineering Formula:**
   ```
   Output Quality = (Correctness × Completeness) / (Noise + Missing Info + Incorrect Info)
   ```

3. **Worst Things for Context (in order):**
   - Incorrect information (fatal)
   - Missing information (critical)
   - Too much noise (reduces quality)

4. **Geoff Huntley's Observation:**
   - "You only have approximately 170k of context window to work with"
   - "Essential to use as little as possible"
   - "The more you use the context window, the worse the outcomes"

#### ChatGPT Report Reference

**Note for blog post:** User mentioned "Informe de ChatGPT" about empirical studies showing higher context leads to more errors. This needs to be researched separately or provided by user.

**Placeholder for table:** User will provide a summary table of context and attention windows for different models.

#### Why Context Management Matters

**From Agent Skills Documentation** (`thoughts/nikey_es/notes/claude-code-skills.md`):

1. **Progressive Disclosure Pattern:**
   - Skills load metadata at startup (~100 tokens)
   - Full instructions loaded when triggered (~5k tokens)
   - Resources loaded as needed (effectively unlimited)
   - Total context usage optimized through selective loading

2. **Token Budgets:**
   - Keep SKILL.md under 500 lines
   - Split content into separate files for progressive disclosure
   - Reference files loaded only when needed
   - "The context window is a public good"

**Key Insight:** LLMs are stateless functions. Context window content is the ONLY lever to affect output quality. Therefore, obsessing over context management is not optional—it's fundamental to success.

### Section 3: How to Use Stepwise-dev

#### Overview

Stepwise-dev implements a structured 4-phase workflow:
1. **Research** - Understand codebase without writing code
2. **Plan** - Create detailed implementation plan iteratively
3. **Implement** - Execute plan phase by phase with verification
4. **Validate** - Systematically verify implementation completeness

Each phase produces artifacts saved to `thoughts/` directory for persistent memory.

#### Installation and Setup

1. **Install Plugin:**
   ```bash
   # Install from Claude Code marketplace
   # Or install manually:
   git clone stepwise-dev repo
   ln -s ~/path/to/stepwise-dev ~/.claude/plugins/marketplaces/stepwise-dev
   ```

2. **Initialize Thoughts Directory:**
   ```bash
   # Run once per project
   /stepwise-dev:thoughts-init
   # Or manually:
   bash ~/.claude/plugins/marketplaces/stepwise-dev/skills/thoughts-management/scripts/thoughts-init
   ```

3. **Verify Installation:**
   ```bash
   # Check available commands
   ls ~/.claude/plugins/marketplaces/stepwise-dev/commands/
   # Should show: research_codebase.md, create_plan.md, implement_plan.md, etc.
   ```

#### Phase 1: Research (`/stepwise-dev:research_codebase`)

**Purpose:** Comprehensive codebase understanding WITHOUT writing code.

**Usage:**
```bash
/stepwise-dev:research_codebase How does the current authentication system work?
```

**What Happens:**

1. **Parallel Sub-agent Spawning:**
   - `codebase-locator`: Finds all relevant files (auth*, login*, session*, etc.)
   - `codebase-analyzer`: Analyzes how authentication flow works
   - `codebase-pattern-finder`: Finds existing auth patterns in codebase
   - `thoughts-locator`: Searches for past research on auth
   - `thoughts-analyzer`: Extracts insights from found documents

2. **Document Generation:**
   - Creates `thoughts/shared/research/2025-11-15-authentication-system.md`
   - Includes:
     - Summary of findings
     - Code references with `file.py:123` format
     - Architecture documentation
     - Historical context from past research
     - Open questions

3. **Output:**
   ```
   ✓ Research complete: thoughts/shared/research/2025-11-15-authentication-system.md

   Key findings:
   - Authentication uses JWT tokens (src/auth/jwt_handler.py:45)
   - Session management in Redis (src/auth/session.py:78)
   - Middleware validates tokens (src/middleware/auth.py:23)
   ```

**Context Management:**
- Research agents work in parallel with separate contexts
- Main agent only receives synthesized summary
- Full research saved to thoughts/, not kept in conversation
- Typical context usage: 40-70% → /clear after research

**Critical Rule:** NO code written during research phase. Only documentation.

#### Phase 2: Plan (`/stepwise-dev:create_plan`)

**Purpose:** Create detailed, iterative implementation plan.

**Usage:**
```bash
/stepwise-dev:create_plan @thoughts/shared/research/2025-11-15-authentication-system.md

# Or describe task directly:
/stepwise-dev:create_plan Add OAuth2 social login (Google, GitHub) to existing auth system
```

**Interactive Planning Process:**

1. **Initial Understanding (1st iteration):**
   - Claude reads research document
   - Asks clarifying questions about scope, constraints
   - User provides answers

2. **Design Options (2nd iteration):**
   - Claude presents 2-3 approach options
   - Discusses trade-offs
   - User selects preferred approach

3. **Plan Structure (3rd iteration):**
   - Claude proposes phase breakdown
   - User provides feedback on granularity
   - Refine until structure clear

4. **Detailed Plan (4th-5th iterations):**
   - Claude writes complete plan with:
     - Overview and current state
     - Desired end state
     - Key discoveries from research
     - "What We're NOT Doing" section
     - Multiple implementation phases
     - Each phase has:
       - Changes required with file:line references
       - Code snippets showing what to add/change
       - Automated verification (tests, linting, type checking)
       - Manual verification (ONLY if no automated tests possible)
       - Success criteria
     - Testing strategy
     - Performance considerations
   - User reviews each section
   - Iterate until no open questions remain

5. **Finalization:**
   - Plan saved to `thoughts/shared/plans/2025-11-15-oauth2-social-login.md`
   - Becomes source of truth for implementation

**Example Plan Phase:**
```markdown
## Phase 1: Add OAuth2 Provider Configuration

### Changes Required

1. Create OAuth2 provider configuration
   File: `src/auth/oauth2/providers.py` (new file)

   ```python
   class OAuth2Provider:
       def __init__(self, client_id, client_secret, redirect_uri):
           self.client_id = client_id
           self.client_secret = client_secret
           self.redirect_uri = redirect_uri
   ```

### Success Criteria

**Automated Verification:**
- [ ] Unit tests pass: `pytest src/auth/oauth2/tests/`
- [ ] Linting clean: `make lint`
- [ ] Type checking passes: `make check`

**Manual Verification:**
- NONE (all verification automated via tests)
```

**Context Management:**
- Plan creation is interactive, not one-shot
- Each iteration refines understanding
- Clear context between major plan revisions
- Typical iterations: 5-7 before finalization
- Context usage: 30-60%

**Critical Features:**
- **Be Skeptical:** Question vague requirements, identify issues early
- **Be Interactive:** Get buy-in at each step, don't write full plan in one shot
- **Be Thorough:** Read files completely, research actual patterns
- **No Open Questions:** Must resolve ALL questions before finalizing

#### Phase 3: Implement (`/stepwise-dev:implement_plan`)

**Purpose:** Execute approved plan phase by phase with verification.

**Usage:**
```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth2-social-login.md

# Or specify phase:
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth2-social-login.md Phase 1 only
```

**Implementation Flow:**

1. **Read and Understand:**
   - Read entire plan completely
   - Check for existing checkmarks (`- [x]`)
   - Read all mentioned files fully
   - Create todo list to track progress

2. **Implement Phase 1:**
   - Make changes specified in plan
   - Follow plan's intent while adapting to reality
   - Update checkboxes as sections complete

3. **Automated Verification:**
   - Run all success criteria commands
   - Typical: `make check test`
   - Fix issues before proceeding
   - Check off completed items in plan

4. **Manual Verification (if specified):**
   - ONLY pause if plan has "Manual Verification" section
   - If no manual verification → Continue immediately to Phase 2
   - If manual verification exists → Present checklist, wait for user
   - Example: "Test login with Google account in browser"

5. **Repeat for Each Phase:**
   - One phase at a time
   - Validate before proceeding
   - Update plan file with checkmarks

6. **Completion:**
   - Run final verification: `make check test`
   - All checkboxes marked in plan
   - Sync to thoughts directory

**Context Management:**
- Implement one phase at a time
- Clear context between phases if needed
- Trust completed work is done
- Pick up from first unchecked item when resuming
- Typical context: 40-60% per phase

**Critical Rules:**
- **One Phase at a Time:** Validate before proceeding
- **Follow Plan Intent:** Adapt to reality but stay aligned with plan
- **Stop on Mismatch:** If reality differs from plan, STOP and present issue
- **Trust Completed Work:** Don't re-verify unless something seems off

#### Phase 4: Validate (`/stepwise-dev:validate_plan`)

**Purpose:** Systematically verify implementation against plan.

**Usage:**
```bash
/stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-15-oauth2-social-login.md
```

**Validation Process:**

1. **Gather Evidence:**
   - Check recent commits: `git log --oneline -n 20`
   - Review changes: `git diff HEAD~N..HEAD`
   - Run comprehensive checks: `make check test`

2. **Systematic Validation:**
   - For each phase in plan:
     - Check completion status (checkmarks)
     - Run automated verification commands
     - Document pass/fail status
     - Assess manual criteria if any

3. **Generate Report:**
   ```markdown
   ## Validation Report

   ### Phase 1: Add OAuth2 Provider Configuration
   ✓ All automated tests pass
   ✓ Code follows existing patterns
   ✓ No linting errors
   ⚠️ Performance: OAuth2 token validation adds 50ms latency

   ### Phase 2: Implement Google OAuth Flow
   ✓ Automated verification passed
   ✗ Manual testing: Redirect URI mismatch in Google Console

   ### Recommendations
   1. Fix redirect URI configuration in Google Console
   2. Consider caching OAuth2 tokens to reduce latency
   ```

4. **Manual Testing Checklist:**
   - Lists all manual verification items from plan
   - User performs testing
   - Reports issues found

**Context Management:**
- Fresh context for validation perspective
- Reads plan and recent changes
- Spawns parallel research tasks if needed
- Typical context: 40-50%

**Validation Checklist:**
- All phases marked complete are done
- Automated tests pass
- Code follows existing patterns
- No regressions introduced
- Error handling robust
- Documentation updated
- Manual test steps clear (if any)

#### Additional Commands

**Iterate Plan (`/stepwise-dev:iterate_plan`):**
```bash
/stepwise-dev:iterate_plan @thoughts/shared/plans/2025-11-15-oauth2-social-login.md Add GitHub OAuth provider
```
- Updates existing plan based on feedback
- Surgical edits, not rewrites
- Maintains plan quality and structure

**Commit (`/stepwise-dev:commit`):**
```bash
/stepwise-dev:commit
```
- Creates git commits for session changes
- Logical grouping of related changes
- NO Claude attribution
- Descriptive commit messages

#### Thoughts Directory System

**Purpose:** Persistent knowledge retention across sessions.

**Structure:**
```
thoughts/
├── nikey_es/              # Personal space
│   ├── tickets/          # Ticket documentation
│   └── notes/            # Personal observations
├── shared/               # Team space
│   ├── research/         # Research documents
│   ├── plans/            # Implementation plans
│   └── prs/              # PR descriptions
└── searchable/           # Auto-generated hardlinks
```

**Key Features:**

1. **Hardlink Optimization:**
   - All .md files hardlinked in `searchable/`
   - Fast grep: `grep -r "pattern" thoughts/searchable/`
   - Zero disk space duplication
   - Edit in original location, visible in searchable/

2. **Automatic Sync:**
   - Runs after every research/plan command
   - Creates hardlinks for new files
   - Removes orphaned links
   - Maintains searchable/ directory

3. **Team Collaboration:**
   - Shared research visible to all team members
   - Plans documented and committed to git
   - New developers discover via grep
   - Historical context preserved

**Usage Example:**
```bash
# Find all research about authentication
grep -r "authentication" thoughts/searchable/

# Result:
thoughts/searchable/shared/research/2025-11-15-authentication-system.md:## Authentication Flow
thoughts/searchable/shared/research/2025-10-20-jwt-tokens.md:JWT token validation

# Edit in original location:
# thoughts/shared/research/2025-11-15-authentication-system.md
```

### Section 4: Advantages of Stepwise-dev vs Plain Prompting

#### Comparison Overview

| Aspect | Plain Prompting | Stepwise-dev Workflow |
|--------|----------------|----------------------|
| Context Management | Manual, often exceeds 80% | Structured, maintains <60% |
| Knowledge Retention | Lost between sessions | Persisted in thoughts/ |
| Code Quality | Variable, often requires rework | Consistent, plan-driven |
| Team Alignment | Difficult, relies on PR reviews | Built-in via shared research/plans |
| Complex Codebases | Struggles, gets lost | Excels, structured exploration |
| Productivity | Good for simple tasks | 10x for complex features |

#### Detailed Advantages

**1. Context Engineering at Scale**

**Plain Prompting Problem:**
- Start working on feature → load files → ask questions → get responses
- Add more files for context → ask more questions → hit 95% context
- Half-implemented code with dozen "final_implementation_final_feature.md" files
- Quality degrades as context fills

**Stepwise-dev Solution:**
- Research phase uses parallel agents in separate contexts
- Main context only receives synthesized summary
- Plan saved to thoughts/, not kept in conversation
- Implementation loads only current phase context
- Each phase clears context → fresh start

**Result:** Maintain 40-60% context throughout entire feature development.

**2. Knowledge Retention Across Sessions**

**Plain Prompting Problem:**
- "How does authentication work?" → Long explanation
- Session ends, context lost
- Next day: "How does authentication work again?" → Repeat explanation
- Same questions answered repeatedly

**Stepwise-dev Solution:**
- Research creates `thoughts/shared/research/2025-11-15-authentication-system.md`
- Document persists forever
- Future sessions: Agent searches thoughts/, finds research
- No repeated explanations needed

**Result:** Build organizational knowledge base automatically.

**3. High-Leverage Human Review**

**Plain Prompting Problem:**
- Review 2000 lines of generated code
- Hard to spot design issues
- Difficult to maintain mental alignment
- "Starting to lose touch with what our product was and how it worked" (Dex Horthy)

**Stepwise-dev Solution:**
- Review research document (200 lines) → Catch misunderstandings early
- Review implementation plan (300 lines) → Verify design before coding
- Review code (2000 lines) → Verify implementation matches plan

**Leverage:**
- Bad line of code → 1 bad line
- Bad line of plan → 100s of bad lines
- Bad line of research → 1000s of bad lines

**Result:** Focus human effort on highest-leverage artifacts (research and plans).

**4. Production-Ready Code in Brownfield Codebases**

**Plain Prompting Problem:**
- Stanford study: AI counter-productive in brownfield codebases
- Generates code that doesn't follow existing patterns
- Creates tech debt and "slop"
- Requires significant rework

**Stepwise-dev Solution:**

Real example from Dex Horthy (context-engineering.md):
- 300k LOC Rust codebase (BAML)
- Never touched codebase before
- Fixed bug in 1 hour → PR approved next morning
- Later: Shipped 35k LOC in 7 hours (2 major features)
- Features estimated at 3-5 days each for senior engineer

**How:**
- Research phase finds existing patterns
- Plan phase models new code after existing patterns
- Implementation follows discovered conventions
- Validation verifies alignment with codebase

**Result:** Ship production-quality code in unfamiliar codebases.

**5. Mental Alignment for Teams**

**Plain Prompting Problem:**
- Team member ships 2000-line PR
- Other developers struggle to review
- Mental models diverge
- Team loses shared understanding

**Stepwise-dev Solution:**
- Research documents what exists and how it works
- Plans document what will change and why
- Both committed to git, visible in PRs
- Team members read 200-line plan instead of 2000-line code

**Quote from Blake Smith:**
"The most important part of code review is mental alignment - keeping members of the team on the page as to how the code is changing and why."

**Result:** Team maintains shared understanding even with 10x code velocity.

**6. No Slop, Maintained Quality**

**Plain Prompting Problem:**
- "Tech debt factory"
- Code that passes tests but violates design principles
- Shortcuts that accumulate over time

**Stepwise-dev Solution:**

Success criteria in plans include:
- Automated verification: tests, linting, type checking
- Pattern alignment: follows existing codebase conventions
- Explicit "What We're NOT Doing" sections
- Validation phase catches deviations

**Result from Dex Horthy team:**
- Team of 3 averaging $12k/month on Opus
- Shipping 6 PRs per day per developer
- Code quality maintained (passes expert review)
- Intern shipped 10 PRs on 8th day

**7. Structured Problem-Solving**

**Plain Prompting Problem:**
- Get stuck → ask more questions → add more context
- Circular reasoning
- No clear path forward

**Stepwise-dev Solution:**

Research phase includes "Open Questions":
```markdown
## Open Questions
1. How are OAuth2 tokens refreshed?
   → Need to research token refresh flow
2. Where should we store provider credentials?
   → Check existing secret management
```

Plan phase requires "No Open Questions":
- All questions must be resolved
- No placeholders or TODOs
- Clear path forward before implementation

**Result:** Systematic problem-solving with clear blockers and next steps.

**8. Frequent Intentional Compaction**

**Plain Prompting Approach:**
- Chat back and forth until context full or give up
- Occasionally start over with fresh context
- Manual context management

**Stepwise-dev Approach:**

Every phase is an intentional compaction:
- Research: Compact codebase exploration into research document
- Plan: Compact design decisions into implementation plan
- Implement: Compact plan execution into code + checkmarks
- Validate: Compact verification into validation report

**Quote from Ashley Ha:**
"Context Engineering Is All You Need. It's really not about having more context, it's about having the right context at the right time."

**Result:** Designed workflow around context management, not ad-hoc.

#### Empirical Results

**From Dex Horthy's Context Engineering Article:**

Goals achieved with stepwise-dev workflow:
- ✅ Works in brownfield codebases (300k LOC Rust)
- ✅ Solves complex problems (35k LOC features in 7 hours)
- ✅ No slop (PRs merged, code quality maintained)
- ✅ Maintains mental alignment (specs as source of truth)

**From Ashley Ha's Medium Article:**

Workflow transformation:
- Before: 95% context, half-implemented code, dozens of markdown files
- After: Never exceed 60% context, ship thousands of lines confidently
- "Shifting my focus on context engineering changed that"

**Team Productivity:**
- "Our intern shipped 2 PRs on his first day, and 10 on his 8th day"
- Team shipping 6 PRs per day
- Features shipped in hours that previously took days

#### When Stepwise-dev Might Not Help

**Limitations Identified:**

1. **Very Simple Tasks:**
   - Single-file changes
   - Trivial bug fixes
   - Overhead not justified

2. **Highly Exploratory Work:**
   - Spike investigations
   - Prototyping multiple approaches
   - Research without implementation

3. **Tasks Requiring Deep Domain Expertise:**
   - Example: Removing Hadoop dependencies from Parquet Java (failed attempt)
   - Research didn't go deep enough through dependency tree
   - Need at least one domain expert on team

**Quote from Dex Horthy:**
"There are big hard problems you cannot just prompt your way through in 7 hours."

**Best Fit:**
- Medium to large features in existing codebases
- Refactoring with clear requirements
- Bug fixes requiring codebase understanding
- Features with well-defined scope

## Code References

### Stepwise-dev Plugin Structure
- `~/mordor/personal/stepwise-dev/.claude-plugin/plugin.json` - Plugin configuration
- `~/mordor/personal/stepwise-dev/commands/research_codebase.md` - Research command implementation
- `~/mordor/personal/stepwise-dev/commands/create_plan.md` - Planning command implementation
- `~/mordor/personal/stepwise-dev/commands/implement_plan.md` - Implementation command
- `~/mordor/personal/stepwise-dev/commands/validate_plan.md` - Validation command
- `~/mordor/personal/stepwise-dev/agents/codebase-locator.md` - File locator agent
- `~/mordor/personal/stepwise-dev/agents/codebase-analyzer.md` - Code analyzer agent
- `~/mordor/personal/stepwise-dev/skills/thoughts-management/` - Thoughts system scripts

### User's Configuration
- `~/.claude/CLAUDE.md` - Global TDD and design guidelines

### Research Notes
- `thoughts/nikey_es/notes/claude-code-skills.md` - Agent Skills documentation and best practices
- `thoughts/nikey_es/notes/context-engineering.md` - Context engineering principles and case studies
- `thoughts/nikey_es/notes/I mastered the Claude Code workflow.txt` - Ashley Ha's workflow guide

## Architecture Documentation

### Stepwise-dev Workflow Architecture

```
Research Phase (Parallel Agents)
├── codebase-locator → Finds files
├── codebase-analyzer → Analyzes implementation
├── codebase-pattern-finder → Discovers patterns
├── thoughts-locator → Searches past research
└── thoughts-analyzer → Extracts insights
    ↓
Research Document (thoughts/shared/research/)
    ↓
Planning Phase (Interactive)
├── Read research
├── Ask clarifying questions
├── Present design options
├── Iterate on structure (5-7 iterations)
└── Finalize with no open questions
    ↓
Implementation Plan (thoughts/shared/plans/)
    ↓
Implementation Phase (Phase by Phase)
├── Implement Phase 1
├── Run automated verification
├── Manual testing (if needed)
├── Update checkmarks
└── Repeat for each phase
    ↓
Code Changes (git commits)
    ↓
Validation Phase (Systematic)
├── Check all phases complete
├── Run all automated verification
├── Generate validation report
└── List manual testing items
    ↓
Validated Feature (ready for PR)
```

### Thoughts Directory Architecture

```
Source Files (thoughts/{username}/ and thoughts/shared/)
    ↓
thoughts-sync script
    ↓
Hardlinks (thoughts/searchable/)
    ↓
Fast Grep Search
    ↓
thoughts-locator agent
    ↓
Context for new tasks
```

### Context Management Strategy

```
Phase Start (40% context)
    ↓
Work on Phase (climb to 60%)
    ↓
Save to thoughts/ (persistent)
    ↓
/clear (reset to base)
    ↓
Next Phase Start (40% context)
```

## Historical Context (from thoughts/)

### Related Research
- Past exploration of Agent Skills system documented in `thoughts/nikey_es/notes/claude-code-skills.md`
- Context engineering principles gathered from Dex Horthy's articles
- Ashley Ha's workflow mastery documented from Medium article

### Previous Plans
- None directly related to blog post creation
- stepwise-dev plugin itself has extensive plans in its own thoughts/ directory

## Related Research

- Agent Skills overview and best practices
- Context engineering for coding agents
- Progressive disclosure patterns in AI tools
- Frequent intentional compaction techniques

## Blog Post Outline Recommendations

Based on research, recommended Spanish blog post structure:

### Apartado 1: Configurar tu IDE

**Content:**
- ¿Qué es Claude Code?
- Configuración esencial: CLAUDE.md global
- Ejemplo del CLAUDE.md del autor (TDD workflow)
- Link al CLAUDE.md en GitHub del autor
- Por qué CLAUDE.md solo no es suficiente
  - Necesitas workflow estructurado
  - Gestión de contexto disciplinada
  - Sistema de thoughts para retención de conocimiento

**Tono:** Práctico, directo. Enfatizar que es prerequisito pero no suficiente.

### Apartado 2: Ventana de contexto vs ventana de atención

**Content:**
- Definiciones claras con ejemplos
- Regla del 60% de Ashley Ha
- Fórmula de calidad de Dex Horthy
- Evidencia empírica del estudio de Stanford
- [TABLA DEL USUARIO: resumen ventanas de contexto/atención por modelo]
- [REFERENCIA DEL USUARIO: Informe ChatGPT sobre contexto y errores]
- Por qué obsesionarse con el contexto es fundamental

**Tono:** Educativo, con datos concretos. Convencer al lector de la importancia.

### Apartado 3: Cómo usar stepwise-dev

**Content:**
- Instalación y setup inicial
- Las 4 fases explicadas con ejemplos:
  - Research: Qué hace, cómo usarlo, ejemplo de output
  - Plan: Proceso iterativo, ejemplo de fase de plan
  - Implement: Fase por fase, verificación automática
  - Validate: Reporte sistemático
- Sistema de thoughts: cómo funciona, por qué es poderoso
- Ejemplo completo end-to-end (quizás autenticación OAuth)

**Tono:** Tutorial paso a paso. Ejemplos concretos y accionables.

### Apartado 4: Ventajas vs solo usar prompting

**Content:**
- Tabla comparativa (Plain Prompting vs Stepwise-dev)
- 8 ventajas detalladas con ejemplos:
  1. Context engineering at scale
  2. Knowledge retention
  3. High-leverage human review
  4. Production code in brownfield
  5. Mental alignment
  6. No slop
  7. Structured problem-solving
  8. Frequent intentional compaction
- Resultados empíricos (Dex Horthy, Ashley Ha)
- Cuándo NO usar stepwise-dev
- Conclusión: "No es magia, pero funciona"

**Tono:** Persuasivo pero honesto. Mostrar beneficios reales con evidencia.

## Open Questions for User

1. **ChatGPT Report:** ¿Puedes proporcionar la referencia específica del "Informe de ChatGPT" sobre contexto y errores?

2. **Model Comparison Table:** ¿Tienes ya preparada la tabla de ventanas de contexto/atención por modelo, o necesitas que la investigue?

3. **GitHub Link:** ¿Cuál es el enlace exacto a tu CLAUDE.md en GitHub? (para incluir en apartado 1)

4. **Tone and Style:** ¿Prefieres un tono más técnico/académico o más casual/accesible para el blog post?

5. **Length:** ¿Hay alguna longitud objetivo para el post? (corto ~1500 palabras, medio ~3000, largo ~5000+)

6. **Target Audience:** ¿A quién va dirigido? (developers que ya usan Claude Code, developers considerando IA tools, managers/leads, etc.)

7. **Call to Action:** ¿Quieres incluir algún CTA al final? (probar stepwise-dev, seguirte en redes, contacto, etc.)

8. **Code Examples:** ¿Prefieres ejemplos de código en español (comentarios, nombres de variables) o mantenerlos en inglés como es estándar?
