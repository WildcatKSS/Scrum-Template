# Testgroepplan

De testgroep is geen eenmalige toets aan het einde, maar een **vast onderdeel van elke
sprintcyclus**. Zonder contact met echte gebruikers bouwen we op aannames — bij een
financiële dienst is dat een risico voor de gebruiker, niet alleen voor het project.

## 1. Samenstelling

| Onderwerp | Invulling | Status |
|---|---|---|
| Omschrijving | `[TESTGROEP]` | te bepalen |
| Omvang | `[8–12]` deelnemers (aanname) | te bevestigen |
| Per usabilitysessie | 5–6 deelnemers per ronde (vindt ±85% van de gebruiksproblemen) | vast |
| Spreiding | leeftijd, digitale vaardigheid, financiële situatie, taalniveau, toegankelijkheidsbehoeften | te bepalen |
| Verplicht vertegenwoordigd | minimaal 2 deelnemers met een toegankelijkheidsbehoefte; minimaal 2 met lage digitale vaardigheid | vast |
| Vaste deelnemers vs. wisselend | ⅔ vast (leert het product kennen), ⅓ wisselend (frisse blik) | aanname |
| Vergoeding | `[VERGOEDING]` — gelijk voor iedereen, niet afhankelijk van de uitkomst | te bepalen |
| Werving | `[KANAAL]` | te bepalen |

> **Let op bij werving:** vermijd uitsluitend enthousiaste early adopters. Juist de
> twijfelaars en de mensen die snel afhaken, leveren de bruikbaarste inzichten op.

## 2. Ritme

| Sprint | Activiteit met de testgroep |
|---|---|
| Elke sprint | minimaal één sessie: usabilitytest, interview of feedbackronde |
| Minimaal elke tweede sprint | een **verplichte** validatiesessie op het increment |
| Elke sprint | 2–3 vertegenwoordigers aanwezig bij de Sprint Review |
| Elk kwartaal | brede feedbackronde (vragenlijst) onder de hele groep |

Lukt een sessie niet, dan is dat een **belemmering** voor de Scrum Master, geen
vanzelfsprekendheid.

## 3. De feedbackcyclus

```
Hypothese
  → Prototype of increment
    → Test met gebruikers
      → Observaties en meetgegevens
        → Inzichten
          → Beslissing (doorgaan / aanpassen / stoppen / meer onderzoek)
            → Nieuwe of aangepaste backlogitems
              → (opnieuw) Hypothese
```

Per stap:

| Stap | Waar vastgelegd | Verantwoordelijk |
|---|---|---|
| Hypothese | [`experiment-template.md`](experiment-template.md) | UX + PO |
| Prototype/increment | testomgeving met synthetische data | Developers |
| Test | [`usability-test-template.md`](usability-test-template.md) / [`interview-template.md`](interview-template.md) | UX |
| Observaties | issues via `test-group-feedback.yml` | UX |
| Inzichten | [`feedback-log.md`](feedback-log.md) | UX |
| Beslissing | feedback-log + boardveld *Testgroepstatus* | PO |
| Backlogitems | GitHub Issues | PO |

## 4. Wat testen we per fase?

| Fase | Wat | Methode |
|---|---|---|
| Probleem nog onduidelijk | bestaat het probleem, en voor wie? | interview |
| Oplossingsrichting | begrijpt men het concept? | prototype + hardop denken |
| Werkend increment | lukt de taak zonder hulp? | usabilitytest |
| Meerdere sprints later | komt men terug, en waarom (niet)? | meting + interview |
| Vóór bredere uitrol | vertrouwen, duidelijkheid, foutafhandeling | usabilitytest + vragenlijst |

## 5. Randvoorwaarden (niet onderhandelbaar)

1. **Geen echte gegevens.** Deelnemers krijgen een testaccount met synthetische data.
   Nooit echte bankgegevens, betaalgegevens, BSN-achtige identificatoren of echte
   inloggegevens.
2. **Toestemming vooraf**, schriftelijk, per sessie —
   [`consent-and-privacy-check.md`](consent-and-privacy-check.md).
3. **Geanonimiseerde vastlegging.** Deelnemers heten P1, P2, …; namen en contactgegevens
   staan alleen in het (afgeschermde) deelnemersregister, nooit in de repository.
4. **Vrijwillig en stopbaar.** Deelnemers mogen op elk moment stoppen, zonder reden en met
   behoud van de vergoeding.
5. **Testomgeving duidelijk herkenbaar** (banner: "Dit is een testomgeving; gebruik geen
   echte gegevens").
6. **Geen misleiding.** Deelnemers weten dat ze met een product in ontwikkeling werken.
7. **Zorg voor de deelnemer.** Komt er in een sessie een echt financieel probleem ter
   sprake, dan verwijzen we naar hulp; wij geven geen financieel advies.

## 6. Rollen tijdens een sessie

| Rol | Taak |
|---|---|
| Facilitator (UX) | leidt de sessie, stelt vragen, grijpt niet in |
| Observator (developer of PO) | noteert gedrag, stelt geen vragen |
| Technische ondersteuning | staat klaar bij problemen met de omgeving |

Bij elke sessie is minimaal **één developer** aanwezig als observator. Zelf zien werkt
beter dan een rapport lezen.

## 7. Van sessie naar backlog

1. Direct na de sessie: 15 minuten debrief, top 3 bevindingen opschrijven.
2. Binnen 1 werkdag: issues aanmaken met `test-group-feedback.yml`.
3. Bij de eerstvolgende refinement: PO toetst elk item aan de weegcriteria uit
   [`feedback-log.md`](feedback-log.md).
4. Terugkoppeling aan deelnemers binnen `[2]` weken: wat is er met hun input gebeurd?

## 8. Meetwaarden van het proces zelf

| Meetwaarde | Streefwaarde |
|---|---|
| Sessies per sprint | ≥ 1 |
| Deelnemers per usabilityronde | 5–6 |
| Doorlooptijd sessie → issue | ≤ 1 werkdag |
| Feedbackitems met beslissing binnen 2 sprints | ≥ 90% |
| Deelnemers die terugkoppeling ontvingen | 100% |
| Uitval van deelnemers per kwartaal | ≤ `[20]%` |

## 9. Deelnemersregister (buiten deze repository)

Namen, contactgegevens en toestemmingsformulieren worden **niet** in Git bewaard. Zij
staan in `[AFGESCHERMDE LOCATIE]`, met toegang voor `[ROLLEN]`, en worden verwijderd
uiterlijk `[TERMIJN]` na afloop van het onderzoek. Zie
[`../privacy/data-retention.md`](../privacy/data-retention.md).

| Veld in het register | Bewaartermijn |
|---|---|
| Naam en contactgegevens | tot einde deelname + `[3 maanden]` |
| Toestemmingsformulier | `[wettelijke of interne termijn]` — **te valideren** |
| Opnames | `[maximaal 30 dagen]`, daarna verwijderd |
| Geanonimiseerde bevindingen | onbeperkt (bevatten geen persoonsgegevens) |
