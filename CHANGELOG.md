# Changelog

Alle noemenswaardige wijzigingen aan dit project worden in dit bestand vastgelegd.

Het formaat volgt [Keep a Changelog](https://keepachangelog.com/nl/1.1.0/) en dit project
volgt [Semantic Versioning](https://semver.org/lang/nl/).

Rubrieken: `Toegevoegd`, `Gewijzigd`, `Verouderd`, `Verwijderd`, `Opgelost`, `Security`.
Vermeld bij elke regel het issue- of PR-nummer. Regels met privacy-, compliance- of
security-impact worden expliciet gemarkeerd.

## [Unreleased]

### Opgelost
- `prepare-release-notes.sh` brak af zodra één rubriek geen commits had. De constructie
  `[ -n "$body" ] && printf …` was het laatste commando van de functie, dus onder `set -e`
  stopte het script. In de praktijk trof dat vrijwel elke release: er zijn zelden commits in
  alle zes rubrieken. Nu een `if`-blok. De generator draait voortaan ook als rooktest in
  `ci/all.sh`, want een script dat alleen tijdens een release draait, faalt anders pas op
  het slechtst denkbare moment (#12)

### Gewijzigd
- `retention-days` voor het SBOM-releasebewijs van 365 naar 90. GitHub kapt artifactretentie
  zonder waarschuwing af op het repositorymaximum — 90 dagen voor publieke repositories —
  dus 365 leverde stil 90 op. De workflow belooft nu wat hij levert. Wie langer moet
  bewaren, kiest een andere opslagroute; de opties en het openstaande besluit staan in
  [`docs/compliance/audit-evidence.md`](docs/compliance/audit-evidence.md) §5 (#12)
  — compliance-impact: het bewijsregister claimde een termijn die niet werd gehaald
- De SBOM-action maakt geen eigen artifact meer (`upload-artifact: false`); de stap "SBOM
  bewaren als releasebewijs" doet dat al onder een voorspelbare naam. Voorheen ontstonden
  twee artifacts met dezelfde inhoud en verschillende namen (#12)

## [1.0.1] - 2026-07-31

### Opgelost
- De SBOM-stap in `release.yml` probeerde de SBOM bij een tag-push zelf aan de GitHub
  Release te koppelen, wat faalde op `Resource not accessible by integration`. Daardoor
  brak de job `release-checks` af en werden de licentiecontrole en de vastlegging van de
  SBOM als releasebewijs overgeslagen. `upload-release-assets` staat nu uit, zodat de job
  `contents: read` houdt (#10)

## [1.0.0] - 2026-07-31

Eerste stabiele versie van de Scrum- en DevSecOps-repositorytemplate voor een online
financiële dienst. De template bevat bewust nog placeholders en productafhankelijke
configuratie; die vul je in nadat je een nieuwe repository vanuit de template hebt
aangemaakt. Zie [`docs/placeholders.md`](docs/placeholders.md).

### Toegevoegd
- Scrum-governance: de drie accountabilities, de events, rollen en mandaten, het
  Projects-board, de Definition of Ready en een Definition of Done met universele en
  voorwaardelijke criteria (#6)
- Onboarding: `README.md` als navigatiepunt, `START-HERE.md` voor de eerste week en
  rolspecifieke documentatie voor de Product Owner en developers (#6)
- Drie adoptieniveaus — Core, Advanced en Regulated/Enterprise — met de twee momenten
  waarop je vóóruit moet stappen: privacymaatregelen vóór het ontwerp, en
  Regulated-readiness vóór productie (#6)
- GitHub-configuratie: negen Issue Forms, PR-template, CODEOWNERS, Dependabot,
  labeldefinities en `GOVERNANCE.md` (#6)
- Stack-agnostische scripts: `bootstrap.sh`, twaalf CI-scripts, een releasenotesgenerator
  en `verify-template.sh`, aangevuld met twee zelftestende controlescripts voor SHA-pins
  en documentatielinks (#6)
- Workflows voor CI, code quality, security scanning, dependency review en releases, met
  een fail-closed security gate en deployjobs die alleen bij een tag-push uitrollen (#6)
- Documentatie voor security, privacy, compliance, architectuur, operations en testen,
  inclusief threat model, DPIA-sjabloon, control mapping, SRE-principes en
  platform-readinesschecklist (#6)
- Proces voor gebruikersvalidatie met een testgroep: plan, interviewscript,
  usabilitytestsjabloon, toestemmings- en privacycheck en een weegkader voor feedback (#6)
- Voorbeeldbacklog met productdoel, epics, features en user stories op fictieve gegevens (#6)

### Security
- Alle GitHub Actions vastgezet op een volledige commit-SHA, met een controlescript dat
  dit per bestand en regelnummer afdwingt (#6) — security-impact: hoog
- `actions/upload-artifact` bijgewerkt van 4.6.2 naar 7.0.1 (#7)
- `actions/download-artifact` bijgewerkt van 4.3.0 naar 8.0.1 (#8)

<!--
Voorbeeld van een ingevulde release:

## [1.1.0] - 2026-03-12

### Toegevoegd
- Maandoverzicht per uitgavencategorie op het dashboard (#123)

### Security
- Sessie-timeout teruggebracht van 60 naar 15 minuten (#131) — security-impact: hoog

### Opgelost
- Bedragen werden afgerond weergegeven in het transactieoverzicht (#128)
-->

[Unreleased]: https://github.com/WildcatKSS/Scrum-Template/compare/v1.0.1...HEAD
[1.0.1]: https://github.com/WildcatKSS/Scrum-Template/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/WildcatKSS/Scrum-Template/releases/tag/v1.0.0
