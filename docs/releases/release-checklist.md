# Releasechecklist

Af te vinken vóór elke release naar bèta, beperkte productie of algemene beschikbaarheid.
Voor een interne prototypeversie volstaat sectie 1.

**Release:** `v[X.Y.Z]` · **Kanaal:** `[…]` · **Datum:** `[JJJJ-MM-DD]` ·
**Releaseverantwoordelijke:** `[NAAM]`

> Voorwaarde vooraf: de release loopt via een **tag-push** op de hoofdbranch. Een
> handmatige workflow-run is een droogrun en rolt niets uit; productie vereist bovendien
> een stabiele SemVer-versie en een kanaal uit de productie-allowlist. Zie
> [`../operations/deployment.md`](../operations/deployment.md) §6.

## 1. Kwaliteit

- [ ] Alle verplichte CI-checks groen (build, lint, unit, integratie, coverage, e2e, a11y)
- [ ] Regressietests uitgevoerd op staging
- [ ] Handmatige verificatie van de kernreis
- [ ] Geen bekende blokkerende bugs
- [ ] Testdekking ≥ `COVERAGE_MIN`
- [ ] Increment werkt in een representatieve testomgeving met synthetische data

## 2. Security — *vetorecht securityverantwoordelijke*

- [ ] Secret scanning zonder bevindingen
- [ ] SAST zonder openstaande kritieke/hoge bevindingen
- [ ] Dependency- en containerscan zonder kritieke/hoge bevindingen
- [ ] SBOM gegenereerd en gearchiveerd
- [ ] Licentiecontrole geslaagd
- [ ] Nieuwe afhankelijkheden beoordeeld
- [ ] Threat model bijgewerkt bij wijziging van een vertrouwensgrens
- [ ] Securitytests (`tests/security/`) geslaagd
- [ ] Secrets geroteerd waar nodig; geen secrets in code of logs
- [ ] Pentestbevindingen opgevolgd (vóór productie)
- [ ] **Akkoord security:** `[NAAM]` op `[DATUM]`

## 3. Privacy — *vetorecht privacyverantwoordelijke*

- [ ] Nieuwe of gewijzigde verwerkingen beoordeeld
- [ ] Gegevensminimalisatie toegepast
- [ ] Doel en grondslag vastgelegd per verwerking
- [ ] Bewaartermijnen geregeld en verwijderroutines actief
- [ ] Rechten van betrokkenen werken aantoonbaar (inzage, export, verwijdering)
- [ ] Toestemmingsflow werkt en is intrekbaar
- [ ] Geen persoonsgegevens in logs, URL's, foutmeldingen of monitoring
- [ ] DPIA opgesteld of bijgewerkt indien nodig
- [ ] **Akkoord privacy:** `[NAAM]` op `[DATUM]`

## 4. Compliance — *vetorecht complianceverantwoordelijke*

- [ ] Geraakte controls bijgewerkt in `../compliance/control-mapping.md`
- [ ] Bewijs vastgelegd in `../compliance/audit-evidence.md`
- [ ] Complianceregister bijgewerkt
- [ ] Geen blokkerende openstaande vraag in `../compliance/regulatory-decisions.md`
- [ ] Punten die validatie door een bevoegde specialist vragen, zijn als zodanig gemarkeerd
- [ ] Audit trail werkt en is compleet
- [ ] **Akkoord compliance:** `[NAAM]` op `[DATUM]`

## 5. Product — *Product Owner (releasebesluit, geen Done-gate)*

- [ ] Alle opgenomen items zijn Done volgens de Definition of Done (objectief vastgesteld)
- [ ] Feedback uit gebruikersvalidatie verwerkt of expliciet uitgesteld met motivatie
- [ ] Releasenotes gecontroleerd en begrijpelijk voor de doelgroep
- [ ] Communicatie naar gebruikers/support geregeld
- [ ] Bekende beperkingen benoemd
- [ ] **Releasebesluit Product Owner:** `[NAAM]` op `[DATUM]`

## 6. Operatie

- [ ] Migratieplan aanwezig, terugdraaibaar en getest
- [ ] Rollbackplan aanwezig, met verwachte hersteltijd
- [ ] Monitoring en alarmering actief voor nieuwe functionaliteit
- [ ] Runbook bijgewerkt
- [ ] Back-up recent en verifieerbaar
- [ ] Capaciteit toereikend voor de verwachte belasting
- [ ] Iemand kijkt na de uitrol daadwerkelijk mee, gedurende `[30]` minuten
- [ ] Uitrolvenster afgestemd (geen release zonder beschikbare mensen)

## 7. Toegankelijkheid en begrijpelijkheid

- [ ] Geautomatiseerde a11y-controle geslaagd
- [ ] Handmatige toetsenbordcontrole op de kernreis
- [ ] Contrast en focusindicatie gecontroleerd
- [ ] Teksten op streefniveau B1, financiële termen uitgelegd
- [ ] Geen misleidende weergave van bedragen, kosten of risico's

## 8. Na de release

- [ ] Uitrol succesvol afgerond en gemonitord
- [ ] Changelog bijgewerkt en release gepubliceerd
- [ ] Bewijs vastgelegd (`../compliance/audit-evidence.md`)
- [ ] Evaluatie binnen `[3]` werkdagen ingepland
- [ ] Deelnemers aan de gebruikersvalidatie geïnformeerd over wat er nieuw is
- [ ] Openstaande punten als backlogitems vastgelegd

---

**Eindbesluit:** ⬜ vrijgegeven ⬜ uitgesteld ⬜ afgebroken
**Onderbouwing:** …
