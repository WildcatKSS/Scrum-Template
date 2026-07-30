# Governance

Dit document beschrijft rollen, mandaten en besluitvorming. Het vult de Scrum-rollen in
[`docs/scrum/roles.md`](docs/scrum/roles.md) aan met de bevoegdheden die bij een
financiële dienst horen.

## 1. Rollen en mandaat

| Rol | Beslist over | Beslist niet over | Escalatie naar |
|---|---|---|---|
| **Product Owner** | backlogprioriteit, scope, acceptatie van increments, releasegoedkeuring vanuit productoogpunt | technische uitvoering, securityafwijkingen, juridische conclusies | `[STUURGROEP/OPDRACHTGEVER]` |
| **Scrum Master** | proces, events, wegnemen belemmeringen | inhoud van de backlog | `[MANAGEMENT]` |
| **Developers** | technische uitvoering, ontwerp binnen kaders, schattingen, Definition of Done-naleving | prioriteit, acceptatie | Tech lead |
| **Tech lead / architect** | architectuurkaders, ADR-besluiten | productprioriteit | CTO / `[ROL]` |
| **UX / gebruikersonderzoeker** | onderzoeksopzet, methode, interpretatie van bevindingen | prioriteit van oplossingen | PO |
| **Security officer** | securityeisen; **vetorecht** op release bij openstaande kritieke/hoge kwetsbaarheid | productprioriteit | CISO / `[ROL]` |
| **Privacy officer / DPO** | privacy-eisen, DPIA-uitkomst; **vetorecht** bij onaanvaardbaar privacyrisico | technische uitvoering | `[BESTUUR]` |
| **Compliance officer** | complianceregister, controls, bewijsvoering; **vetorecht** op release | productprioriteit | `[BESTUUR]` |
| **Vertegenwoordigers testgroep** | inbreng van gebruikersperspectief en ervaringen | scope of prioriteit (adviserend) | UX |

**Vetorecht** betekent: de release gaat niet door tot het punt is opgelost of
aantoonbaar en gedocumenteerd is geaccepteerd door de daartoe bevoegde eigenaar
(zie §4).

## 2. Besluitvorming

| Type besluit | Wie beslist | Vastlegging |
|---|---|---|
| Backlogprioriteit | Product Owner (na advies team) | GitHub Projects, veld *Prioriteit* |
| Sprintdoel | team in Sprint Planning | sprintissue / board |
| Architectuur | Tech lead, met team, consent-based | ADR in `docs/architecture/adr/` |
| Security-uitzondering | Security officer + PO | risicoacceptatie in `docs/compliance/audit-evidence.md` |
| Privacy-/gegevensverwerking | DPO/Privacy officer | DPIA + `docs/privacy/` |
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

Een risico kan alleen bewust geaccepteerd worden als vastligt: beschrijving, impact,
waarschijnlijkheid, compenserende maatregel, houdbaarheidsdatum, en de naam van de
accepterende mandaathouder. Kritieke en hoge securityrisico's kunnen **niet** door het
team zelf worden geaccepteerd. Registratie: `docs/compliance/audit-evidence.md`.

## 5. Ritme

| Moment | Frequentie | Deelnemers |
|---|---|---|
| Scrum-events | per sprint | team ([`docs/scrum/`](docs/scrum/)) |
| Security-/privacyreview op refinement | elke refinement | Security + Privacy |
| Complianceregister bijwerken | maandelijks | Compliance |
| Threat model herzien | per epic en per kwartaal | Security + Tech lead |
| Governance-evaluatie | elk kwartaal | alle rolhouders |

## 6. Grenzen van dit document

Dit document verdeelt verantwoordelijkheden binnen het team. Het vervangt geen wettelijke
verantwoordelijkheid, bestuursbesluit of vergunningsvereiste. Alle regulatoire
conclusies zijn **te valideren door een bevoegde specialist**.
