# Sprint Review

**Doel:** het increment inspecteren met belanghebbenden en de backlog aanpassen op basis
van wat we hebben geleerd. Het is een **werksessie**, geen presentatie.
**Duur:** maximaal 2 uur bij een sprint van 2 weken.
**Deelnemers:** team, Product Owner, Scrum Master, belanghebbenden, **vertegenwoordigers
van de testgroep**, security en privacy bij relevante onderwerpen.

## Agenda

| Tijd | Onderdeel |
|---|---|
| 10 min | Sprintdoel, wat is wel en niet af, en waarom |
| 40 min | Demo van het increment in een **werkende omgeving** (geen slides) |
| 20 min | Bevindingen uit de testgroepsessie van deze sprint |
| 15 min | Security-, privacy- en compliancestatus |
| 20 min | Feedback ophalen en vastleggen |
| 15 min | Gevolgen voor de backlog, roadmap en volgende sprint |

## Regels voor de demo

* Demonstreer in een **representatieve testomgeving** met **uitsluitend synthetische
  data** — nooit met productiedata of echte persoonsgegevens.
* Laat alleen zien wat aan de [Definition of Done](definition-of-done.md) voldoet.
  Werk dat niet Done is, benoem je; je demonstreert het niet als resultaat.
* Laat de gebruiker het doen, niet de ontwikkelaar: geef de muis waar mogelijk aan een
  deelnemer uit de testgroep.
* Toon ook de **foutpaden**: wat ziet iemand als het misgaat?

## Vaste agendapunten bij een financiële dienst

| Punt | Wie | Wat wordt getoond |
|---|---|---|
| Securitystatus | Security | openstaande kritieke/hoge bevindingen, opgeloste bevindingen, resultaten van scans |
| Privacystatus | Privacy | nieuwe verwerkingen, DPIA-status, bewaartermijnen |
| Compliancestatus | Compliance | geraakte controls, bewijs, openstaande acties, punten die nog **door een bevoegde specialist gevalideerd** moeten worden |
| Testgroep | UX | wat is getest, met hoeveel deelnemers, wat viel op |
| Operationeel | Dev | incidenten, monitoring, SLO's |

## Feedback vastleggen

Alle feedback wordt tijdens de sessie genoteerd en daarna omgezet in issues:

1. Noteer letterlijk wat is gezegd of waargenomen (geen interpretatie).
2. Maak een issue via `test-group-feedback.yml` of `user-story.yml`.
3. Classificeer: kritiek probleem · gebruiksprobleem · ontbrekende behoefte · verbetering ·
   compliment · nieuwe hypothese · buiten scope.
4. Zet het item op **Inbox**; de PO toetst het volgens
   [`../research/feedback-log.md`](../research/feedback-log.md).
5. **Niets wordt direct toegezegd** in de review. Toezeggen zonder weging leidt tot een
   backlog vol losse wensen.

## Uitkomst

* Bijgewerkte productbacklog.
* Vastgelegde feedback met classificatie.
* Besluit over doorgaan, wijzigen of stoppen als dat aan de orde is
  ([`../product/mvp-scope.md`](../product/mvp-scope.md), §11).
* Bijgewerkte roadmap wanneer inzichten daartoe aanleiding geven.

## Checklist

- [ ] Increment draait in een testomgeving met synthetische data
- [ ] Alleen Done-werk gedemonstreerd; niet-af werk expliciet benoemd
- [ ] Testgroep aanwezig of vertegenwoordigd, met bevindingen
- [ ] Security-, privacy- en compliancestatus behandeld
- [ ] Alle feedback vastgelegd als issue met classificatie
- [ ] Backlog en board bijgewerkt vóór de volgende planning
- [ ] Deelnemers krijgen terugkoppeling over wat er met hun input gebeurt
