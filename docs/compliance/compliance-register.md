# Complianceregister

Overzicht van onderwerpen die mogelijk een verplichting met zich meebrengen, met status,
eigenaar en bewijs. Dit register is een **werkinstrument**, geen juridisch oordeel.

> ⚖️ **Het team stelt niet zelfstandig vast welke vergunningen of wettelijke regimes van
> toepassing zijn.** Elk onderwerp krijgt de status *te valideren door een bevoegde
> specialist* totdat een gekwalificeerde jurist of compliance officer schriftelijk heeft
> bevestigd wat geldt. Zie [`regulatory-decisions.md`](regulatory-decisions.md).

## Kolommen

| Kolom | Betekenis |
|---|---|
| Mogelijke verplichting | waar het onderwerp over gaat |
| Toepassingsgebied | op welk deel van product of organisatie het ziet |
| Eigenaar | wie het onderwerp bewaakt |
| Status | open · in onderzoek · **te valideren door specialist** · bevestigd · niet van toepassing |
| Bewijs | waar het bewijs staat |
| Openstaande actie | de eerstvolgende stap |
| Laatst beoordeeld | datum |
| Goedkeurder | wie de status heeft bevestigd |

## Register

| # | Mogelijke verplichting | Toepassingsgebied | Eigenaar | Status | Bewijs | Openstaande actie | Laatst beoordeeld | Goedkeurder |
|---|---|---|---|---|---|---|---|---|
| C-01 | Vergunning of registratie voor `[TYPE DIENST]` in `[LANDEN/REGIO]` | hele dienst | Compliance | **te valideren door specialist** | — | juridisch advies inwinnen vóór bèta | `[datum]` | `[naam]` |
| C-02 | Informatieverplichtingen richting consumenten (kosten, voorwaarden, risico's) | web + app | PO + Compliance | **te valideren** | `[link]` | teksten laten toetsen | | |
| C-03 | Gegevensbescherming: grondslagen en transparantie | hele dienst | Privacy | in onderzoek | `docs/privacy/` | grondslagen per verwerking vastleggen | | |
| C-04 | Bewaartermijnen en bewaarplichten | gegevens | Privacy | **te valideren** | `docs/privacy/data-retention.md` | termijnen laten bevestigen | | |
| C-05 | Rechten van betrokkenen (inzage, correctie, verwijdering, portabiliteit) | applicatie | Privacy | open | acceptatiecriteria E3 | functionaliteit bouwen en testen | | |
| C-06 | Verwerkersovereenkomsten met leveranciers | leveranciers | Privacy + Inkoop | open | `control-mapping.md` | DPA's afsluiten vóór ingebruikname | | |
| C-07 | Internationale gegevensdoorgifte | infrastructuur | Privacy | **te valideren** | ADR cloudkeuze | regio vastleggen, doorgifte beoordelen | | |
| C-08 | DPIA voor risicovolle verwerkingen | gegevens | Privacy | open | `privacy-impact-assessment-template.md` | DPIA uitvoeren vóór bèta | | |
| C-09 | Toegangscontrole en functiescheiding | organisatie + techniek | Security | in onderzoek | `docs/security/access-control.md` | kwartaalreview inrichten | | |
| C-10 | Audit trail en onweerlegbaarheid | applicatie | Security | open | threat model T-04 | auditlog implementeren en testen | | |
| C-11 | Wijzigingsbeheer (change management) | pipeline | Tech lead | in onderzoek | branch protection + PR-template | branch protection aanzetten en aantonen | | |
| C-12 | Beschikbaarheid, continuïteit en herstel | platform | Ops | open | `docs/operations/backup-and-recovery.md` | hersteltest uitvoeren | | |
| C-13 | Incidentmelding (security en privacy) | organisatie | Security + Privacy | **te valideren** | `docs/security/incident-response.md` | meldroutes en termijnen bevestigen | | |
| C-14 | Beheersing van uitbestede diensten | leveranciers | Compliance | open | leveranciersregister | risicobeoordeling per leverancier | | |
| C-15 | Fraudepreventie en transactiemonitoring | applicatie | Security + Compliance | **te valideren** | threat model T-13 | limieten en detectie inrichten | | |
| C-16 | Identificatie en verificatie van klanten | onboarding | Compliance | **te valideren** | — | noodzaak laten vaststellen | | |
| C-17 | Toegankelijkheid (WCAG) | web + app | UX | in onderzoek | a11y-workflow | niveau AA aantoonbaar maken | | |
| C-18 | Bewaren van bewijs voor controles | organisatie | Compliance | open | `audit-evidence.md` | bewijsroutine inrichten | | |
| C-19 | Beveiliging van broncode en toeleveringsketen | pipeline | Security | in onderzoek | `security-scan.yml`, SBOM | SBOM per release archiveren | | |
| C-20 | Rapportage aan bestuur/toezicht | organisatie | Compliance | open | — | rapportageritme afspreken | | |

## Werkwijze

1. **Nieuw onderwerp?** Maak een issue via `compliance-task.yml` en voeg een regel toe.
2. **Onderzoek** door de eigenaar; leg vast wat wél en niet duidelijk is.
3. **Validatie** door een bevoegde specialist bij alles wat juridisch of regulatoir is.
4. **Bewijs** vastleggen in [`audit-evidence.md`](audit-evidence.md).
5. **Herbeoordeling** minimaal elk kwartaal, en direct bij: nieuwe functionaliteit,
   nieuwe regio, nieuwe leverancier, of een wijziging in het type dienst.

## Wat dit register **niet** is

* Geen bewijs dat wij aan wet- en regelgeving voldoen.
* Geen vervanging van juridisch advies.
* Geen volledige lijst van toepasselijke regelgeving — die stelt een bevoegde specialist
  vast op basis van `[TYPE DIENST]` en `[LANDEN/REGIO]`.
