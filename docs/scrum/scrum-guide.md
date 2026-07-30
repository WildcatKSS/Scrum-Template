# Zo werken wij: Scrum bij `[PRODUCTNAAM]`

Dit document beschrijft hoe dit team Scrum toepast. Het volgt de Scrum Guide en vult die
aan met wat een **financiële dienst** extra vraagt: security, privacy en compliance zijn
onderdeel van het werk, niet een fase erna.

## 1. Kern in één alinea

Wij werken in sprints van `[SPRINTDUUR — aanname: 2 weken]`. Elke sprint levert een
**bruikbaar, getest en potentieel releasbaar increment** op. "Potentieel releasbaar"
betekent: het voldoet aan de [Definition of Done](definition-of-done.md), inclusief
security-, privacy- en toegankelijkheidscontroles. Of we het ook daadwerkelijk uitrollen,
is een aparte beslissing van de Product Owner.

## 2. Sprintduur

| Optie | Wanneer passend | Nadeel |
|---|---|---|
| **1 week** | ervaren team, volledig geautomatiseerde pipeline, veel onzekerheid | weinig ruimte voor grotere brokken; hoge eventdruk |
| **2 weken (advies)** | standaard; genoeg ruimte voor bouwen én valideren met de testgroep | trager leren dan 1 week |

> **Aanname:** 2 weken. Bevestig dit in de eerste retrospective en leg de keuze hier vast.

## 3. Rollen

Volledige beschrijving: [`roles.md`](roles.md). Kort:

| Rol | Verantwoordelijk voor |
|---|---|
| Product Owner | waarde, backlogprioriteit, acceptatie |
| Scrum Master | werkwijze, events, belemmeringen wegnemen |
| Developers | het increment bouwen en aan de DoD laten voldoen |
| UX / onderzoeker | begrijpen van gebruikers, testgroepsessies, bevindingen |
| Securityverantwoordelijke | securityeisen, threat modelling, kwetsbaarhedenopvolging |
| Privacy-/complianceverantwoordelijke | gegevensbescherming, controls, bewijsvoering |
| Vertegenwoordigers testgroep | gebruikersperspectief inbrengen en increments beoordelen |

De laatste vier rollen zijn **onderdeel van het team**, geen externe poortwachters achteraf.

## 4. Artefacten

| Artefact | Waar | Verbintenis |
|---|---|---|
| Product Backlog | GitHub Issues + Projects-board | Productdoel |
| Sprint Backlog | kolommen *Sprint backlog* → *In progress* | Sprintdoel |
| Increment | main-branch + testomgeving | Definition of Done |

Board en velden: [`project-board.md`](project-board.md).
Labels: [`labels.md`](labels.md).

## 5. Backloghiërarchie

```
Productdoel
└── Epic
    └── Feature
        └── User story
            ├── Technische taak
            ├── Testtaak
            ├── Securitytaak
            └── Compliance- of privacytaak
```

Regels:

* Alleen **user stories** en items met directe waarde krijgen story points; taken worden
  in uren of niet geschat.
* Een user story die niet binnen één sprint past, wordt gesplitst (per stap van de reis,
  per regel/variant, of gelukkig-pad eerst).
* Een story is nooit "af" zonder de bijbehorende security-, privacy- en testtaken.

## 6. Events

| Event | Duur bij 2 weken | Wie | Doel |
|---|---|---|---|
| [Sprint Planning](sprint-planning.md) | max. 4 uur | hele team | sprintdoel en plan bepalen |
| Daily Scrum | 15 minuten | developers (rest optioneel) | voortgang naar het sprintdoel bijsturen |
| [Backlog Refinement](refinement.md) | ~5% van de sprint (±4 uur) | team + PO | items Ready maken |
| [Sprint Review](sprint-review.md) | max. 2 uur | team + belanghebbenden + testgroep | increment inspecteren, feedback ophalen |
| [Sprint Retrospective](retrospective.md) | max. 1,5 uur | team | werkwijze verbeteren |

### Daily Scrum

Elke werkdag, 15 minuten, zelfde tijd en plaats. Het is **geen statusrapportage aan de
Scrum Master**, maar bijsturing door de developers zelf.

Wij lopen het **board van rechts naar links** door en bespreken per item:

1. Wat brengt ons dichter bij het sprintdoel?
2. Wat blokkeert ons? (label `status:blocked`, kolom *Blocked*, met eigenaar en datum)
3. Is er iets veranderd aan risico, security, privacy of compliance?

Vaste extra check bij een financiële dienst:
* staat er iets in *In review* of *Ready for testing* dat wacht op een security- of
  privacybeoordeling?
* zijn er nieuwe kritieke of hoge kwetsbaarheden gemeld door de pipeline?

Alles wat langer duurt dan een minuut, gaat naar een vervolgafspraak direct na de daily.

## 7. Werkafspraken

1. **Definition of Ready** vóór de sprint, **Definition of Done** vóór "Done" — geen
   uitzonderingen zonder expliciet vastgelegd besluit.
2. **Werk in uitvoering beperken:** maximaal `[2]` items per developer in *In progress*.
   Liever samen afmaken dan apart beginnen.
3. **Sprintdoel is heilig, scope is dat niet.** Nieuw werk komt alleen de sprint in als het
   sprintdoel niet in gevaar komt en de PO akkoord is.
4. **Geen werk zonder issue.** Traceerbaarheid is bij een financiële dienst een eis.
5. **Security en privacy zijn taken, geen meningen.** Elk signaal wordt een backlogitem
   met eigenaar.
6. **Testgroepcontact elke sprint**, minimaal elke tweede sprint.
7. **Nooit echte persoonsgegevens of productiedata** buiten productie.
8. **Slechte kwaliteit is nooit een oplossing voor tijdsdruk.** Bij tijdgebrek gaat scope
   eruit, niet de Definition of Done.

## 8. Omgaan met onderbrekingen

| Situatie | Aanpak |
|---|---|
| Kritieke productieverstoring | volg [`../operations/runbook.md`](../operations/runbook.md); sprintdoel kan worden losgelaten in overleg met de PO |
| Kritieke kwetsbaarheid (CVSS ≥ 9) | direct oppakken binnen de SLA uit [`../security/vulnerability-management.md`](../security/vulnerability-management.md) |
| Ad-hocverzoek van een belanghebbende | naar *Inbox* op het board; PO prioriteert |
| Ongepland maar klein werk | reserveer een vaste buffer van `[10]%` capaciteit |

## 9. Meten van het proces

Wij meten om te leren, niet om te beoordelen. Individuele productiviteit wordt niet
gemeten.

| Meetwaarde | Waarvoor |
|---|---|
| Sprintdoel gehaald (ja/nee) | voorspelbaarheid |
| Doorlooptijd van item (Ready for sprint → Done) | stroom |
| Aantal geblokkeerde dagen | belemmeringen |
| Ontsnapte defecten (gevonden na Done) | kwaliteit |
| Openstaande kritieke/hoge kwetsbaarheden | veiligheid |
| Aantal testgroepsessies per 2 sprints | leersnelheid |
| Aantal feedbackitems omgezet in backlogitems | feedbackcyclus |

Velocity is een hulpmiddel voor het team zelf en **geen doel of prestatiemaat**.

## 10. Wanneer wijken we af?

Afwijken mag, mits: het team het besluit neemt, de reden en de vervaldatum worden
vastgelegd in de retrospective, en het niet gaat om een security-, privacy- of
compliance-eis. Die laatste zijn niet onderhandelbaar zonder de procedure voor
risicoacceptatie uit [`../../GOVERNANCE.md`](../../GOVERNANCE.md).
