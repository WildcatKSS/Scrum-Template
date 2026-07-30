# Definition of Done

De Definition of Done (DoD) beschrijft wanneer werk **echt af** is. Het is de kwaliteits-
ondergrens van het increment. Bij een financiële dienst is de DoD niet onderhandelbaar:
bij tijdgebrek gaat er scope uit, nooit kwaliteit.

Een item is pas **Done** wanneer **alle** onderstaande punten waar zijn.

## 1. Functioneel

| # | Criterium | Bewijs |
|---|---|---|
| 1 | De acceptatiecriteria zijn behaald | afgevinkt in issue en pull request |
| 2 | De Product Owner heeft het resultaat geaccepteerd | PO-akkoord in het issue of tijdens de review |

## 2. Code en review

| # | Criterium | Bewijs |
|---|---|---|
| 3 | Code review is uitgevoerd | goedgekeurde review; 2 reviews en CODEOWNERS-akkoord bij gevoelige paden |
| 4 | Geautomatiseerde tests zijn geslaagd | groene CI-run op de pull request |
| 5 | Relevante unit-, integratie- en end-to-endtests zijn toegevoegd | testbestanden in `tests/`; dekking boven `COVERAGE_MIN` |

## 3. Security

| # | Criterium | Bewijs |
|---|---|---|
| 6 | Securitycontroles zijn geslaagd | secret scan, SAST, dependency- en containerscan groen (`security-scan.yml`) |
| 7 | Afhankelijkheden en secrets zijn gecontroleerd | geen nieuwe kwetsbare of niet-toegestane afhankelijkheid; geen secrets in code, logs of foutmeldingen |
| 8 | Er zijn geen kritieke of hoge onbehandelde kwetsbaarheden | scanresultaat, of vastgelegde risicoacceptatie volgens `GOVERNANCE.md` |
| 9 | Autorisatie is aantoonbaar afgedwongen | test die aantoont dat gebruiker A niet bij de gegevens van gebruiker B kan |

## 4. Privacy en compliance

| # | Criterium | Bewijs |
|---|---|---|
| 10 | Privacy- en compliancevoorwaarden zijn verwerkt | gegevensminimalisatie toegepast; doel, grondslag en bewaartermijn geregeld of expliciet n.v.t. |
| 11 | Raakt het item een control, dan is het bewijs vastgelegd | regel in `../compliance/audit-evidence.md` |
| 12 | Er staan geen persoonsgegevens in logs, URL's of foutmeldingen | codereview + logcontrole |

## 5. Gebruikskwaliteit

| # | Criterium | Bewijs |
|---|---|---|
| 13 | Toegankelijkheid is gecontroleerd | geautomatiseerde a11y-check groen **en** handmatige toetsenbordcontrole; WCAG 2.2 AA op de kernreis |
| 14 | Teksten zijn begrijpelijk | streven taalniveau B1; financiële termen uitgelegd; geen misleidende weergave |

## 6. Operatie

| # | Criterium | Bewijs |
|---|---|---|
| 15 | Logging en monitoring zijn toegevoegd waar nodig | logregels, metrics of alerts benoemd in de pull request |
| 16 | Het increment werkt in een representatieve testomgeving | uitgerold en gecontroleerd op `[STAGING]`, met synthetische data |
| 17 | Migraties zijn terugdraaibaar en getest | rollbackplan in de pull request |

## 7. Kennisdeling

| # | Criterium | Bewijs |
|---|---|---|
| 18 | Documentatie is bijgewerkt | README, `docs/…`, `.env.example`, ADR bij een belangrijke keuze |
| 19 | Relevante feedback van de testgroep is vastgelegd | regel in `../research/feedback-log.md`, veld *Testgroepstatus* bijgewerkt |
| 20 | De changelog is bijgewerkt | regel onder `Unreleased` in `CHANGELOG.md` |

## Wat "Done" **niet** is

* Niet: "werkt op mijn machine".
* Niet: "tests komen in een volgende sprint".
* Niet: "security kijkt er later naar".
* Niet: "documentatie doen we aan het einde".
* Niet: "de feature flag staat uit, dus het hoeft niet af te zijn". Ook code achter een
  vlag moet aan de DoD voldoen.

## Uitzonderingen

Afwijken van de DoD kan alleen met een expliciet, vastgelegd besluit:

1. Beschrijf wat er niet is gedaan en waarom.
2. Bepaal de impact op gebruikers, geld en gegevens.
3. Laat het accorderen door de mandaathouder (`GOVERNANCE.md`); kritieke en hoge
   securityrisico's kan het team **niet** zelf accepteren.
4. Maak een backlogitem met een houdbaarheidsdatum.
5. Vermeld het in de Sprint Review.

## Groeipad

De DoD groeit mee met het team. Wat nu nog niet haalbaar is, staat hier met een datum:

| Criterium | Status | Doel |
|---|---|---|
| Dekkingsdrempel 70% | actief | verhogen naar 80% per `[JJJJ-MM-DD]` |
| End-to-endtests op de kernreis | groeit | volledig per `[JJJJ-MM-DD]` |
| Handmatige schermlezercontrole | steekproef | elke UI-story per `[JJJJ-MM-DD]` |
| Externe pentest | gepland | vóór productie-uitrol |
