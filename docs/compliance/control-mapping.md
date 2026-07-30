# Control mapping

Koppelt beheersmaatregelen (controls) aan hun implementatie, hun test en hun bewijs. Het
doel: aantoonbaar maken dat een maatregel niet alleen op papier bestaat.

> Deze mapping verwijst naar veelgebruikte beheersdoelen. Welke normen of kaders formeel
> van toepassing zijn (bijvoorbeeld een ISO-norm, een toezichtkader of een klantvereiste),
> is **te bepalen door een bevoegde specialist** — zie
> [`regulatory-decisions.md`](regulatory-decisions.md).

## Kolommen

| Kolom | Betekenis |
|---|---|
| Control | wat de maatregel moet bereiken |
| Implementatie | waar het in ons systeem zit |
| Geautomatiseerd bewijs | welke pipeline-stap of test het aantoont |
| Handmatig bewijs | wat een mens vastlegt |
| Eigenaar | verantwoordelijke rol |
| Frequentie | hoe vaak het wordt geverifieerd |

## Toegang en identiteit

| ID | Control | Implementatie | Geautomatiseerd bewijs | Handmatig bewijs | Eigenaar | Frequentie |
|---|---|---|---|---|---|---|
| AC-01 | Sterke authenticatie voor gebruikers | OIDC + wachtwoordbeleid | e2e-test inloggen | — | Security | elke PR |
| AC-02 | MFA voor gevoelige handelingen | herauthenticatie | securitytest S-6 | — | Security | elke PR |
| AC-03 | Autorisatie op objectniveau | controle per verzoek | securitytest S-1 | — | Security | elke PR |
| AC-04 | Least privilege voor medewerkers | rollen + JIT-toegang | — | kwartaalreview toegang | Security | kwartaal |
| AC-05 | Functiescheiding bij productiewijzigingen | required reviewers op environment | workflowconfiguratie | goedkeuringslog | Tech lead | per release |
| AC-06 | Intrekken van toegang bij vertrek | `[HR/IT-PROCES]` | — | intrekkingsbewijs | Security | per geval |

## Gegevensbescherming

| ID | Control | Implementatie | Geautomatiseerd bewijs | Handmatig bewijs | Eigenaar | Frequentie |
|---|---|---|---|---|---|---|
| DP-01 | Encryptie in transport | TLS 1.2+, HSTS | securitytest S-12 | scanrapport | Security | elke PR |
| DP-02 | Encryptie in rust | platform + veldniveau | infrastructuurconfiguratie | configuratiebewijs | Tech lead | per wijziging |
| DP-03 | Sleutelbeheer en rotatie | KMS | — | rotatielog | Security | kwartaal |
| DP-04 | Gegevensminimalisatie | ontwerpkeuzes | — | refinementnotitie, DPIA | Privacy | per story |
| DP-05 | Bewaartermijnen afgedwongen | verwijderroutines | monitoring van de routine | kwartaalcontrole | Privacy | kwartaal |
| DP-06 | Geen persoonsgegevens in logs | logfilters | securitytest S-9 | logsteekproef | Security | elke PR + kwartaal |
| DP-07 | Rechten van betrokkenen uitvoerbaar | export/verwijderfunctie | e2e-test | afhandelingsregistratie | Privacy | per release |
| DP-08 | Geen productiedata buiten productie | omgevingsscheiding | pipelinecontrole | verklaring in releasechecklist | Tech lead | per release |

## Ontwikkeling en wijzigingsbeheer

| ID | Control | Implementatie | Geautomatiseerd bewijs | Handmatig bewijs | Eigenaar | Frequentie |
|---|---|---|---|---|---|---|
| CM-01 | Elke wijziging via pull request | branch protection | vereiste checks | instellingenexport | Tech lead | doorlopend |
| CM-02 | Vier-ogenprincipe op gevoelige paden | CODEOWNERS | reviewstatus | — | Tech lead | elke PR |
| CM-03 | Geautomatiseerd testen vóór merge | `ci.yml` | workflowrun | — | Team | elke PR |
| CM-04 | Statische analyse en secret scanning | `security-scan.yml`; SAST en secret scan zijn **blokkerend** (falen ⇒ `security-gate` rood ⇒ merge geblokkeerd) | workflowrun | onderdrukte bevindingen met onderbouwing (§4 auditbewijs) | Security | elke PR |
| CM-05 | Afhankelijkheden en licenties beoordeeld | `dependency-review.yml` (vereist een ingeschakelde Dependency graph; anders draait alleen `license-check.sh` + Trivy en meldt de workflow dat deze control **niet actief** is) | workflowrun | uitzonderingenlijst | Security | elke PR |
| CM-06 | SBOM per release | `release.yml` | artifact | archief | Security | per release |
| CM-07 | Architectuurbesluiten vastgelegd | ADR | bestandsaanwezigheid | ADR-review | Tech lead | per besluit |
| CM-08 | Releasegoedkeuring door PO, Security, Compliance | environment reviewers | goedkeuringslog | releasechecklist | PO | per release |
| CM-09 | Deploymentbewijs komt uitsluitend voort uit een echte uitrol | `release.yml`: de deployjobs draaien alleen met `STAGING_DEPLOY_ENABLED` / `PRODUCTION_DEPLOY_ENABLED` op `true`, en het bewijs wordt pas na een geslaagde uitrol én verificatie geschreven | joboverzicht + `deployment-status` | releasechecklist | Tech lead | per release |
| CM-10 | Externe GitHub Actions vastgezet op commit-SHA | alle workflows en `.github/actions/` | workflowbestanden | Dependabot-updates | Security | per wijziging |

## Operatie en continuïteit

| ID | Control | Implementatie | Geautomatiseerd bewijs | Handmatig bewijs | Eigenaar | Frequentie |
|---|---|---|---|---|---|---|
| OP-01 | Monitoring en alarmering | dashboards + alerts | alertconfiguratie | testalarm | Ops | maand |
| OP-02 | Audit logging van kritieke gebeurtenissen | auditlog | securitytest S-10 | steekproef | Security | elke PR + kwartaal |
| OP-03 | Back-ups versleuteld en gescheiden | back-upbeleid | configuratie | herstelrapport | Ops | kwartaal |
| OP-04 | Hersteltest uitgevoerd | procedure | — | testverslag | Ops | kwartaal |
| OP-05 | Incidentproces beproefd | procedure | — | oefenverslag | Security | halfjaar |
| OP-06 | Kwetsbaarheden binnen SLA opgelost | scans + issues | scanresultaten | SLA-rapportage | Security | sprint |

## Product en gebruiker

| ID | Control | Implementatie | Geautomatiseerd bewijs | Handmatig bewijs | Eigenaar | Frequentie |
|---|---|---|---|---|---|---|
| PR-01 | Toegankelijkheid WCAG 2.2 AA op de kernreis | ontwerp + tests | a11y-workflow | handmatige controle | UX | elke PR |
| PR-02 | Begrijpelijke financiële informatie | taalniveau B1, uitleg bij bedragen | — | usabilitytestverslag | UX | per sprint |
| PR-03 | Geen misleidende patronen | ontwerpprincipes | — | reviewnotitie | PO + UX | per story |
| PR-04 | Toestemming vastgelegd en intrekbaar | toestemmingsflow | e2e-test S-13 | registratie | Privacy | per release |
| PR-05 | Gebruikersfeedback gestructureerd verwerkt | feedbacklog | — | feedbacklog | PO | per sprint |

## Gebruik

* Elke **nieuwe control** krijgt een ID, een implementatie én een bewijsvorm. Een control
  zonder bewijs is geen control.
* Verwijs vanuit issues en ADR's naar het control-ID.
* Bewijs verzamelen: [`audit-evidence.md`](audit-evidence.md).
