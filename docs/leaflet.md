# ARLandmarks – Eine iOS AR-App zur Echtzeit-Erkennung von Zürcher Sehenswürdigkeiten

## Projektübersicht und Zielsetzung

ARLandmarks ist eine iOS-Applikation, die Augmented Reality (AR) mit maschinellem Lernen verbindet, um Zürcher Sehenswürdigkeiten in Echtzeit über die Smartphone-Kamera zu erkennen und kontextuelle Informationen als AR-Overlay einzublenden. Das Projekt adressiert die Herausforderung, dass touristische Informationen oft nicht direkt im Moment des Erlebens verfügbar sind (Kounavis, Kasimati and Zamani, 2012). Die App schliesst diese Lücke, indem sie physische Wahrzeichen visuell identifiziert und unmittelbar relevante Daten bereitstellt.

Das Gesamtsystem umfasst drei Komponenten: die iOS-App (Swift/SwiftUI, ARKit, Core ML), ein Web-Dashboard zur Verwaltung der Landmark-Daten (Next.js/React) sowie eine ML-Trainingspipeline (Python/PyTorch) zum Trainieren des Erkennungsmodells.

| Kennzahl | Wert |
|---|---|
| Erfasste Landmarks | 108 |
| Modellgenauigkeit (Validierung) | 75 %+ |
| Erkennungszeit pro Frame | < 50 ms |
| AR-Darstellungsmodi | 2 (Kamera-Overlay und Kartenansicht) |

## Iterativer Entwicklungsprozess

Ein zentrales Merkmal des Projekts war der bewusst iterative Entwicklungsansatz, der sich am PDCA-Zyklus (Plan–Do–Check–Act) orientierte (Deming, 2000). Anstelle einer rein linearen Abfolge wurden gezielte Verbesserungsschleifen eingeplant, insbesondere beim Training des ML-Modells und bei der Optimierung der AR-Darstellung.

**Iteration 1 – Basismodell:** In der ersten Phase wurde ein MobileNetV3-Small-Modell mittels Transfer Learning auf einem initialen Datensatz von drei Landmarks trainiert (Howard *et al.*, 2019). Die Validierungsgenauigkeit lag bei ca. 60 %, was als Ausgangsbasis für die weiteren Zyklen diente.

**Iteration 2 – Datenaugmentation und Hyperparameter-Tuning:** Basierend auf der Evaluation der ersten Ergebnisse wurden die Trainingsdaten durch Augmentationstechniken (Rotation, Farbvariation, Spiegelung) erweitert und die Hyperparameter angepasst. Die Genauigkeit stieg auf über 75 % (Pan and Yang, 2010).

**Iteration 3 – Realwelt-Tests und Feedback:** Das Modell wurde mit Bildschirmtests und anschliessend an realen Standorten evaluiert. Die dabei identifizierten Schwächen (z. B. Erkennung bei wechselnden Lichtverhältnissen) flossen als gezielte Trainingsdaten-Ergänzungen in den nächsten Zyklus ein. Dieser systematische Wechsel zwischen Testen, Analysieren und Verbessern entspricht dem Prinzip der iterativen Entwicklung, wie es auch in der agilen Softwareentwicklung verbreitet ist (Sommerville, 2016).

## Technische Umsetzung und Fachkompetenz

### Visuelle Erkennung mit Core ML und Transfer Learning

Die Landmark-Erkennung basiert auf einem MobileNetV3-Small-Netzwerk, das durch Transfer Learning auf die spezifische Aufgabe der Landmark-Klassifikation adaptiert wurde. Transfer Learning ermöglicht es, ein auf ImageNet vortrainiertes Modell mit relativ wenigen domänenspezifischen Trainingsdaten effektiv anzupassen (Pan and Yang, 2010). Die Konvertierung in das Core-ML-Format erlaubt eine effiziente Inferenz direkt auf dem Gerät mit einer Erkennungszeit von unter 50 ms pro Frame.

### AR-Integration mit ARKit

Die AR-Darstellung nutzt Apples ARKit-Framework für World Tracking und die Positionierung der Informations-Overlays im dreidimensionalen Raum (Apple, 2024). Die Kombination aus GPS-Daten und visueller Erkennung ermöglicht eine zuverlässige Zuordnung erkannter Gebäude zu den entsprechenden Datenbank-Einträgen. Azuma (1997) definiert AR-Systeme durch drei Kernmerkmale – Kombination von Realem und Virtuellem, Echtzeit-Interaktion und 3D-Registrierung –, die in ARLandmarks vollständig umgesetzt sind.

### Datenmanagement und Web-Dashboard

Das Web-Dashboard (Next.js, React, TypeScript) dient der Verwaltung der 108 Landmarks und ermöglicht den Sync mit der Zürich Tourismus API. Die Supabase-Datenbank stellt die Daten über eine REST-API sowohl dem Dashboard als auch der iOS-App bereit. Row Level Security gewährleistet den kontrollierten Datenzugriff.

## Erworbene Fachkompetenzen

Durch das Projekt wurden folgende Kompetenzen erworben und vertieft, die über die SAE-Diplomastufe hinausgehen:

- **Machine Learning Engineering:** Eigenständige Konzeption und Durchführung einer ML-Pipeline vom Datensammeln über das Training bis zur mobilen Deployment-Optimierung.
- **AR-Entwicklung:** Implementierung einer produktionsreifen AR-Anwendung mit ARKit, inklusive World Tracking, Geopositionierung und Echtzeit-Overlay-Rendering.
- **Full-Stack-Entwicklung:** Aufbau eines zusammenhängenden Systems aus iOS-App, Web-Dashboard und ML-Backend mit einheitlicher Datenarchitektur.
- **Iteratives Projektmanagement:** Anwendung von PDCA-Zyklen zur systematischen Qualitätsverbesserung des ML-Modells und der Nutzererfahrung.

## Fazit und Lernerfolg

ARLandmarks demonstriert, wie AR und Machine Learning zu einem funktionalen Medienprodukt verbunden werden können, das einen konkreten Mehrwert im touristischen Kontext bietet. Der iterative Entwicklungsprozess hat sich als entscheidend für die Qualitätssteigerung erwiesen: Jede Trainingsiteration brachte messbare Verbesserungen in der Erkennungsgenauigkeit. Das Projekt hat gezeigt, dass Transfer Learning auch mit begrenzten Ressourcen leistungsfähige, mobile Erkennungssysteme ermöglicht – eine Erkenntnis, die für künftige Projekte in der mobilen AR-Entwicklung direkt anwendbar ist.

---

## Im Leaflet zitierte Quellen

Apple (2024) *ARKit documentation.* Available at: https://developer.apple.com/documentation/arkit (Accessed: 10 February 2026).

Azuma, R. (1997) 'A survey of augmented reality', *Presence: Teleoperators and Virtual Environments*, 6(4), pp. 355–385.

Deming, W.E. (2000) *Out of the crisis.* Cambridge, MA: MIT Press.

Howard, A., Sandler, M., Chen, B., Wang, W., Chen, L.C., Tan, M., Chu, G., Vasudevan, V., Zhu, Y., Pang, R., Adam, H. and Le, Q. (2019) 'Searching for MobileNetV3', *Proceedings of the IEEE/CVF International Conference on Computer Vision (ICCV).* Seoul, South Korea, 27 October–2 November. New York: IEEE, pp. 1314–1324.

Kounavis, C.D., Kasimati, A.E. and Zamani, E.D. (2012) 'Enhancing the tourism experience through mobile augmented reality: challenges and prospects', *International Journal of Engineering Business Management*, 4(10), pp. 1–6. Available at: https://doi.org/10.5772/51644 (Accessed: 10 February 2026).

Pan, S.J. and Yang, Q. (2010) 'A survey on transfer learning', *IEEE Transactions on Knowledge and Data Engineering*, 22(10), pp. 1345–1359. Available at: https://doi.org/10.1109/TKDE.2009.191 (Accessed: 10 February 2026).

Sommerville, I. (2016) *Software engineering.* 10th edn. Harlow: Pearson Education.

## Weitere im Projekt verwendete Quellen

Apple (2024) *RealityKit documentation.* Available at: https://developer.apple.com/documentation/realitykit (Accessed: 10 February 2026).
Verwendet für die Implementierung der 3D-Darstellung der AR-Overlays und die Integration mit ARKit.

Apple (2024) *Core ML documentation.* Available at: https://developer.apple.com/documentation/coreml (Accessed: 10 February 2026).
Verwendet für die Integration des trainierten MobileNetV3-Modells in die iOS-App und die On-Device-Inferenz.

Apple (2024) *Vision framework documentation.* Available at: https://developer.apple.com/documentation/vision (Accessed: 10 February 2026).
Verwendet für die Bildanalyse-Pipeline, die Kamerabilder an das Core-ML-Modell weiterleitet.

Paszke, A., Gross, S., Massa, F., Lerer, A., Bradbury, J., Chanan, G., Killeen, T., Lin, Z., Gimelshein, N., Antiga, L., Desmaison, A., Köpf, A., Yang, E., DeVito, Z., Raison, M., Tejani, A., Chilamkurthy, S., Steiner, B., Fang, L., Bai, J. and Chintala, S. (2019) 'PyTorch: an imperative style, high-performance deep learning library', *Advances in Neural Information Processing Systems*, 32, pp. 8024–8035.
Verwendet als Framework für das Training des Landmark-Erkennungsmodells mittels Transfer Learning.

Supabase (no date) *Supabase documentation.* Available at: https://supabase.com/docs (Accessed: 10 February 2026).
Verwendet für die Anbindung der PostgreSQL-Datenbank an die iOS-App und das Web-Dashboard, inklusive Row Level Security und REST-API.
