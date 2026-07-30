# Experiment (sjabloon)

Gebruik dit sjabloon om een aanname te toetsen vóórdat er veel wordt gebouwd. Eén
experiment = één hypothese.

## Kop

| Veld | Invulling |
|---|---|
| Experiment-ID | `EXP-[NR]` |
| Titel | `[KORTE TITEL]` |
| Eigenaar | `[NAAM]` |
| Sprint | `[NR]` |
| Status | concept / loopt / afgerond / gestopt |
| Gekoppelde aanname | `[A1 uit mvp-scope.md]` |
| Gekoppelde issues | `#…` |

## 1. Hypothese

> Wij denken dat **`[VERANDERING]`**
> voor **`[DOELGROEP/PERSONA]`**
> leidt tot **`[VERWACHT EFFECT]`**,
> omdat **`[ONDERBOUWING/AANNAME]`**.
>
> We weten dat we gelijk hebben als **`[MEETBAAR SIGNAAL]`**.

## 2. Waarom dit experiment?

* Welke beslissing hangt hiervan af? `[BESLISSING]`
* Wat kost het als we het fout hebben zonder te toetsen? `[RISICO]`
* Waarom is dit nu het belangrijkste om te weten? `[ONDERBOUWING]`

## 3. Opzet

| Onderwerp | Invulling |
|---|---|
| Methode | ⬜ usabilitytest ⬜ interview ⬜ prototype ⬜ A/B-vergelijking ⬜ meting in testomgeving ⬜ desk research |
| Kleinst mogelijke opzet | `[WAT BOUWEN WE MINIMAAL?]` |
| Deelnemers | `[AANTAL]` uit `[TESTGROEP]`, profiel `[…]` |
| Duur | `[X]` dagen / `[Y]` sessies |
| Testomgeving | `[STAGING]`, uitsluitend synthetische data |
| Wat meten we | `[METRIEK(EN)]` |
| Hoe meten we | `[BRON: observatie, analytics, vragenlijst]` |
| Nulmeting | `[HUIDIGE WAARDE]` of "onbekend" |

> **Voorwaarde:** een experiment mag nooit een beveiligings-, privacy- of controle-
> maatregel uitschakelen. A/B-testen met echte gebruikersgelden of met echte
> persoonsgegevens is niet toegestaan zonder expliciete beoordeling door privacy en
> security.

## 4. Succescriteria — vooraf invullen

| Uitkomst | Criterium | Besluit |
|---|---|---|
| **Bevestigd** | `[METRIEK]` ≥ `[DREMPEL]` | doorgaan: `[VERVOLGSTAP]` |
| **Deels** | tussen `[X]` en `[Y]` | aanpassen en opnieuw toetsen |
| **Weerlegd** | `[METRIEK]` < `[DREMPEL]` | stoppen of pivot: `[ALTERNATIEF]` |

Vul dit **vóór** de uitvoering in. Achteraf criteria kiezen is geen experiment maar een
rechtvaardiging.

## 5. Risico's van het experiment zelf

| Risico | Beheersing |
|---|---|
| Deelnemers krijgen een verkeerd beeld van het product | vooraf uitleggen dat het een test is |
| Te kleine steekproef | conclusie beperken tot "richtinggevend" |
| Onderzoekersbias (we willen dat het werkt) | vaste taken, observator erbij, hardop-denken |
| Meten van gedrag dat we niet mogen meten | privacycheck vooraf |

## 6. Uitvoering

| Datum | Wat is gedaan | Door |
|---|---|---|
| `[JJJJ-MM-DD]` | | |

## 7. Resultaten

| Metriek | Nulmeting | Streefwaarde | Gemeten | Gehaald |
|---|---|---|---|---|
| | | | | ⬜ |

**Observaties (feitelijk):**
* …

**Onverwachte uitkomsten:**
* …

## 8. Inzichten

Wat weten we nu dat we eerst niet wisten? Wees expliciet over wat we **niet** kunnen
concluderen op basis van deze opzet.

* …

## 9. Beslissing

⬜ Doorgaan ⬜ Aanpassen ⬜ Opnieuw toetsen ⬜ Stoppen

**Onderbouwing:** …
**Genomen door:** `[PO]` op `[DATUM]`

## 10. Vervolgacties

| Actie | Type | Eigenaar | Issue |
|---|---|---|---|
| | story / spike / technische taak | | # |

Bevindingen worden ook opgenomen in [`feedback-log.md`](feedback-log.md); een besluit dat
de architectuur raakt, wordt een ADR.
