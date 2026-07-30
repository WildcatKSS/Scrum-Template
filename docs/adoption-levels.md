# Adoptieniveaus

> **Doel:** duidelijk maken welk deel van deze template je nú nodig hebt.
> **Wanneer gebruiken:** bij de start, en telkens wanneer je product een fase verder gaat.
> **Wie:** Product Owner en Scrum Master samen, met de Developers.
> **Adoptieniveau:** Core.
> **Gerelateerd:** [`../START-HERE.md`](../START-HERE.md) · [`README.md`](README.md)

De template dekt bewust het hele spectrum, van eerste prototype tot gereguleerde
productie. Alles tegelijk invoeren werkt niet — en alles overslaan ook niet. Vandaar drie
niveaus.

**Groeipad:** Core → Advanced → Regulated/Enterprise. Je stapt op wanneer je product dat
vraagt, niet op een vaste datum.

---

## Wat blijft altijd gelden

Onafhankelijk van je niveau:

1. **Nooit echte persoonsgegevens, betaalgegevens of productiedata** buiten productie.
2. **Geen secrets in de repository**; secret scanning staat aan vanaf commit één.
3. **Wachtwoorden en sessies veilig**; autorisatie serverseitig, per object gecontroleerd.
4. **Geen misleidende weergave** van bedragen, kosten of risico's.
5. **Juridische conclusies laat je valideren** door een bevoegde specialist.
6. **Done is Done** — de [Definition of Done](scrum/definition-of-done.md) kent geen
   uitzonderingsprocedure, op elk niveau.

Een lager niveau is **gefaseerde invoering**, geen vrijstelling van deze principes.

---

## Core

**Voor:** een klein team (2–6 mensen) dat een eerste product of prototype bouwt, met
weinig of geen echte gebruikers.
**Doel:** snel leren of je het juiste bouwt, zonder onveilige gewoonten aan te leren.

| Onderdeel | Document |
|---|---|
| Productvisie en productdoel | [`product/product-vision.md`](product/product-vision.md), [`product/product-goals.md`](product/product-goals.md) |
| MVP-scope | [`product/mvp-scope.md`](product/mvp-scope.md) |
| Product Backlog + board | [`scrum/project-board.md`](scrum/project-board.md) |
| Sprint Goal en events | [`scrum/scrum-guide.md`](scrum/scrum-guide.md), [`scrum/sprint-planning.md`](scrum/sprint-planning.md) |
| Definition of Ready en Done | [`scrum/definition-of-ready.md`](scrum/definition-of-ready.md), [`scrum/definition-of-done.md`](scrum/definition-of-done.md) |
| Issue Forms en PR-template | `.github/` |
| Basis-CI: build, lint, unittests | [`../.github/workflows/ci.yml`](../.github/workflows/ci.yml) |
| Secret scanning | [`../.github/workflows/security-scan.yml`](../.github/workflows/security-scan.yml) |
| Synthetische testdata | [`../tests/README.md`](../tests/README.md) |
| Gebruikersfeedback verzamelen en wegen | [`research/feedback-log.md`](research/feedback-log.md) |

**Bewust nog niet:** control matrix, auditbewijs, formele governance, environments met
approvals, SLO's, DPIA, releasekanalen.

**Je bent klaar voor Advanced wanneer:** er echte gebruikers zijn, meerdere developers
tegelijk werken, of je persoonsgegevens gaat verwerken.

---

## Advanced

**Voor:** een groeiend product met externe gebruikers en meerdere ontwikkelaars.
**Doel:** kwaliteit en veiligheid volhouden terwijl het team en het product groeien.

Alles uit Core, plus:

| Onderdeel | Document |
|---|---|
| Architectuurbesluiten en -principes | [`architecture/adr/`](architecture/adr/), [`architecture/architecture-principles.md`](architecture/architecture-principles.md) |
| Threat modelling per epic | [`architecture/epic-threat-checklist.md`](architecture/epic-threat-checklist.md) |
| CodeQL naast Semgrep | repository-variabele `CODEQL_LANGUAGES` |
| Dependency- en containerscans, SBOM | `security-scan.yml` |
| Teststrategie en testniveaus | [`testing/test-strategy.md`](testing/test-strategy.md) |
| Monitoring, SLI/SLO, error budget | [`operations/monitoring.md`](operations/monitoring.md), [`operations/service-level-objectives.md`](operations/service-level-objectives.md), [`operations/sre-principles.md`](operations/sre-principles.md) |
| Releasekanalen en releaseproces | [`releases/release-process.md`](releases/release-process.md) |
| Privacybeoordeling en bewaartermijnen | [`privacy/privacy-by-design.md`](privacy/privacy-by-design.md), [`privacy/data-retention.md`](privacy/data-retention.md) |
| Security Champion binnen het team | [`security/security-champions.md`](security/security-champions.md) |
| Platform-readiness | [`operations/platform-readiness-checklist.md`](operations/platform-readiness-checklist.md) |

**Je bent klaar voor Regulated/Enterprise wanneer:** je in productie gaat met echt geld of
echte financiële gegevens, onder toezicht valt, of assurance aan klanten moet geven.

---

## Regulated / Enterprise

**Voor:** productiegebruik in een gereguleerde of grotere organisatie, met onafhankelijk
toezicht en externe verantwoording.
**Doel:** aantoonbaar in control zijn — niet alleen veilig werken, maar dat ook kunnen
laten zien.

Alles uit Advanced, plus:

| Onderdeel | Document |
|---|---|
| Formele governance en mandaten | [`../GOVERNANCE.md`](../GOVERNANCE.md) |
| Control matrix (control → maatregel → test → bewijs) | [`compliance/control-mapping.md`](compliance/control-mapping.md) |
| Auditbewijs en risicoacceptaties | [`compliance/audit-evidence.md`](compliance/audit-evidence.md) |
| Complianceregister en regulatoire besluiten | [`compliance/compliance-register.md`](compliance/compliance-register.md), [`compliance/regulatory-decisions.md`](compliance/regulatory-decisions.md) |
| Onafhankelijk security-, privacy- en compliancetoezicht | [`scrum/roles.md`](scrum/roles.md) §2 |
| Environment approvals en vier-ogenprincipe | [`operations/deployment.md`](operations/deployment.md) |
| Incident- en herstelprocessen, beproefd | [`security/incident-response.md`](security/incident-response.md), [`operations/backup-and-recovery.md`](operations/backup-and-recovery.md) |
| DPIA | [`privacy/privacy-impact-assessment-template.md`](privacy/privacy-impact-assessment-template.md) |
| Externe pentest of assurance | [`security/vulnerability-management.md`](security/vulnerability-management.md) §7 |

---

## Wat betekent dit voor de pipeline?

| Instelling | Core | Advanced | Regulated |
|---|---|---|---|
| `TEMPLATE_STRICT` | `true` zodra er code is | `true` | `true` |
| `COVERAGE_MIN` | 60–70 | 70–80 | 80+ |
| `CODEQL_LANGUAGES` | leeg (Semgrep volstaat) | ingevuld | ingevuld |
| `STAGING_DEPLOY_ENABLED` | uit tot er een omgeving is | aan | aan |
| `PRODUCTION_DEPLOY_ENABLED` | uit | aan bij productie | aan |
| `RELEASE_CHANNEL` | `internal-prototype` / `test-group` | `beta` | `limited-production` → `general-availability` |
| Environment approvals | n.v.t. | aanbevolen | verplicht |

Toelichting per variabele: [`operations/deployment.md`](operations/deployment.md) §6.

---

## Waar je niveau vastleggen?

Noteer je huidige niveau en de reden in `README.md` §2 of in je eerste ADR. Herzie het bij
elke roadmapevaluatie. Ga je een niveau omhoog, maak dan backlogitems van wat er nog
ontbreekt — niet één grote "compliance-sprint", maar stukjes naast het productwerk.
