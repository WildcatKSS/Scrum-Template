# Rollen in het team

Scrum kent drie verantwoordelijkheden (Product Owner, Scrum Master, Developers). Bij een
financiële dienst vullen wij die aan met vier expertisen die **binnen** het team zitten.
Mandaten en escalatie: [`../../GOVERNANCE.md`](../../GOVERNANCE.md).

## Product Owner

* Bezit de productvisie, het productdoel en de volgorde van de backlog.
* Formuleert waarom iets waarde heeft; het team bepaalt hoe.
* Accepteert of verwerpt het increment.
* Is aanspreekbaar op de vraag "waarom bouwen we dit nu?".
* **Financiële context:** weegt gebruikerswaarde af tegen risico en zorgplicht; mag
  security-, privacy- of compliance-eisen niet wegprioriteren.
* GitHub: eigenaar van labels `priority:*`, van de kolomvolgorde en van acceptatie.

## Scrum Master

* Zorgt dat de werkwijze werkt en verbetert; faciliteert de events.
* Verwijdert belemmeringen en maakt ze zichtbaar (kolom *Blocked*).
* Bewaakt dat DoR en DoD echt worden toegepast.
* Coacht op samenwerking, niet op individuele output.
* GitHub: bewaakt boardhygiëne, doorlooptijden en het aantal geblokkeerde items.

## Developers

* Alle mensen die aan het increment bouwen: back-end, front-end, data, platform, test.
* Bepalen samen hoe het werk wordt uitgevoerd en schatten het werk.
* Zijn gezamenlijk verantwoordelijk voor de Definition of Done — inclusief tests,
  securitycontroles, logging en documentatie.
* Zeggen "nog niet Done" wanneer dat zo is.

## UX- en gebruikersonderzoeker

* Brengt gebruikersbehoeften, gedrag en begrijpelijkheid in kaart.
* Organiseert testgroepsessies en legt bevindingen geanonimiseerd vast.
* Bewaakt toegankelijkheid (WCAG 2.2 AA) en begrijpelijke taal (streven B1).
* Bewaakt dat er geen dark patterns ontstaan.
* GitHub: eigenaar van `docs/research/`, label `feedback:test-group`.

## Securityverantwoordelijke

* Vertaalt dreigingen naar concrete eisen en backlogitems.
* Voert threat modelling uit per epic en beoordeelt gevoelige pull requests.
* Beheert kwetsbaarhedenopvolging en de SLA's daarvoor.
* Heeft **vetorecht** op release bij openstaande kritieke of hoge kwetsbaarheden.
* GitHub: CODEOWNER voor security-gevoelige paden; beheert `SECURITY.md`.

## Privacy- of complianceverantwoordelijke

* Bewaakt gegevensminimalisatie, doelbinding, grondslagen en bewaartermijnen.
* Onderhoudt het complianceregister, de control mapping en de bewijsvoering.
* Beoordeelt of een DPIA nodig is en begeleidt die.
* Markeert juridische conclusies als **te valideren door een bevoegde specialist**.
* Heeft **vetorecht** bij een onaanvaardbaar privacy- of compliancerisico.
* GitHub: CODEOWNER voor `docs/privacy/` en `docs/compliance/`.

## Vertegenwoordigers van de testgroep

* Twee tot drie deelnemers uit `[TESTGROEP]` die het gebruikersperspectief inbrengen.
* Nemen deel aan de Sprint Review en aan usabilitysessies.
* Geven feedback; zij bepalen **niet** de prioriteit — die weging doet de PO op basis van
  visie, frequentie, impact, risico, haalbaarheid, strategische waarde en bewijssterkte.
* Krijgen altijd terugkoppeling over wat er met hun feedback is gebeurd.
* Werken uitsluitend met synthetische gegevens en een testaccount.
* Voorwaarden en toestemming: [`../research/consent-and-privacy-check.md`](../research/consent-and-privacy-check.md).

## Wie doet wat in welk event?

| Event | PO | SM | Dev | UX | Security | Privacy/Compliance | Testgroep |
|---|---|---|---|---|---|---|---|
| Sprint Planning | leidt het "wat" | faciliteert | bepaalt het "hoe" | brengt inzichten in | beoordeelt risico | beoordeelt impact | — |
| Daily Scrum | optioneel | optioneel | verplicht | optioneel | optioneel | optioneel | — |
| Refinement | verplicht | faciliteert | verplicht | verplicht | verplicht bij risico | verplicht bij gegevens | — |
| Sprint Review | leidt | faciliteert | toont | toont bevindingen | bevestigt controles | bevestigt controls | **aanwezig** |
| Retrospective | verplicht | faciliteert | verplicht | verplicht | optioneel | optioneel | — |

## Bezetting

| Rol | Naam | Bezetting | Vervanger |
|---|---|---|---|
| Product Owner | `[NAAM]` | `[FTE]` | `[NAAM]` |
| Scrum Master | `[NAAM]` | `[FTE]` | `[NAAM]` |
| Developers | `[NAMEN]` | `[FTE]` | — |
| UX / onderzoeker | `[NAAM]` | `[FTE]` | `[NAAM]` |
| Security | `[NAAM]` | `[FTE]` | `[NAAM]` |
| Privacy / Compliance | `[NAAM]` | `[FTE]` | `[NAAM]` |
| Testgroepcoördinator | `[NAAM]` | `[FTE]` | `[NAAM]` |

> **Aanname:** security en privacy zijn parttime aangehaakt (`[0,2 FTE]`). Blijkt dit
> onvoldoende, dan is dat een belemmering voor de Scrum Master om te escaleren.
