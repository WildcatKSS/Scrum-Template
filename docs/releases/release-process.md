# Releaseproces

Releasen is een **beslissing**, geen automatisme. De pipeline maakt het mogelijk; mensen
bepalen of het gebeurt.

## 1. Versienummering (Semantic Versioning)

`MAJOR.MINOR.PATCH`

| Onderdeel | Wanneer | Voorbeeld |
|---|---|---|
| MAJOR | onverenigbare wijziging (API, datamodel, gedrag) | 1.0.0 → 2.0.0 |
| MINOR | nieuwe functionaliteit, achterwaarts compatibel | 1.2.0 → 1.3.0 |
| PATCH | bugfix of securityfix, achterwaarts compatibel | 1.2.3 → 1.2.4 |

Prereleases: `1.3.0-rc.1`, `1.3.0-beta.1`. Tags: `v1.3.0`.
Versies vóór `1.0.0` zijn niet stabiel; dat mag, mits duidelijk gecommuniceerd.

## 2. Releasekanalen

| Kanaal | Voor wie | Data | Voorwaarden |
|---|---|---|---|
| **Intern prototype** | team | synthetisch | CI groen |
| **Testgroepversie** | testgroep (`[8–12]` deelnemers) | synthetisch | DoD gehaald, geen kritieke/hoge kwetsbaarheden, toestemming geregeld |
| **Bèta** | `[grotere groep]` | synthetisch of beperkt echt — **te valideren** | DPIA afgerond, securitycheck, support geregeld |
| **Beperkte productie-uitrol** | `[X]%` van de gebruikers | echt | volledige releasechecklist, pentest, goedkeuringen |
| **Algemene beschikbaarheid** | iedereen | echt | beperkte uitrol stabiel gedurende `[2]` weken |

Overgang naar een volgend kanaal is een expliciet besluit van PO + Security + Compliance.

## 3. Stappen

### 1. Releasekandidaat
Tag `vX.Y.Z-rc.N` op `main`. De pipeline bouwt, test en scant. Resultaat: artifact + SBOM.

### 2. Regressietests
Volledige unit-, integratie- en end-to-endsuite plus handmatige verificatie van de
kernreis op staging.

### 3. Securitycheck
Geen openstaande kritieke of hoge bevindingen. Nieuwe afhankelijkheden beoordeeld. Bij
wijzigingen aan authenticatie, autorisatie of geldstromen: expliciete beoordeling door de
securityverantwoordelijke. **Vetorecht.**

### 4. Privacy- en compliancecheck
Nieuwe of gewijzigde verwerkingen beoordeeld, bewaartermijnen geregeld, DPIA bijgewerkt,
controls en bewijs bijgewerkt, openstaande regulatoire vragen niet blokkerend.
**Vetorecht.**

### 5. Goedkeuring Product Owner
Acceptatiecriteria behaald, testgroepfeedback verwerkt, releasenotes gecontroleerd,
communicatie geregeld.

### 6. Gecontroleerde uitrol
Tag `vX.Y.Z` → goedkeuring op de `production`-environment → gefaseerde uitrol
(5% → 25% → 100%) met observatie tussen de stappen.

### 7. Monitoring
Minimaal `[30]` minuten actief meekijken: foutratio, latency, inlogpogingen, mislukte
transacties, auditlogvolume. Iemand kijkt daadwerkelijk, niet alleen "het dashboard staat open".

### 8. Rollback beschikbaar
Feature flag, vorige tag of migratieterugval — het plan staat in de pull request en is
getest.

### 9. Evaluatie na release
Binnen `[3]` werkdagen: werkte de uitrol, wat merkten gebruikers, wat leren we voor de
volgende keer? Bevindingen naar de retrospective; bewijs naar `audit-evidence.md`.

## 4. Releasenotes

Gegenereerd met `scripts/release/prepare-release-notes.sh` op basis van Conventional
Commits, daarna aangevuld door het team met: releasekanaal, security-, privacy- en
compliance-impact, migraties, rollbackplan, goedkeuringen en bekende beperkingen.

Publieke releasenotes bevatten **geen** exploitdetails. Een securityfix wordt neutraal
beschreven ("verbeterde controle op X"), met details pas na een redelijke updateperiode.

## 5. Hotfix

1. Branch `fix/…` vanaf de tag van de laatste release.
2. Minimale wijziging + test die het probleem afdekt.
3. Versnelde maar **volledige** securitycheck; de DoD blijft gelden.
4. Tag `vX.Y.Z+1`, uitrollen, monitoren.
5. Terugmergen naar `main`; post-mortem als het een incident betrof.

## 6. Wanneer releasen we niet?

* Bij een openstaande kritieke of hoge kwetsbaarheid.
* Bij een blokkerende privacy- of compliancevraag.
* Zonder rollbackplan.
* Zonder iemand die na de uitrol daadwerkelijk meekijkt.
* Vlak vóór een periode waarin niemand beschikbaar is (bijvoorbeeld vrijdagmiddag), tenzij
  het een securityfix is.
