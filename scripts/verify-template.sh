#!/usr/bin/env bash
# Zelfcontrole van de template: bestaan alle beloofde bestanden, is de YAML geldig,
# en verwijzen de workflows alleen naar scripts die echt bestaan?
# Draait in CI (code-quality.yml) en lokaal.
set -Eeuo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/ci/common.sh"

cd "${REPO_ROOT}"
errors=0
note_error() { printf '\033[0;31m  ✗ %s\033[0m\n' "$*"; errors=$((errors+1)); }
note_ok()    { printf '\033[0;32m  ✓ %s\033[0m\n' "$*"; }

required_files=(
  README.md SECURITY.md SUPPORT.md CONTRIBUTING.md GOVERNANCE.md
  CODE_OF_CONDUCT.md LICENSE CHANGELOG.md .env.example .gitignore
  .github/CODEOWNERS .github/dependabot.yml .github/labels.yml
  .github/PULL_REQUEST_TEMPLATE.md
  .github/ISSUE_TEMPLATE/config.yml
  .github/ISSUE_TEMPLATE/user-story.yml
  .github/ISSUE_TEMPLATE/bug-report.yml
  .github/ISSUE_TEMPLATE/technical-task.yml
  .github/ISSUE_TEMPLATE/security-issue.yml
  .github/ISSUE_TEMPLATE/compliance-task.yml
  .github/ISSUE_TEMPLATE/research-spike.yml
  .github/ISSUE_TEMPLATE/epic.yml
  .github/ISSUE_TEMPLATE/feature.yml
  .github/ISSUE_TEMPLATE/test-group-feedback.yml
  .github/actions/setup-stack/action.yml
  .github/workflows/ci.yml
  .github/workflows/security-scan.yml
  .github/workflows/dependency-review.yml
  .github/workflows/code-quality.yml
  .github/workflows/release.yml
  .github/workflows/labels-sync.yml
  docs/product/product-vision.md docs/product/product-goals.md
  docs/product/personas.md docs/product/customer-journey.md
  docs/product/mvp-scope.md docs/product/roadmap.md
  docs/product/example-backlog.md
  docs/placeholders.md docs/optional-extensions.md
  docs/scrum/scrum-guide.md docs/scrum/definition-of-ready.md
  docs/scrum/definition-of-done.md docs/scrum/sprint-planning.md
  docs/scrum/sprint-review.md docs/scrum/retrospective.md docs/scrum/refinement.md
  docs/scrum/roles.md docs/scrum/project-board.md docs/scrum/labels.md
  docs/scrum/sprint-plan-example.md
  docs/research/test-group-plan.md docs/research/interview-template.md
  docs/research/usability-test-template.md docs/research/feedback-log.md
  docs/research/experiment-template.md
  docs/research/consent-and-privacy-check.md
  docs/architecture/system-context.md docs/architecture/architecture-overview.md
  docs/architecture/data-flow.md docs/architecture/threat-model.md
  docs/architecture/adr/0001-architecture-decision-template.md
  docs/architecture/adr/README.md
  docs/security/security-principles.md docs/security/secure-development-lifecycle.md
  docs/security/access-control.md docs/security/incident-response.md
  docs/security/vulnerability-management.md docs/security/security-testing.md
  docs/privacy/privacy-by-design.md docs/privacy/data-classification.md
  docs/privacy/data-retention.md docs/privacy/privacy-impact-assessment-template.md
  docs/compliance/compliance-register.md docs/compliance/control-mapping.md
  docs/compliance/audit-evidence.md docs/compliance/regulatory-decisions.md
  docs/operations/deployment.md docs/operations/monitoring.md
  docs/operations/backup-and-recovery.md docs/operations/service-level-objectives.md
  docs/operations/runbook.md
  docs/releases/release-process.md docs/releases/release-checklist.md
  src/README.md tests/README.md scripts/README.md
  scripts/bootstrap.sh scripts/verify-template.sh
  scripts/ci/common.sh scripts/ci/all.sh
  scripts/release/prepare-release-notes.sh
)

echo "1. Verplichte bestanden"
for f in "${required_files[@]}"; do
  [ -f "${f}" ] || note_error "ontbreekt: ${f}"
done
[ "${errors}" -eq 0 ] && note_ok "alle ${#required_files[@]} bestanden aanwezig"

echo "2. Verplichte mappen"
for d in src tests/unit tests/integration tests/security tests/accessibility tests/end-to-end scripts; do
  [ -d "${d}" ] || note_error "ontbreekt: ${d}/"
done
note_ok "mapstructuur gecontroleerd"

echo "3. YAML-syntaxis"
yaml_files=$(find .github -name '*.yml' -o -name '*.yaml' | sort)
if has python3 && python3 -c "import yaml" 2>/dev/null; then
  for f in ${yaml_files}; do
    python3 -c "import sys,yaml; yaml.safe_load(open(sys.argv[1]))" "${f}" \
      || note_error "ongeldige YAML: ${f}"
  done
  note_ok "YAML gecontroleerd met PyYAML"
else
  warn "PyYAML niet beschikbaar; YAML-syntaxis niet gecontroleerd (pip install pyyaml)."
fi

echo "4. Workflows verwijzen alleen naar bestaande scripts"
while IFS= read -r ref; do
  [ -z "${ref}" ] && continue
  if [ ! -f "${ref}" ]; then
    note_error "workflow verwijst naar niet-bestaand script: ${ref}"
  elif [ ! -x "${ref}" ]; then
    note_error "script niet uitvoerbaar (git update-index --chmod=+x ${ref}): ${ref}"
  fi
done < <(grep -rhoE '(\./)?scripts/[A-Za-z0-9_/.-]+\.sh' .github/workflows/ | sed 's|^\./||' | sort -u)
note_ok "scriptverwijzingen gecontroleerd"

echo "5. Geen voor de hand liggende echte gegevens in de template"
if grep -rInE '\b[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}\b' --include='*.md' --include='*.yml' . \
   | grep -v 'scripts/verify-template.sh' | grep -v '\[' ; then
  note_error "mogelijk een creditcard-achtig nummer aangetroffen"
else
  note_ok "geen kaartnummerpatronen gevonden"
fi

echo
if [ "${errors}" -gt 0 ]; then
  fail "${errors} probleem/problemen gevonden."
fi
ok "Template is consistent."
