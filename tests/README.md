# tests/

| Map | Wat er in hoort | Draait via |
|---|---|---|
| `unit/` | losse functies en domeinlogica, zonder I/O | `scripts/ci/test-unit.sh` |
| `integration/` | samenwerking met database, wachtrij en externe koppelingen (in mock/sandbox) | `scripts/ci/test-integration.sh` |
| `security/` | misbruikscenario's uit het threat model | `scripts/ci/test-security.sh` |
| `accessibility/` | WCAG 2.2 AA-controles | `scripts/ci/test-accessibility.sh` |
| `end-to-end/` | de volledige gebruikersreis | `scripts/ci/test-e2e.sh` |

Alles in één keer: `./scripts/ci/all.sh`.

## Regels

1. **Uitsluitend synthetische testdata.** Nooit productiedata, ook niet "geanonimiseerd".
2. **Tests zijn deterministisch:** vaste seeds, geen afhankelijkheid van echte tijd of van
   het internet (mock externe koppelingen).
3. **Testnamen beschrijven gedrag**, niet implementatie:
   `weigert toegang tot transacties van een andere gebruiker`.
4. **Elke bugfix krijgt een test** die eerst faalt.
5. **Elke opgeloste kwetsbaarheid krijgt een regressietest** in `security/`.
6. Testdekking wordt bewaakt door `scripts/ci/coverage-check.sh` (`COVERAGE_MIN`).

## Voorbeelden van synthetische gegevens

| Soort | Gebruik | Nooit |
|---|---|---|
| E-mail | `test.user+p1@example.invalid` | een echt adres |
| Naam | `Testgebruiker A` | een echte naam |
| Bedrag | `12,34`, `1000,00` | een echt saldo |
| Rekening | gereserveerde testreeks van `[LAND]` | een echt rekeningnummer |
| Wachtwoord | `local-dev-not-a-real-secret` | een echt wachtwoord |
