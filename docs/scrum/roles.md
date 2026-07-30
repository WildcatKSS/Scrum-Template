# Rollen, expertise en verantwoordelijkheden

Scrum kent binnen het **Scrum Team** drie accountabilities: **Product Owner**,
**Scrum Master** en **Developers**. Meer accountabilities bestaan niet — ook niet bij een
financiële dienst. Wat wél bestaat, is extra *expertise* binnen de Developers en
*governanceverantwoordelijkheden* daarbuiten.

Dit document scheidt vier dingen die vaak door elkaar lopen:

| Begrip | Betekenis | Voorbeeld |
|---|---|---|
| **Scrum-accountability** | een van de drie rollen in het Scrum Team | Product Owner |
| **Vakexpertise** | wat iemand kan; zit binnen de Developers | UX-onderzoek, security engineering |
| **Governance- of toezichtrol** | onafhankelijke verantwoordelijkheid buiten het Scrum Team | DPO, compliance officer |
| **Stakeholder / testdeelnemer** | levert input en beoordeelt, maakt het increment niet | testgroeplid, opdrachtgever |

Mandaten en escalatie: [`../../GOVERNANCE.md`](../../GOVERNANCE.md).

---

## 1. Het Scrum Team

### Product Owner

* Bezit de productvisie, het productdoel en de volgorde van de Product Backlog.
* Maakt de acceptatiecriteria vooraf duidelijk, samen met de Developers.
* Inspecteert het resultaat, past de Product Backlog aan en beslist of en wanneer een Done
  increment wordt vrijgegeven.
* Is aanspreekbaar op "waarom bouwen we dit nu?".
* **Financiële context:** weegt gebruikerswaarde af tegen risico en zorgplicht; kan
  security-, privacy- of compliance-eisen niet wegprioriteren.
* **Niet:** een technisch onvolledig increment Done verklaren, of met een persoonlijke
  goedkeuring een extra kwaliteitspoort naast de Definition of Done vormen
  ([`definition-of-done.md`](definition-of-done.md) §2).

### Scrum Master

* Zorgt dat de werkwijze werkt en verbetert; faciliteert de events.
* Verwijdert belemmeringen en maakt ze zichtbaar (kolom *Blocked*).
* Bewaakt dat DoR en DoD echt worden toegepast en niet stilzwijgend worden opgerekt.
* Coacht op samenwerking, niet op individuele output.

### Developers

Iedereen die aan het increment werkt — ongeacht functietitel. De Developers zijn
**multidisciplinair** en bevatten samen alle expertise die nodig is om elke sprint een
Done increment te maken:

| Expertise binnen de Developers | Draagt bij aan |
|---|---|
| Software- en platformontwikkeling | de werkende oplossing |
| UX en gebruikersonderzoek | begrijpelijkheid, toegankelijkheid, validatie met gebruikers |
| Testen en kwaliteitsborging | teststrategie, geautomatiseerde controles |
| Security engineering | threat modelling, securitytests, veilige implementatie |
| Privacy engineering | gegevensminimalisatie, bewaartermijnen, rechten van betrokkenen |
| Compliance-uitvoering | controls implementeren, bewijs vastleggen |
| Operations | deployment, monitoring, herstelbaarheid |

De Developers zijn gezamenlijk verantwoordelijk voor de Definition of Done — inclusief
tests, securitycontroles, logging en documentatie — en zeggen "nog niet Done" wanneer dat
zo is.

> **Geen aparte Scrum-rollen.** Een UX-onderzoeker, security engineer of privacy engineer
> die structureel aan het increment bijdraagt, ís een Developer. Dat maakt het werk niet
> minder gespecialiseerd; het voorkomt alleen dat kwaliteit "van iemand anders" wordt.

---

## 2. Specialisten en governancerollen buiten het Scrum Team

Sommige verantwoordelijkheden moeten juist **onafhankelijk** zijn van het team dat bouwt.
Die blijven bestaan, maar zijn geen Scrum-accountability.

| Rol | Positie | Verantwoordelijkheid | Mandaat |
|---|---|---|---|
| **Security officer / CISO** | governance | securitykaders, onafhankelijke beoordeling, kwetsbaarhedenbeleid | vetorecht op release bij openstaande kritieke/hoge bevindingen |
| **Privacy officer / DPO** | governance (wettelijk onafhankelijk) | toezicht op gegevensbescherming, DPIA-oordeel | vetorecht bij onaanvaardbaar privacyrisico; adviseert, voert niet uit |
| **Compliance officer** | governance | complianceregister, controls, bewijsvoering, regulatoire vragen | vetorecht op release |
| **Interne of externe audit** | toezicht | toetst of controls werken | rapporteert aan `[BESTUUR]` |
| **Opdrachtgever / stuurgroep** | stakeholder | budget, mandaat, strategische kaders | escalatiepunt |

Werkt zo iemand daarnaast **structureel mee aan het increment** (bijvoorbeeld een security
engineer die de maatregelen zelf bouwt), dan is die persoon voor dát werk een Developer.
Combineer onafhankelijk toezicht en uitvoering niet in dezelfde persoon voor hetzelfde
onderwerp: wie zijn eigen werk goedkeurt, keurt niets.

---

## 3. Stakeholders en onderzoeksdeelnemers

| Groep | Positie | Rol |
|---|---|---|
| **Deelnemers testgroep** | onderzoeksdeelnemers, **geen** leden van het Scrum Team | leveren gedrag, ervaringen en feedback in onderzoekssessies en soms in de Sprint Review |
| **Support en operations** | stakeholders | brengen praktijkervaring en operationele eisen in |
| **Business en marketing** | stakeholders | brengen commerciële context in |

Stakeholders **adviseren**; zij bepalen niet de prioriteit. Die weging doet de Product
Owner op basis van visie, frequentie, impact, risico, haalbaarheid, strategische waarde en
bewijssterkte ([`../research/feedback-log.md`](../research/feedback-log.md)).

Deelnemers uit de testgroep werken uitsluitend met een testaccount en synthetische
gegevens, en krijgen altijd terugkoppeling over wat er met hun inbreng is gebeurd. Zie
[`../research/consent-and-privacy-check.md`](../research/consent-and-privacy-check.md).

---

## 4. Wie doet wat in welk event?

| Event | Product Owner | Scrum Master | Developers | Governance/specialist | Stakeholders & testgroep |
|---|---|---|---|---|---|
| Sprint Planning | leidt het "wat" | faciliteert | bepalen het "hoe" en de omvang | op afroep bij risico | — |
| Daily Scrum | optioneel | optioneel | verplicht | — | — |
| Refinement | verplicht | faciliteert | verplicht (incl. UX-, security- en privacyexpertise) | op afroep | — |
| Sprint Review | leidt | faciliteert | tonen het increment en de bevindingen | bevestigen controls | aanwezig, geven feedback |
| Retrospective | verplicht | faciliteert | verplicht | alleen op uitnodiging | niet aanwezig |

---

## 5. Bezetting

| Verantwoordelijkheid | Naam | Positie | Bezetting |
|---|---|---|---|
| Product Owner | `[NAAM]` | Scrum Team | `[FTE]` |
| Scrum Master | `[NAAM]` | Scrum Team | `[FTE]` |
| Developers (incl. UX, test, security-, privacy- en operationsexpertise) | `[NAMEN]` | Scrum Team | `[FTE]` |
| Security officer | `[NAAM]` | governance | `[FTE]` |
| Privacy officer / DPO | `[NAAM]` | governance | `[FTE]` |
| Compliance officer | `[NAAM]` | governance | `[FTE]` |
| Coördinator testgroep | `[NAAM]` | Developers (UX-expertise) | `[FTE]` |

> **Aanname:** security- en privacyexpertise is parttime beschikbaar (`[0,2 FTE]`). Blijkt
> dat onvoldoende om elke sprint een Done increment te maken, dan is dat een belemmering
> voor de Scrum Master om te escaleren — geen reden om criteria te laten vallen.
