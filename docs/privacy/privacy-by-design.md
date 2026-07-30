# Privacy by design

Privacy is een ontwerpeis, geen document achteraf. Dit hoofdstuk vertaalt de beginselen
naar concrete keuzes die het team elke sprint maakt.

> ⚖️ Alle juridische duiding in dit document is een **werkbaar uitgangspunt**, geen
> juridisch advies. Grondslagen, termijnen en verplichtingen zijn **te valideren door een
> bevoegde specialist**; registreer die validatie in
> [`../compliance/regulatory-decisions.md`](../compliance/regulatory-decisions.md).

## 1. Beginselen in de praktijk

| Beginsel | Wat wij doen | Waar te toetsen |
|---|---|---|
| **Gegevensminimalisatie** | elk veld moet zijn bestaan verdedigen; standaard níét verzamelen | refinement, PR-review |
| **Doelbinding** | elk gegeven heeft één vastgelegd doel; hergebruik vraagt om een nieuwe beoordeling | [`../architecture/data-flow.md`](../architecture/data-flow.md) |
| **Opslagbeperking** | elke categorie heeft een bewaartermijn en een verwijderroutine | [`data-retention.md`](data-retention.md) |
| **Juistheid** | gebruiker kan gegevens corrigeren; bron en tijdstempel zichtbaar | acceptatiecriteria |
| **Integriteit en vertrouwelijkheid** | encryptie, least privilege, auditlogging | [`../security/security-principles.md`](../security/security-principles.md) |
| **Transparantie** | begrijpelijke uitleg vóór het verzamelen, niet verstopt in voorwaarden | UX + review |
| **Verantwoordingsplicht** | besluiten, beoordelingen en bewijs vastgelegd | [`../compliance/audit-evidence.md`](../compliance/audit-evidence.md) |

## 2. Privacy by default

De standaardinstelling is altijd de meest privacyvriendelijke:

* optionele gegevensverzameling staat **uit**;
* delen met derden staat **uit**;
* analytics gebeurt geaggregeerd, zonder individueel profiel;
* meldingen staan uit of zijn beperkt tot wat functioneel nodig is;
* de gebruiker hoeft niets aan te passen om privacy te krijgen.

## 3. Zeven ontwerpvragen per story

Deze vragen horen bij elke story met gegevens (onderdeel van de risicoscan in refinement):

1. Welke gegevens raken we, en van wie?
2. Waarom hebben we ze nodig — kan het met minder of zonder?
3. Wat is het doel, en past dit gebruik binnen dat doel?
4. Hoe lang bewaren we ze, en wat verwijdert ze daarna?
5. Wie kan erbij, en hoe tonen we dat aan?
6. Wat gebeurt er als dit gegeven lekt?
7. Kan de gebruiker dit inzien, corrigeren, exporteren en laten verwijderen?

## 4. Toestemming

Toestemming gebruiken we alleen waar die de juiste grondslag is (bijvoorbeeld het koppelen
van externe financiële gegevens). Waar we haar gebruiken, geldt:

* actief en specifiek (geen vooraf aangevinkte vakjes, geen bundeling);
* even eenvoudig in te trekken als te geven;
* vastgelegd: wat, wanneer, welke versie van de tekst, via welk kanaal;
* intrekken werkt **direct** door: toegang stopt, gegevens worden verwijderd of
  geanonimiseerd volgens de bewaartermijn;
* toestemming is geen vrijbrief: minimalisatie en doelbinding blijven gelden.

## 5. Rechten van betrokkenen

| Recht | Onze afhandeling | Termijn (aanname, **te valideren**) |
|---|---|---|
| Inzage | zelfservice in de applicatie + verzoek via `[PRIVACY-CONTACT-EMAIL]` | `[1 maand]` |
| Correctie | zelfservice waar mogelijk | `[1 maand]` |
| Verwijdering | accountverwijdering; uitzondering waar een bewaarplicht geldt | `[1 maand]` |
| Beperking | markering in het systeem, verwerking gestopt | `[1 maand]` |
| Dataportabiliteit | export in een machineleesbaar formaat | `[1 maand]` |
| Bezwaar | beoordeling per geval | `[1 maand]` |
| Menselijke tussenkomst bij geautomatiseerde besluiten | altijd mogelijk; wij nemen geen geautomatiseerde besluiten met rechtsgevolg in de MVP | direct |

Elk verzoek: identiteit vaststellen (zonder onnodige extra gegevens), afhandeling
vastleggen, termijn bewaken.

## 6. Ontwerpkeuzes die privacy vergroten

* Pseudonimiseren waar het kan; gebruik interne ID's in plaats van e-mailadressen.
* Aggregeren in plaats van individuele gegevens bewaren voor statistiek.
* Gegevens laten waar ze horen: haal niet meer op dan nodig voor de weergave.
* Korte bewaartermijnen op tussenresultaten en caches.
* Geen persoonsgegevens in logs, URL's, foutmeldingen, monitoring of analytics.
* Beperk de scope bij externe koppelingen tot het minimum.

## 7. Privacy in de sprintcyclus

| Moment | Activiteit |
|---|---|
| Refinement | de zeven vragen; veld *Privacy-impact* invullen |
| Ontwerp | DPIA-toets bij nieuwe of risicovolle verwerkingen |
| PR-review | privacy-impactsectie ingevuld; geen persoonsgegevens in logs |
| Definition of Done | privacyvoorwaarden verwerkt en aangetoond |
| Sprint Review | privacystatus als vast agendapunt |
| Release | privacy-check in de releasechecklist |
| Kwartaal | herziening van verwerkingen, termijnen en leveranciers |

## 8. Onderzoek en testgroep

Onderzoek valt onder hetzelfde regime: toestemming vooraf, minimale gegevens,
geanonimiseerde vastlegging, korte bewaartermijnen, en geen persoonsgegevens in de
repository. Zie
[`../research/consent-and-privacy-check.md`](../research/consent-and-privacy-check.md).
