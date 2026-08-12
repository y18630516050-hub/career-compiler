---
name: career-compiler
description: Build truthful, role-targeted resumes and interview stories from source materials. Use when creating or tailoring a resume, extracting a candidate fact base, mapping experience to a job description, or reviewing career claims for accuracy.
---

# Career Compiler

Create a clear, role-targeted career narrative without inventing, inflating, or silently changing facts.

## Non-negotiables

- Treat source material as evidence, not as copy to rewrite freely.
- Keep factual claims immutable: company, title, dates, scope, ownership, actions, decisions, outcomes, and metrics must remain traceable to evidence.
- Separate a team result from the candidate's own contribution. Do not turn participation into ownership.
- Mark missing, ambiguous, or unsupported information as `needs_confirmation`; never fill gaps with plausible language.
- Prefer direct, specific language over jargon. Optimize for recruiter comprehension.

## Workflow

1. **Collect inputs.** Ask for the current resume, target job description, and any supporting material. Confirm the target role if it is unclear.
2. **Build a Candidate Fact Base.** Assign each material claim a stable ID and record:
   - category: context, responsibility, action, decision, collaboration, project, business_result, metric, management, or tool_ai
   - claim, source, status, ownership, candidate contribution, and confidence
3. **Validate facts.** Flag contradictions, missing dates, unexplained metrics, weak ownership language, and achievements that cannot be attributed to the candidate.
4. **Map to the role.** Translate only verified facts into the target role's required capabilities. Reorder and reframe facts as needed, but do not alter the facts.
5. **Draft the output.** Produce a base resume or target resume with concise, evidence-backed bullets. Put the strongest relevant verified result first.
6. **Run a truth review.** For every bullet, identify supporting fact IDs. Remove or qualify any statement without evidence.
7. **Return an evidence log.** List confirmed facts used, claims needing confirmation, and wording choices that are interpretations rather than facts.

## Output contract

Use this structure unless the user requests another format:

1. **Target and assumptions**
2. **Candidate Fact Base** — table with `fact_id`, claim, evidence/source, ownership, confidence, and status
3. **Role mapping** — target capability → supporting fact IDs → wording angle
4. **Resume draft**
5. **Truth review** — unsupported or ambiguous claims that require user confirmation

## Writing rules

- State a metric only when its value and scope are evidenced.
- Use ownership verbs precisely: `led`, `owned`, `co-led`, `contributed to`, `supported`, or `collaborated on`.
- Do not claim causal impact unless the evidence supports causality.
- Do not add skills, tools, management scope, credentials, or results absent from the materials.
- Preserve uncertainty. A precise question is better than a confident guess.
