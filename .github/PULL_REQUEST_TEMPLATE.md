<!--
Vul alle secties in. "n.v.t." mag, maar altijd met één regel onderbouwing.
Meld beveiligingskwetsbaarheden NIET via een pull request of issue — zie SECURITY.md.
-->

## Samenvatting

<!-- Wat verandert er en waarom? 3–5 zinnen, begrijpelijk voor een reviewer buiten je subteam. -->

## Gekoppeld issue

Closes #
<!-- Extra context: Relates to #, Part of epic # -->

## Type wijziging

- [ ] `feat` — nieuwe functionaliteit
- [ ] `fix` — bugfix
- [ ] `refactor` — herstructurering zonder gedragswijziging
- [ ] `perf` — prestatieverbetering
- [ ] `test` — alleen tests
- [ ] `docs` — alleen documentatie
- [ ] `build` / `ci` — pipeline of afhankelijkheden
- [ ] `chore` — onderhoud
- [ ] **Breaking change** (major-release; licht hieronder toe wat migratie vraagt)

## Screenshots of demo

<!-- UI-wijziging: voor/na. Backend: voorbeeldrequest/response (zonder echte gegevens). -->

## Acceptatiecriteria

<!-- Neem de Given/When/Then-criteria uit het issue over en vink af wat is aangetoond. -->

- [ ] Given … When … Then …
- [ ] Given … When … Then …

## Testresultaten

| Testsoort | Uitgevoerd | Toelichting |
|---|---|---|
| Unit | ⬜ | |
| Integratie | ⬜ | |
| End-to-end | ⬜ | |
| Security (`tests/security/`) | ⬜ | |
| Toegankelijkheid (`tests/accessibility/`) | ⬜ | |
| Handmatig | ⬜ | |

* Coverage: `[VOOR]% → [NA]%` (drempel: `COVERAGE_MIN`)
* Getest in omgeving: `[lokaal / test / staging]`
* Testdata: uitsluitend synthetisch — [ ] bevestigd

## Security-impact

- [ ] Geen — toelichting:
- [ ] Wel — vink aan wat van toepassing is:
  - [ ] authenticatie of sessiebeheer
  - [ ] autorisatie, rollen of rechten
  - [ ] cryptografie, sleutels of secrets
  - [ ] invoervalidatie / uitvoercodering
  - [ ] transactie-, betaal- of limietlogica
  - [ ] logging van gevoelige gegevens
  - [ ] nieuwe externe afhankelijkheid of API
  - [ ] wijziging aan de CI/CD-pipeline
- Threat model bijgewerkt: ⬜ ja ⬜ niet nodig, omdat …
- Openstaande kritieke/hoge bevindingen: ⬜ geen ⬜ toelichting:
- Reviewer security (`@[ORG]/security`) vereist: ⬜ ja ⬜ nee

## Privacy-impact

- [ ] Geen persoonsgegevens geraakt — toelichting:
- [ ] Wel:
  - Welke gegevenscategorieën: …
  - Doel en grondslag (voorlopig): …
  - Gegevensminimalisatie toegepast: ⬜ ja ⬜ nee, omdat …
  - Bewaartermijn geregeld: ⬜ ja ⬜ n.v.t.
  - Nieuwe verwerking of nieuwe ontvanger/leverancier: ⬜ ja ⬜ nee
  - DPIA nodig of bijgewerkt: ⬜ ja ⬜ nee ⬜ te beoordelen door `@[ORG]/privacy`

## Compliance-impact

- [ ] Geen
- [ ] Wel:
  - Betrokken control(s) uit `docs/compliance/control-mapping.md`: …
  - Bewijs vastgelegd in `docs/compliance/audit-evidence.md`: ⬜ ja ⬜ nee
  - Audit trail beïnvloed: ⬜ ja ⬜ nee
  - **Te valideren door bevoegde specialist**: ⬜ ja ⬜ nee

## Database- of datamigraties

- [ ] Geen
- [ ] Wel:
  - Migratie is achterwaarts compatibel (expand/contract): ⬜ ja ⬜ nee
  - Terugdraaibaar: ⬜ ja ⬜ nee — plan:
  - Geschatte duur en impact op beschikbaarheid:
  - Getest op een representatieve datasetgrootte: ⬜ ja ⬜ nee
  - Raakt persoonsgegevens: ⬜ ja (dan ook privacy-impact invullen) ⬜ nee

## Monitoring en observability

- [ ] Logging toegevoegd/aangepast (zonder gevoelige gegevens)
- [ ] Metrics toegevoegd
- [ ] Alert of dashboard bijgewerkt — waar:
- [ ] Audit logging geraakt — toelichting:
- [ ] Niet nodig, omdat …

## Rollbackplan

<!-- Hoe draaien we dit binnen [RTO] terug? Feature flag, revert, herdeploy vorige tag, migratie terug? -->

- Methode:
- Geschatte hersteltijd:
- Feature flag: ⬜ ja, naam: … ⬜ nee

## Documentatiewijzigingen

- [ ] README
- [ ] `docs/architecture/` (incl. ADR bij een belangrijke keuze)
- [ ] `docs/security/` / `docs/privacy/` / `docs/compliance/`
- [ ] `docs/operations/` (runbook, monitoring, deployment)
- [ ] `.env.example`
- [ ] CHANGELOG
- [ ] Niet nodig, omdat …

## Release-impact

- Doelkanaal: ⬜ intern prototype ⬜ testgroepversie ⬜ bèta ⬜ beperkte productie ⬜ algemeen beschikbaar
- Versiebump: ⬜ patch ⬜ minor ⬜ major
- Vereist coördinatie (communicatie, support, leverancier): ⬜ ja, namelijk … ⬜ nee

## Definition of Done — checklist

- [ ] Acceptatiecriteria behaald
- [ ] Code review uitgevoerd (2 reviews bij gevoelige paden)
- [ ] Geautomatiseerde tests geslaagd in CI
- [ ] Relevante unit-, integratie- en end-to-endtests toegevoegd
- [ ] Securitycontroles geslaagd (secret scan, SAST, dependency- en containerscan)
- [ ] Afhankelijkheden en secrets gecontroleerd; geen secrets in code of logs
- [ ] Privacy- en compliancevoorwaarden verwerkt
- [ ] Toegankelijkheid gecontroleerd (`docs/scrum/definition-of-done.md`)
- [ ] Logging en monitoring toegevoegd waar nodig
- [ ] Documentatie bijgewerkt
- [ ] Increment werkt in een representatieve testomgeving
- [ ] Relevante testgroepfeedback vastgelegd in `docs/research/feedback-log.md`
- [ ] Geen openstaande kritieke of hoge kwetsbaarheden
- [ ] Product Owner heeft het resultaat geaccepteerd
