# Teststrategie

> **Doel:** één plek die uitlegt wát we testen, op welk niveau, en wie waarvoor zorgt.
> **Wanneer gebruiken:** bij refinement (welke tests horen hierbij?), bij het schrijven van
> een pull request, en bij twijfel over het juiste testniveau.
> **Wie:** alle Developers; testexpertise binnen het team bewaakt de samenhang.
> **Adoptieniveau:** Core (§1–4), Advanced (§5–9).
> **Gerelateerd:** [`../scrum/definition-of-done.md`](../scrum/definition-of-done.md) ·
> [`../../tests/README.md`](../../tests/README.md) ·
> [`../security/security-testing.md`](../security/security-testing.md)

Dit document is de **navigatie**; de details staan waar ze gebruikt worden:
per testmap een README, securitytests in
[`../security/security-testing.md`](../security/security-testing.md), toegankelijkheid in
[`../../tests/accessibility/README.md`](../../tests/accessibility/README.md).

---

## 1. Waar testen we tegen? (kwaliteitsrisico's)

Testen is risicobeheersing, geen dekking najagen. Bij een financiële dienst wegen deze
risico's het zwaarst:

| # | Risico | Gevolg | Zwaartepunt in de teststrategie |
|---|---|---|---|
| R1 | Onjuiste bedragen of berekeningen | direct verlies van vertrouwen en mogelijk van geld | unit- en propertytests op domeinlogica |
| R2 | Gegevens van de verkeerde gebruiker zichtbaar | datalek | negatieve autorisatietests (S-1) |
| R3 | Toegang zonder geldige authenticatie | accountovername | integratie- en securitytests |
| R4 | Onbegrijpelijke of misleidende informatie | verkeerde financiële beslissing | usability- en toegankelijkheidstests |
| R5 | Verlies of corruptie van gegevens | onherstelbaar | migratie- en hersteltests |
| R6 | Onbeschikbaarheid op een kritiek moment | gebruiker kan niet bij zijn geld | e2e-rooktests, monitoring |
| R7 | Fouten door een externe koppeling | verouderd of onjuist inzicht | integratietests met mocks, faalscenario's |

Voor elk risico geldt: **welk bewijs hebben we dat dit niet gebeurt?** Dat bewijs is een
test — niet een mening.

## 2. Testniveaus

De piramide is een **richtlijn over kosten en snelheid**, geen percentageverdeling om te
halen. Vuistregel: test zo laag als kan, zo hoog als moet.

| Niveau | Wat | Wanneer | Waar |
|---|---|---|---|
| **Unit** | losse functies, domeinregels, berekeningen | altijd bij logica | `tests/unit/` |
| **Component** | één module met zijn directe randen (gemockt) | bij samenhangende logica | `tests/unit/` of `tests/integration/` |
| **Integratie** | samenwerking met database, wachtrij, externe API (mock/sandbox) | bij I/O en persistentie | `tests/integration/` |
| **Contract** | afspraken tussen diensten of met `[PROVIDER]` | bij meerdere teams of externe API's | `tests/integration/` |
| **End-to-end** | de volledige gebruikersreis in een browser | kernreizen, klein houden | `tests/end-to-end/` |
| **Security** | misbruikscenario's uit het threat model | bij auth, geld, gegevens | `tests/security/` |
| **Toegankelijkheid** | WCAG 2.2 AA | bij elke UI-wijziging | `tests/accessibility/` |
| **Exploratory (handmatig)** | gericht zoeken naar wat je niet hebt bedacht | per increment, timeboxed | notities in het issue |
| **Usability** | begrijpen gebruikers het? | bij gebruikersgerichte wijzigingen | [`../research/`](../research/) |

**Wanneer welk niveau?**

| Vraag | Niveau |
|---|---|
| Klopt deze berekening in alle randgevallen? | unit |
| Slaat dit correct op en komt het correct terug? | integratie |
| Breekt mijn wijziging de afnemer van deze API? | contract |
| Kan de gebruiker de reis van begin tot eind doorlopen? | end-to-end |
| Kan een ander erbij? | security |
| Snapt iemand wat er staat? | usability |
| Wat hebben we niet bedacht? | exploratory |

## 3. Wie is verantwoordelijk?

Testen is **teamwerk**, geen fase en geen aparte rol. De Developers schrijven en
onderhouden de tests; testexpertise binnen het team helpt bij strategie, dekking en
exploratory testing. Er is geen overdracht naar een testfase na de sprint — dat is een
[antipatroon](../scrum/anti-patterns.md#12-aparte-security--of-testfase-na-de-sprint).

## 4. Testdata en omgevingen

* **Uitsluitend synthetische data.** Nooit productiedata, ook niet "geanonimiseerd" —
  financiële gegevens zijn lastiger te anonimiseren dan ze lijken.
* **Reproduceerbaar:** vaste seeds, geen afhankelijkheid van de echte klok of het internet.
* **Herkenbaar fictief:** `test.user+p1@example.invalid`, bedragen als `12,34`,
  IBAN's uit de gereserveerde testreeks.
* **Externe koppelingen** draaien in `PROVIDER_MODE=mock` of sandbox; `live` is in tests
  technisch geblokkeerd.

| Omgeving | Gebruikt voor | Data |
|---|---|---|
| lokaal | unit, integratie | synthetisch |
| CI | alles wat geautomatiseerd is | synthetisch, per run weggegooid |
| staging | e2e, exploratory, gebruikerssessies | synthetisch, stabiel |
| productie | **geen tests** behalve rooktests na uitrol | echt |

## 5. Automatisering en regressie *(Advanced)*

* Alles wat in CI kan, hoort in CI: `scripts/ci/all.sh` draait dezelfde keten lokaal.
* **Elke bugfix krijgt een test die eerst faalt.** Zonder die test is de fix niet af.
* **Elke opgeloste kwetsbaarheid krijgt een regressietest** in `tests/security/`.
* Dekking wordt bewaakt met `COVERAGE_MIN` — een ondergrens, geen doel. 100% dekking met
  betekenisloze tests is slechter dan 70% met scherpe tests.
* Trage of instabiele tests worden gerepareerd of verwijderd, niet genegeerd: een suite die
  soms rood is, wordt niet meer gelezen.

## 6. Exploratory testing *(Advanced)*

Timeboxed (30–60 minuten per increment), met een charter:

> *Onderzoek [gebied] met [middelen] om [informatie] te ontdekken.*

Bijvoorbeeld: *onderzoek het maandoverzicht met extreme en negatieve bedragen om
weergavefouten te ontdekken.* Bevindingen worden bugs of testtaken; herhaalbare gevallen
worden geautomatiseerd.

## 7. Niet-functioneel testen *(Advanced)*

| Aspect | Aanpak | Wanneer |
|---|---|---|
| **Performance** | belastingtest op de kernreis, p95-latency tegen de SLO | vóór bredere uitrol en bij zware wijzigingen |
| **Betrouwbaarheid** | faalinjectie: koppeling traag of weg, database niet bereikbaar | na de eerste storing, daarna periodiek |
| **Observability** | valideer dat een gesimuleerde fout ook echt een alert oplevert | per kwartaal |
| **Herstel** | back-up terugzetten in een aparte omgeving | per kwartaal ([`../operations/backup-and-recovery.md`](../operations/backup-and-recovery.md)) |

## 8. Acceptatie- en releasecriteria

| Niveau | Criterium |
|---|---|
| **Story** | de Given/When/Then-acceptatiecriteria zijn aantoonbaar behaald (DoD U1) |
| **Increment** | universele DoD-criteria groen, conditionele criteria afgehandeld of onderbouwd |
| **Release** | regressiesuite groen, securitycontroles geslaagd, kernreis handmatig geverifieerd, geen kritieke of hoge bevindingen ([`../releases/release-checklist.md`](../releases/release-checklist.md)) |

## 9. Groeipad per adoptieniveau

| | Core | Advanced | Regulated |
|---|---|---|---|
| Unit | ✅ | ✅ | ✅ |
| Integratie | bij persistentie | ✅ | ✅ |
| Security (S-1, S-2) | ✅ zodra er auth is | volledige set | volledige set + pentest |
| End-to-end | 1 kernreis | alle kernreizen | + faalpaden |
| Toegankelijkheid | geautomatiseerd | + handmatig | + externe audit |
| Performance | — | kernreis | + capaciteitsplanning |
| Exploratory | ad hoc | per increment | + charterregistratie |
| Hersteltest | — | per kwartaal | per kwartaal met bewijs |
