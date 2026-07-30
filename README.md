# [PRODUCTNAAM] — Scrum-template voor een online financiële dienst

> **Status van deze repository:** herbruikbare **GitHub-template**. Alle waarden tussen
> vierkante haken (`[PRODUCTNAAM]`, `[DOELGROEP]`, `[TECH STACK]`, …) zijn nog niet
> ingevuld. Zie [`docs/placeholders.md`](docs/placeholders.md) voor de volledige lijst en
> [Openstaande beslissingen](#openstaande-beslissingen-en-aannames).

> [!IMPORTANT]
> Deze template levert **proces, structuur en controlemomenten**. Zij levert géén
> juridische, compliance- of securitygoedkeuring. Niets in deze repository bewijst dat
> een product aan wet- of regelgeving voldoet. Alle regulatoire conclusies zijn gemarkeerd
> als **“te valideren door een bevoegde specialist”**.

---

## 1. Doel van de repository

Deze repository is het startpunt voor een multidisciplinair team dat volgens **Scrum**
een **veilige, schaalbare en gebruiksvriendelijke online financiële dienst** ontwikkelt.
De template ondersteunt:

| Doel | Waar geregeld |
|---|---|
| Productontwikkeling volgens Scrum organiseren | [`docs/scrum/`](docs/scrum/), GitHub Issues + Projects |
| Iteratief en incrementeel waarde opleveren | [`docs/scrum/scrum-guide.md`](docs/scrum/scrum-guide.md), [`docs/scrum/definition-of-done.md`](docs/scrum/definition-of-done.md) |
| Een MVP snel met een testgroep valideren | [`docs/product/mvp-scope.md`](docs/product/mvp-scope.md), [`docs/research/`](docs/research/) |
| Feedback omzetten in backlogitems | [`docs/research/feedback-log.md`](docs/research/feedback-log.md) |
| Kwaliteit, privacy, security en compliance vanaf sprint 1 meenemen | [`.github/workflows/`](.github/workflows/), [`docs/security/`](docs/security/), [`docs/privacy/`](docs/privacy/), [`docs/compliance/`](docs/compliance/) |
| Beslissingen traceerbaar vastleggen | [`docs/architecture/adr/`](docs/architecture/adr/), [`docs/compliance/regulatory-decisions.md`](docs/compliance/regulatory-decisions.md) |
| Gecontroleerd releasen | [`docs/releases/`](docs/releases/), [`.github/workflows/release.yml`](.github/workflows/release.yml) |

## 2. Productcontext

| Onderwerp | Waarde | Status |
|---|---|---|
| Productnaam | `[PRODUCTNAAM]` | te bepalen |
| Doelgroep | `[DOELGROEP]` | te bepalen |
| Probleem | `[PROBLEEM]` | te bepalen |
| Belangrijkste productdoel | `[PRODUCTDOEL]` | te bepalen |
| Type financiële dienst | `[TYPE DIENST]` (budgetteren / betalen / lenen / investeren / financieel inzicht) | te bepalen — **bepaalt het regulatoire regime** |
| Landen/regio's | `[LANDEN/REGIO]` | te bepalen — **bepaalt toezichthouder en dataresidency** |
| Technologiestack | `[TECH STACK]` | te bepalen — zie [ADR 0002](docs/architecture/adr/) |
| Cloudomgeving | `[CLOUD]` (AWS / Azure / GCP / n.t.b.) | te bepalen |
| Sprintduur | `[SPRINTDUUR]` (advies: 2 weken) | te bepalen |
| Testgroep | `[TESTGROEP]` | te bepalen |

Uitgebreide context: [`docs/product/product-vision.md`](docs/product/product-vision.md).

## 3. Uitgangspunten

1. **Secure by design, privacy by design, least privilege** — geen bijzaak, maar
   acceptatiecriterium ([`docs/security/security-principles.md`](docs/security/security-principles.md)).
2. **Elke sprint levert een bruikbaar, getest en potentieel releasbaar increment.**
3. **Snelheid mag nooit ten koste gaan van essentiële beveiligings-, privacy- of
   controlemaatregelen.** Een financiële MVP slaat die niet over.
4. **Nooit echte persoonsgegevens, betaalgegevens, authenticatiemiddelen of
   productiedata** in development, demo's, tests of testgroepsessies.
5. **Aannames worden expliciet gemarkeerd**, nooit stilzwijgend als besluit behandeld.
6. **Traceerbaarheid**: issue → PR → check → release → bewijs.
7. **Feedback is input, geen opdracht.** Elke suggestie wordt getoetst
   ([`docs/research/feedback-log.md`](docs/research/feedback-log.md)).

## 4. Repositorystructuur

```
.
├── .github/
│   ├── ISSUE_TEMPLATE/        # Issue Forms: user story, bug, tech, security, compliance, spike, epic, feature, testgroepfeedback
│   ├── workflows/             # ci, security-scan, dependency-review, code-quality, release, labels-sync
│   ├── CODEOWNERS             # verplichte reviewers voor gevoelige paden
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── dependabot.yml
│   └── labels.yml             # bron van waarheid voor labels
├── docs/
│   ├── product/               # visie, doelen, persona's, journey, MVP, roadmap, voorbeeldbacklog
│   ├── scrum/                 # werkwijze, rollen, board, DoR, DoD, events
│   ├── research/              # testgroep: plan, interview, usability, consent, feedback, experimenten
│   ├── architecture/          # context, overzicht, dataflows, threat model, ADR's
│   ├── security/              # principes, SDLC, access control, incidenten, kwetsbaarheden, testen
│   ├── privacy/               # privacy by design, classificatie, bewaartermijnen, DPIA
│   ├── compliance/            # register, control mapping, auditbewijs, regulatoire besluiten
│   ├── operations/            # deployment, monitoring, backup/recovery, SLO's, runbook
│   └── releases/              # releaseproces en -checklist
├── src/                       # applicatiecode (structuur volgt uit [TECH STACK])
├── tests/                     # unit, integration, security, accessibility, end-to-end
├── scripts/                   # bootstrap + CI-scripts die de workflows aanroepen
├── .env.example               # configuratiecontract (nooit echte secrets)
├── CHANGELOG.md               # Keep a Changelog + SemVer
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── GOVERNANCE.md              # rollen, mandaten, besluitvorming
├── LICENSE
├── README.md
├── SECURITY.md                # responsible disclosure — géén security via publieke issues
└── SUPPORT.md
```

## 5. Lokale installatie

```bash
git clone https://github.com/[ORGANISATIE]/[REPOSITORY].git
cd [REPOSITORY]
cp .env.example .env          # vul lokale, niet-productie waarden in
./scripts/bootstrap.sh        # detecteert de stack en installeert afhankelijkheden
```

`scripts/bootstrap.sh` is **stack-agnostisch**: het detecteert Node.js, Python, Go, Java
of .NET aan de hand van manifestbestanden. Zolang `[TECH STACK]` niet is gekozen, meldt
het script dat er nog niets te installeren is en stopt het zonder fout.

## 6. Configuratie

* Alle configuratie loopt via omgevingsvariabelen; het contract staat in
  [`.env.example`](.env.example).
* **Secrets** horen in GitHub Actions Secrets of een secrets manager, nooit in de repo.
* Omgevingen zijn strikt gescheiden: `development` → `test` → `staging` → `production`
  ([`docs/operations/deployment.md`](docs/operations/deployment.md)).
* CI-gedrag: zolang `TEMPLATE_STRICT` niet op `true` staat, waarschuwen nog niet
  ingevulde controles in plaats van te falen. Zet de repository-variabele
  `TEMPLATE_STRICT=true` zodra de stack er is — dan worden de checks blokkerend.
* Deployment staat bewust uit en is fail-closed. `deploy-staging` en `deploy-production`
  draaien alleen bij een **tag-push** op de hoofdbranch én met
  `STAGING_DEPLOY_ENABLED=true` respectievelijk `PRODUCTION_DEPLOY_ENABLED=true`.
  Een handmatige run (`workflow_dispatch`) is altijd een **droogrun**: die valideert wel,
  maar rolt niets uit. Productie vereist daarnaast een stabiele SemVer-versie en een
  kanaal uit de allowlist (`limited-production`, `general-availability`) via
  `RELEASE_CHANNEL`. Gebeurt er niets, dan wordt er ook **geen deploymentbewijs
  geschreven**. Volledig overzicht: [`docs/operations/deployment.md`](docs/operations/deployment.md#6-configuratie-en-secrets).

## 7. Testcommando's

| Doel | Commando | Testmap |
|---|---|---|
| Alles | `./scripts/ci/all.sh` | — |
| Build | `./scripts/ci/build.sh` | — |
| Lint + format | `./scripts/ci/lint.sh` | — |
| Unit tests | `./scripts/ci/test-unit.sh` | `tests/unit/` |
| Integratietests | `./scripts/ci/test-integration.sh` | `tests/integration/` |
| Coveragedrempel | `./scripts/ci/coverage-check.sh` | — |
| End-to-end | `./scripts/ci/test-e2e.sh` | `tests/end-to-end/` |
| Securitytests | `./scripts/ci/test-security.sh` | `tests/security/` |
| Toegankelijkheid | `./scripts/ci/test-accessibility.sh` | `tests/accessibility/` |
| SBOM | `./scripts/ci/sbom.sh` | — |
| Licentiecontrole | `./scripts/ci/license-check.sh` | — |
| Template zelfcontrole | `./scripts/verify-template.sh` | — |

## 8. Ontwikkelworkflow

1. Pak een item op uit **Sprint backlog** dat aan de [Definition of Ready](#10-definition-of-ready) voldoet.
2. Branch: `feat/<issue>-korte-titel`, `fix/…`, `chore/…`, `sec/…`, `docs/…`.
3. Commit volgens [Conventional Commits](https://www.conventionalcommits.org/)
   (voedt changelog en SemVer). Onderteken commits waar dat is ingesteld.
4. Open een **pull request** met het [PR-template](.github/PULL_REQUEST_TEMPLATE.md);
   koppel het issue met `Relates to #123` (zie [Sluitwoorden](docs/scrum/project-board.md#gebruik-van-sluitwoorden-in-pull-requests)).
5. CI moet groen zijn: build, lint, tests, coverage, secret scan, dependency review,
   SAST, SBOM, licenties.
6. Review: minimaal 1 review (2 voor security-, geld- of datastromen) en verplichte
   **CODEOWNERS**-review voor gevoelige paden.
7. Merge (squash) → item naar **Ready for testing** → validatie → **Done** zodra
   aantoonbaar aan de Definition of Done is voldaan. Een merge zet een item nooit
   automatisch op Done; gebruik `Relates to #123` zolang er nog validatie volgt.

Branch protection-advies: [`CONTRIBUTING.md`](CONTRIBUTING.md#branch-protection).

## 9. Scrum-werkwijze

* **Sprintduur:** `[SPRINTDUUR]` — advies 2 weken (1 week alleen bij een ervaren team en
  volledig geautomatiseerde pipeline).
* **Scrum Team:** Product Owner, Scrum Master en Developers. De Developers zijn
  multidisciplinair en bevatten UX- en onderzoeks-, test-, security-, privacy-,
  compliance- en operationsexpertise. Onafhankelijke governancerollen (security officer,
  privacy officer/DPO, compliance officer) en stakeholders — waaronder de deelnemers aan
  de testgroep — staan buiten het Scrum Team.
  Zie [`docs/scrum/roles.md`](docs/scrum/roles.md) en [`GOVERNANCE.md`](GOVERNANCE.md).
* **Events:** [Sprint Planning](docs/scrum/sprint-planning.md) ·
  [Daily Scrum](docs/scrum/scrum-guide.md#daily-scrum) ·
  [Refinement](docs/scrum/refinement.md) ·
  [Sprint Review](docs/scrum/sprint-review.md) ·
  [Retrospective](docs/scrum/retrospective.md)
* **Board:** GitHub Projects met 11 statussen en 14 velden —
  [`docs/scrum/project-board.md`](docs/scrum/project-board.md).
* **Gebruikersvalidatie:** doorlopend en risicogestuurd. Elke sprint met gebruikersimpact
  bevat een expliciete leeractiviteit; een formele validatieronde volgt minimaal elke 1–2
  sprints — [`docs/research/test-group-plan.md`](docs/research/test-group-plan.md).

## 10. Backlog

```
Productdoel
└── Epic
    └── Feature
        └── User story
            ├── Technische taak
            ├── Testtaak
            ├── Securitytaak
            └── Compliance-/privacytaak
```

* Labels: [`.github/labels.yml`](.github/labels.yml), uitleg in [`docs/scrum/labels.md`](docs/scrum/labels.md).
* Voorbeeldbacklog (fictief): [`docs/product/example-backlog.md`](docs/product/example-backlog.md).
* Sprint 1 en 2: [`docs/scrum/sprint-plan-example.md`](docs/scrum/sprint-plan-example.md).

## 11. Definition of Ready

Een item mag pas de sprint in als probleem en gebruikerswaarde helder zijn,
acceptatiecriteria controleerbaar zijn, afhankelijkheden bekend zijn, designs of
functionele uitgangspunten er zijn, security-, privacy- en compliance-impact voorlopig
beoordeeld zijn, de testaanpak duidelijk is, het item binnen één sprint past, het team het
begrijpt en blokkades zichtbaar zijn.
Volledig: [`docs/scrum/definition-of-ready.md`](docs/scrum/definition-of-ready.md).

## 12. Definition of Done

Twee lagen, zodat de lijst klopt voor zowel een documentatiewijziging als een betaalfunctie:

* **Universeel (U1–U8, altijd):** acceptatiecriteria aantoonbaar behaald · review door een
  ander · CI groen · geen blokkerende bevindingen · geen secrets, persoonsgegevens of
  productiedata · documentatie bijgewerkt · traceerbaar issue ↔ PR ↔ commit · gemerged
  zonder de build te breken.
* **Conditioneel (C1–C12, wanneer het item het gebied raakt):** tests · toegankelijkheid ·
  negatieve autorisatietests · geldstroomtests · migratie en rollback · persoonsgegevens ·
  compliancebewijs · validatie met gebruikers · monitoring · CODEOWNERS-review ·
  verificatie in een testomgeving · changelog. Wat niet van toepassing is, onderbouw je.

**Er is geen uitzonderingsprocedure.** Ontbreekt een verplicht criterium, dan is het item
niet Done: splitsen of terug naar de backlog. Done is een objectieve vaststelling door de
Developers, geen persoonlijke goedkeuring; de Product Owner inspecteert het resultaat,
past de backlog aan en beslist over vrijgave.
Volledig: [`docs/scrum/definition-of-done.md`](docs/scrum/definition-of-done.md).

## 13. Securitymeldingen

> **Meld kwetsbaarheden nooit via een publiek GitHub Issue.**
> Gebruik GitHub **Private Vulnerability Reporting** of `[SECURITY-CONTACT-EMAIL]`.
> Proces, scope en responstijden: [`SECURITY.md`](SECURITY.md).

## 14. Deployment

Omgevingen, promotiepad, goedkeuringen en rollback:
[`docs/operations/deployment.md`](docs/operations/deployment.md) ·
monitoring: [`docs/operations/monitoring.md`](docs/operations/monitoring.md) ·
SLO's: [`docs/operations/service-level-objectives.md`](docs/operations/service-level-objectives.md) ·
runbook: [`docs/operations/runbook.md`](docs/operations/runbook.md).

## 15. Releases

Semantic Versioning + [`CHANGELOG.md`](CHANGELOG.md). Releasekanalen: interne prototype →
testgroepversie → bèta → beperkte productie-uitrol → algemene beschikbaarheid.
Proces: [`docs/releases/release-process.md`](docs/releases/release-process.md) ·
checklist: [`docs/releases/release-checklist.md`](docs/releases/release-checklist.md).

## 16. Bijdragen

[`CONTRIBUTING.md`](CONTRIBUTING.md) · [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) ·
[`GOVERNANCE.md`](GOVERNANCE.md) · hulp: [`SUPPORT.md`](SUPPORT.md).

## 17. Licentie

Zie [`LICENSE`](LICENSE) (standaard MIT). **Beslissing te nemen:** voor een commerciële
financiële dienst is een propriëtaire licentie vaak passender. Zie
[Openstaande beslissingen](#openstaande-beslissingen-en-aannames).

## 18. Contact en eigenaarschap

| Rol | Naam | Contact | GitHub-team |
|---|---|---|---|
| Product Owner | `[NAAM]` | `[EMAIL]` | `@[ORG]/product-owners` |
| Scrum Master | `[NAAM]` | `[EMAIL]` | `@[ORG]/scrum-masters` |
| Tech lead / architect | `[NAAM]` | `[EMAIL]` | `@[ORG]/tech-leads` |
| Security officer | `[NAAM]` | `[SECURITY-CONTACT-EMAIL]` | `@[ORG]/security` |
| Privacy officer / DPO | `[NAAM]` | `[EMAIL]` | `@[ORG]/privacy` |
| Compliance officer | `[NAAM]` | `[EMAIL]` | `@[ORG]/compliance` |
| UX / onderzoeker | `[NAAM]` | `[EMAIL]` | `@[ORG]/ux` |
| Testgroepcoördinator | `[NAAM]` | `[EMAIL]` | `@[ORG]/ux` |

## Openstaande beslissingen en aannames

Onderstaande punten zijn **niet** besloten. Ze staan als aanname of open besluit
vastgelegd; behandel ze niet als feit.

| # | Onderwerp | Type | Eigenaar | Waar vastgelegd |
|---|---|---|---|---|
| 1 | Productnaam, doelgroep, probleem, productdoel | open besluit | Product Owner | `docs/product/product-vision.md` |
| 2 | Type financiële dienst (bepaalt regulatoir regime) | open besluit | PO + Compliance | `docs/compliance/regulatory-decisions.md` |
| 3 | Landen/regio's, dataresidency, taalondersteuning | open besluit | PO + Compliance | `docs/compliance/regulatory-decisions.md` |
| 4 | Vergunningplicht, rol als betaaldienstverlener/tussenpersoon | **te valideren door bevoegde specialist** | Compliance | `docs/compliance/compliance-register.md` |
| 5 | Technologiestack en cloudprovider | open besluit | Tech lead | `docs/architecture/adr/` |
| 6 | Sprintduur (aanname: 2 weken) | aanname | Scrum Master | `docs/scrum/scrum-guide.md` |
| 7 | Samenstelling en grootte testgroep (aanname: 8–12 deelnemers) | aanname | UX | `docs/research/test-group-plan.md` |
| 8 | Identiteits-/authenticatieleverancier en MFA-methode | open besluit | Security + Tech lead | `docs/security/access-control.md` |
| 9 | Bewaartermijnen per gegevenscategorie | **te valideren door bevoegde specialist** | Privacy | `docs/privacy/data-retention.md` |
| 10 | Licentiemodel van deze repository (aanname: MIT) | aanname | Eigenaar repo | `LICENSE` |
| 11 | Coveragedrempel (aanname: 70%, groeipad naar 80%) | aanname | Team | `scripts/ci/coverage-check.sh` |
| 12 | Externe leveranciers en verwerkersovereenkomsten | open besluit | Privacy + Inkoop | `docs/compliance/control-mapping.md` |

Volledige placeholderlijst: [`docs/placeholders.md`](docs/placeholders.md).
Optionele uitbreidingen (bewust nog niet ingebouwd): [`docs/optional-extensions.md`](docs/optional-extensions.md).
