# Deployment

Hoe code van een pull request in productie komt, en welke waarborgen daarbij horen.

## 1. Omgevingen

| Omgeving | Doel | Data | Toegang | Deploy |
|---|---|---|---|---|
| **development** | lokaal werken | synthetisch | developer zelf | lokaal |
| **test** | geautomatiseerde tests | synthetisch, per run weggegooid | pipeline | automatisch bij PR |
| **staging** | representatieve verificatie, testgroepsessies | synthetisch, stabiel | team + testgroep (testaccounts) | automatisch na merge/tag |
| **production** | echte gebruikers | echte gegevens | strikt beperkt, MFA, JIT | **alleen na handmatige goedkeuring** |

**Harde regels**

* Omgevingen zijn technisch gescheiden: eigen accounts/projecten, netwerken, sleutels en
  credentials.
* **Nooit productiedata in een niet-productieomgeving.** Ook niet "even", ook niet
  "geanonimiseerd".
* Staging is zichtbaar gemarkeerd als testomgeving.
* Productie-credentials bestaan alleen in de `production`-environment van GitHub.

## 2. Promotiepad

```
pull request → CI groen → review + CODEOWNERS → merge naar main
   → automatische deploy naar staging
     → verificatie + testgroepvalidatie
       → tag vX.Y.Z
         → release-pipeline (regressie, security, SBOM, releasenotes)
           → handmatige goedkeuring (environment production)
             → gefaseerde uitrol naar productie
               → monitoring en evaluatie
```

## 3. Goedkeuring voor productie

Ingericht via *Settings → Environments → production*:

* **Required reviewers:** minimaal Product Owner én Security/Compliance.
* **Wait timer:** optioneel `[10]` minuten, als bedenktijd.
* **Deployment branches:** alleen `main` en tags `v*.*.*`.
* **Environment secrets:** alleen daar; nooit als repository secret.

Zonder goedkeuring blijft de job wachten en gebeurt er niets.

## 4. Uitrolstrategie

| Strategie | Wanneer | Terugval |
|---|---|---|
| **Gefaseerd (canary)** — standaard | reguliere releases | automatisch terug bij stijgende foutratio |
| Blue/green | grotere wijzigingen | omschakelen naar de vorige omgeving |
| Feature flag | onzekere functionaliteit | vlag uitzetten (snelste terugval) |
| Big bang | alleen bij noodzaak | herdeploy van de vorige tag |

Advies bij canary: 5% → 25% → 100%, met minimaal `[15]` minuten observatie per stap.

## 5. Databasemigraties

Gebruik het **expand/contract**-patroon zodat oude en nieuwe code naast elkaar werken:

1. *Expand* — voeg toe (nieuwe kolom/tabel), zonder iets te breken.
2. Deploy code die beide vormen aankan.
3. Vul en migreer data in de achtergrond, in porties.
4. Deploy code die alleen de nieuwe vorm gebruikt.
5. *Contract* — verwijder het oude, in een aparte release.

Regels: elke migratie is terugdraaibaar of vooruit-herstelbaar; getest op een
representatieve datasetgrootte; raakt een migratie persoonsgegevens, dan is
privacybeoordeling verplicht; migraties draaien nooit ongecontroleerd tijdens piekuren.

## 6. Configuratie en secrets

| Type | Waar | Rotatie |
|---|---|---|
| Niet-gevoelige configuratie | environment variables / repository variables | per wijziging |
| Applicatiesecrets | secrets manager `[TOOL]` | `[90]` dagen of bij vermoeden |
| Deploycredentials | OIDC-federatie (voorkeur) of environment secrets | OIDC: n.v.t.; anders `[90]` dagen |
| Encryptiesleutels | KMS/HSM | volgens sleutelbeleid |

Nieuwe variabele? Voeg hem toe aan `.env.example` én aan dit document.

## 7. Rollback

| Situatie | Actie | Streeftijd |
|---|---|---|
| Functioneel probleem achter een vlag | vlag uitzetten | < 1 minuut |
| Foute release zonder migratie | herdeploy vorige tag | < `[15]` minuten |
| Foute release met migratie | vooruit herstellen (fix) of migratie terugdraaien volgens plan | < `[60]` minuten |
| Datacorruptie | back-up terugzetten volgens `backup-and-recovery.md` | volgens RTO |

Elke pull request bevat een rollbackplan. Geen plan = niet mergen.

## 8. Checklist per deploy naar productie

- [ ] Alle verplichte checks groen
- [ ] Geen openstaande kritieke/hoge kwetsbaarheden
- [ ] Releasechecklist doorlopen ([`../releases/release-checklist.md`](../releases/release-checklist.md))
- [ ] Goedkeuring PO, Security en Compliance vastgelegd
- [ ] Migratieplan en rollbackplan bekend
- [ ] Monitoring en alarmering actief; iemand kijkt daadwerkelijk mee
- [ ] Communicatie geregeld als gebruikers iets merken
- [ ] Deploy vastgelegd als bewijs (`../compliance/audit-evidence.md`)

## 9. Nog te bepalen

| Onderwerp | Eigenaar |
|---|---|
| Cloudprovider en regio (`[CLOUD]`, `[REGIO]`) | Tech lead + Compliance |
| Infrastructure as code (`[TERRAFORM/BICEP/…]`) | Tech lead |
| Containerisatie en runtime | Tech lead |
| Secrets manager | Security |
| Deployvenster en changekalender | Ops |
