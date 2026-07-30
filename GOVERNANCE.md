# Governance

Dit document beschrijft mandaten en besluitvorming. Het bouwt voort op
[`docs/scrum/roles.md`](docs/scrum/roles.md), waarin het onderscheid staat tussen
Scrum-accountabilities (Product Owner, Scrum Master, Developers), vakexpertise binnen de
Developers, onafhankelijke governancerollen en stakeholders.

## 1. Mandaten

| Wie | Positie | Beslist over | Beslist niet over | Escalatie naar |
|---|---|---|---|---|
| **Product Owner** | Scrum Team | backlogprioriteit, scope, productdoel, en of/wanneer een Done increment wordt vrijgegeven | technische uitvoering, of iets Done is, securityafwijkingen, juridische conclusies | `[STUURGROEP/OPDRACHTGEVER]` |
| **Scrum Master** | Scrum Team | proces, events, wegnemen van belemmeringen | inhoud en volgorde van de backlog | `[MANAGEMENT]` |
| **Developers** | Scrum Team | technische uitvoering, ontwerp binnen kaders, schattingen, en de vaststelling dát het increment aan de DoD voldoet | prioriteit en productrichting | Tech lead |
| **Tech lead / architect** | Developers | architectuurkaders, ADR-besluiten | productprioriteit | CTO / `[ROL]` |
| **Security officer** | governance (onafhankelijk) | securityeisen; **vetorecht** op release bij openstaande kritieke/hoge kwetsbaarheid | productprioriteit; of iets Done is | CISO / `[ROL]` |
| **Privacy officer / DPO** | governance (wettelijk onafhankelijk) | privacy-eisen, DPIA-oordeel; **vetorecht** bij onaanvaardbaar privacyrisico | technische uitvoering | `[BESTUUR]` |
| **Compliance officer** | governance | complianceregister, controls, bewijsvoering; **vetorecht** op release | productprioriteit | `[BESTUUR]` |
| **Deelnemers testgroep** | onderzoeksdeelnemers | niets — zij leveren gedrag, ervaringen en feedback | scope of prioriteit | coördinator testgroep |

> **Done staat niet in deze tabel als beslissing van één persoon.** Of een item Done is,
> volgt uit de [Definition of Done](docs/scrum/definition-of-done.md): objectief,
> aantoonbaar en vastgesteld door de Developers. Een vetorecht kan een **release**
> tegenhouden, maar verandert nooit of werk af is.

**Vetorecht** betekent: de release gaat niet door tot het punt is opgelost of
aantoonbaar en gedocumenteerd is geaccepteerd door de daartoe bevoegde eigenaar
(zie §4).

## 2. Besluitvorming

| Type besluit | Wie beslist | Vastlegging |
|---|---|---|
| Backlogprioriteit | Product Owner (na advies van Developers en stakeholders) | GitHub Projects, veld *Prioriteit* |
| Sprintdoel | Scrum Team in Sprint Planning | sprintissue / board |
| Is dit increment Done? | Developers, op basis van de DoD — geen persoonlijke goedkeuring | issue + PR-checklist |
| Architectuur | Tech lead, met de Developers, consent-based | ADR in `docs/architecture/adr/` |
| Risicoacceptatie (restrisico van uitgevoerd werk) | mandaathouder uit §4 | `docs/compliance/audit-evidence.md` §3 |
| Privacy-/gegevensverwerking | DPO / privacy officer | DPIA + `docs/privacy/` |
| Regulatoire toepasselijkheid | **bevoegde specialist (jurist/compliance)** | `docs/compliance/regulatory-decisions.md` |
| Release naar productie | PO + Security + Compliance gezamenlijk | `docs/releases/release-checklist.md` |
| Wijziging van deze governance | `[BESTUUR]` | PR + CHANGELOG |

Standaardwerkwijze is **consent**: een besluit gaat door als niemand een zwaarwegend,
onderbouwd bezwaar heeft. Bij een patstelling beslist de mandaathouder uit de tabel.

## 3. Vier-ogenprincipe

Verplicht bij: wijzigingen in authenticatie/autorisatie, transactie- of geldstroomlogica,
cryptografie en sleutelbeheer, datamigraties, productie-toegang en -deployments,
en wijzigingen aan de CI/CD-pipeline zelf. Uitvoerbaar via CODEOWNERS + required reviews +
required reviewers op de `production`-environment.

## 4. Risicoacceptatie

Risicoacceptatie gaat over een **restrisico van uitgevoerd werk** — bijvoorbeeld een
bekende kwetsbaarheid waarvoor nog geen patch bestaat, of een functionele beperking die we
bewust in productie nemen.

> **Risicoacceptatie is géén uitzondering op de Definition of Done.** Zij kan nooit
> betekenen dat niet-uitgevoerde tests, ontbrekende deploymentvalidatie of ontbrekend
> kwaliteits-, privacy- of compliancebewijs als uitgevoerd gelden. Ontbreekt een verplicht
> DoD-criterium, dan is het item niet Done en blijft het werk op de backlog staan
> ([`docs/scrum/definition-of-done.md`](docs/scrum/definition-of-done.md) §4).

Een risicoacceptatie is alleen geldig als **alle** onderstaande gegevens zijn vastgelegd:

| Veld | Toelichting |
|---|---|
| Beschrijving | wat is het risico, concreet |
| Impact | wat gebeurt er als het zich voordoet (gebruikers, geld, gegevens) |
| Waarschijnlijkheid | onderbouwde inschatting |
| Compenserende maatregelen | wat beperkt het risico intussen |
| Eigenaar | wie bewaakt het |
| Bevoegde goedkeurder | mandaathouder uit §1 |
| Vervaldatum | wanneer opnieuw beoordelen; nooit onbeperkt |
| Opvolgissue | waar het werk staat om het risico weg te nemen |

Waarvoor risicoacceptatie **wel** passend kan zijn: een openstaande kwetsbaarheid van
niveau middel of lager, een leveranciersafhankelijkheid, een tijdelijke handmatige
compenserende maatregel, of een bewust uitgestelde verbetering.

Waarvoor **niet**: ontbrekende tests, niet-uitgevoerde reviews, overgeslagen
securityscans, niet-geverifieerde deployments, of ontbrekende toestemming voor een
gegevensverwerking.

Kritieke en hoge securityrisico's kunnen **niet** door de Developers zelf worden
geaccepteerd. Registratie: `docs/compliance/audit-evidence.md` §3.

## 5. Ritme

| Moment | Frequentie | Deelnemers |
|---|---|---|
| Scrum-events | per sprint | Scrum Team ([`docs/scrum/`](docs/scrum/)) |
| Security-/privacybeoordeling bij refinement | elke refinement | Developers met security-/privacyexpertise, governance op afroep |
| Complianceregister bijwerken | maandelijks | Compliance |
| Threat model herzien | per epic en per kwartaal | Developers (security-expertise) + tech lead |
| Governance-evaluatie | elk kwartaal | alle mandaathouders |

## 6. Grenzen van dit document

Dit document verdeelt verantwoordelijkheden binnen het team. Het vervangt geen wettelijke
verantwoordelijkheid, bestuursbesluit of vergunningsvereiste. Alle regulatoire
conclusies zijn **te valideren door een bevoegde specialist**.
