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

echo "5. Externe GitHub Actions zijn op een volledige commit-SHA vastgezet"
# Een tag kan worden verplaatst naar andere code, een commit-SHA niet. Lokale composite
# actions (uses: ./...) en herbruikbare workflows in deze repository slaan we over.
unpinned=0
while IFS= read -r line; do
  [ -z "${line}" ] && continue
  file="${line%%:*}"
  ref="${line#*:}"
  case "${ref}" in
    ./*|.github/*) continue ;;                     # lokale action of workflow
  esac
  case "${ref}" in
    *@[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f])
      ;;                                            # 40 hex-tekens: goed
    *)
      note_error "actie niet op een volledige commit-SHA vastgezet (${file}): ${ref}"
      unpinned=$((unpinned+1))
      ;;
  esac
done < <(grep -rhoE '^[^#]*uses:[[:space:]]*[^[:space:]]+' .github --include='*.yml' \
          | sed 's/.*uses:[[:space:]]*//' \
          | sed "s|^|$(printf '%s' '.github')/…:|" \
          | sort -u)
[ "${unpinned}" -eq 0 ] && note_ok "alle externe actions zijn op een commit-SHA vastgezet"

echo "6. Patrooncontrole op gevoelige gegevens (beperkt, geen volledige PII-detectie)"
# LET OP: dit is een grove zeef tegen slordigheid, GEEN bewijs dat de repository vrij is
# van persoonsgegevens. Secret scanning (security-scan.yml + GitHub push protection) blijft
# de primaire controle voor secrets; menselijke review blijft nodig. Zie
# docs/privacy/data-classification.md.
scan_files() { grep -rIn --include='*.md' --include='*.yml' --include='*.yaml' \
  --include='*.sh' --include='*.json' --exclude-dir=.git "$@" . || true; }

# Toegestane, expliciet synthetische voorbeelden.
allow='example\.invalid|example\.com|example\.org|\[|not-a-real-secret|changeme|dummy|sandbox|verify-template\.sh|data-classification\.md|test-group-plan\.md'

report_pattern() {
  local label="$1" pattern="$2" hits
  hits="$(scan_files -E "${pattern}" | grep -Ev "${allow}" || true)"
  if [ -n "${hits}" ]; then
    printf '%s\n' "${hits}" | head -5
    note_error "${label}: mogelijk gevoelig patroon aangetroffen (controleer handmatig)"
  fi
}

report_pattern "kaartnummer"      '\b[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}\b'
report_pattern "IBAN"             '\b[A-Z]{2}[0-9]{2}[ ]?[A-Z0-9]{4}[ ]?[0-9]{4}[ ]?[0-9]{4,}\b'
report_pattern "BSN-achtig getal" '\b[0-9]{9}\b'
report_pattern "telefoonnummer"   '\b(\+31|0)[1-9][0-9]{8}\b'
report_pattern "private key"      'BEGIN [A-Z ]*PRIVATE KEY'
report_pattern "token-achtige waarde" '\b(gh[pousr]_[A-Za-z0-9]{16,}|sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16})\b'
report_pattern "e-mailadres buiten de voorbeeldsdomeinen" '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'

note_ok "patrooncontrole uitgevoerd (beperkt: vervangt geen menselijke review of secret scanning)"

echo
if [ "${errors}" -gt 0 ]; then
  fail "${errors} probleem/problemen gevonden."
fi
ok "Template is consistent."
echo
echo "Let op: stap 6 is een patrooncontrole op veelgemaakte fouten, geen volledige"
echo "PII-detectie. Zij bewijst niet dat de repository geen persoonsgegevens bevat."
