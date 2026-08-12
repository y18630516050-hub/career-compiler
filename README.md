# Career Compiler

A truthful resume and interview-story skill for AI agents.

Career Compiler turns source resume material into role-targeted career output **without making up facts**. It first builds a candidate fact base, then maps only verified evidence to a target role.

## What ships in this first release

- A minimal Agent Skill at `.github/skills/career-compiler/SKILL.md`
- Fact-first drafting rules: evidence, ownership, metrics, and uncertainty stay visible
- A local validation script and GitHub Actions check
- A release checklist based on GitHub CLI's `gh skill publish --dry-run`

This is an MPS (minimum publishable skill), not the finished Career Compiler product. The next versions can add structured fact files, role frameworks, reviewers, and test fixtures.

## Repository layout

```text
.github/
  skills/career-compiler/SKILL.md  # The distributable Agent Skill
  workflows/validate.yml           # Pull-request and push validation
scripts/validate-skill.ps1         # Local metadata and structure checks
README.md
LICENSE
```

## Use it

Clone this repository, then keep the `career-compiler` folder under a supported project skill location such as `.github/skills/` or `.agents/skills/`.

With GitHub CLI 2.90.0 or later, install from the published repository:

```powershell
gh skill install <OWNER>/career-compiler career-compiler
```

Use it with a prompt such as:

> Use the career-compiler skill to tailor my resume to this job description. Build the fact base first and flag anything you cannot verify.

## Validate before publishing

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/validate-skill.ps1
gh skill publish --dry-run
```

The GitHub Action runs the local validator on pushes, pull requests, and manual dispatches. `gh skill publish --dry-run` is the final release gate: it validates the skill against the Agent Skills specification and checks relevant remote settings without publishing.

## Publish

1. Create a **public** GitHub repository named `career-compiler`.
2. Push the `main` branch.
3. Run `gh auth login`, then run `gh skill publish --dry-run` from the repository root.
4. Fix anything reported, commit it, and run `gh skill publish`.
5. Install the published skill in a clean environment and test one resume-tailoring prompt before announcing it.

GitHub CLI's skill publishing command is currently a public preview, so keep the local validator and smoke test in the release path.

## License

MIT. See [LICENSE](LICENSE).
