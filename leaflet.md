# AR Landmarks Zurich – Leaflet

**Advanced Specialised Project (ASP)**
Modul: 6FSC0XD101 – Creative Studio 3: Research and Practice
Name: [Dein Name]
Datum: Februar 2026

---

## Projektübersicht

Das Medienprodukt des Advanced Specialised Projects ist **AR Landmarks Zurich** – eine iOS-Applikation, die Zürcher Sehenswürdigkeiten in Echtzeit über die Kamera erkennt und kontextbezogene Informationen als Augmented-Reality-Overlay einblendet. Ergänzt wird die App durch ein webbasiertes Dashboard zur Verwaltung der Landmark-Daten sowie eine Machine-Learning-Pipeline zum Trainieren des Erkennungsmodells.

Das Konzept von Augmented Reality (AR) beschreibt die Überlagerung der realen Umgebung mit computergenerierten virtuellen Objekten in Echtzeit (Azuma, 1997). Die vorliegende Applikation nutzt dieses Prinzip, um Nutzer:innen beim Erkunden der Stadt Zürich einen informationsreichen Mehrwert zu bieten. Im Gegensatz zu klassischen Reiseführer-Apps, die auf GPS-basierte Standortabfragen setzen, kombiniert AR Landmarks Zurich visuelle Erkennung durch maschinelles Lernen mit AR-gestützter Darstellung – ein Ansatz, der laut Cao et al. (2023) zunehmend an Bedeutung für mobile Anwendungen gewinnt.

## Technische Umsetzung und Lernerfolge

### Bildklassifikation mit Transfer Learning

Das Herzstück der App ist ein Bildklassifikationsmodell auf Basis der **MobileNetV3-Small**-Architektur (Howard et al., 2019). MobileNetV3 wurde mittels einer Kombination aus Hardware-aware Network Architecture Search (NAS) und dem NetAdapt-Algorithmus gezielt für den Einsatz auf mobilen Endgeräten optimiert (Howard et al., 2019, pp. 1314-1315). Die Wahl fiel bewusst auf diese Architektur, da sie bei geringer Modellgrösse (ca. 2-5 MB) und minimaler Inferenzzeit (<50 ms auf dem iPhone) eine ausreichend hohe Erkennungsgenauigkeit ermöglicht.

Für das Training wurde **Transfer Learning** eingesetzt – ein Ansatz, bei dem ein bereits auf grossen Datensätzen (z. B. ImageNet) vortrainiertes Modell auf eine neue, spezifischere Aufgabe angepasst wird (Pan und Yang, 2010). Dieses Verfahren ist besonders vorteilhaft, wenn nur begrenzte Trainingsdaten verfügbar sind (Pan und Yang, 2010, p. 1346), was im vorliegenden Projekt der Fall war: Pro Sehenswürdigkeit standen zwischen 20 und 50 Bilder zur Verfügung. Die Training-Pipeline wurde in **Python** mit **PyTorch** umgesetzt und umfasst automatisiertes Data Augmentation (Spiegelungen, Rotationen, Farbverschiebungen), um die Generalisierungsfähigkeit des Modells zu verbessern.

**Lernerfolg:** Ich habe gelernt, ein praxistaugliches ML-Modell mit begrenzten Daten zu trainieren, den gesamten Workflow von der Datensammlung über das Training bis zur Konvertierung ins Core-ML-Format selbständig umzusetzen und dabei die Stellschrauben (Epochen, Lernrate, Dropout) systematisch zu evaluieren.

### iOS-Entwicklung mit SwiftUI, ARKit und Core ML

Die iOS-App wurde vollständig in **Swift** mit **SwiftUI** als deklarativem UI-Framework entwickelt. Die Integration des trainierten Modells erfolgte über **Core ML**, Apples Framework für maschinelles Lernen auf dem Gerät, welches die Privatsphäre der Nutzer:innen schützt, da sämtliche Bilddaten lokal verarbeitet werden und das Gerät nicht verlassen (Apple Inc., 2024a). Die AR-Funktionalität basiert auf **ARKit**, das eine präzise Erfassung der realen Umgebung über die Kamera und die Gerätesensoren ermöglicht (Apple Inc., 2024b).

Die App-Architektur folgt dem **MVVM-Pattern** (Model-View-ViewModel) und ist modular aufgebaut: Services für Supabase-Datenbankanbindung, Vision (ML-basierte Erkennung), Wetter-API, Standortdienste und AR-Positionierung sind voneinander getrennt. Diese Architektur erleichtert sowohl die Wartbarkeit als auch die Erweiterbarkeit des Codes.

**Lernerfolg:** Ich habe vertiefte Kenntnisse in der nativen iOS-Entwicklung mit SwiftUI erworben und gelernt, wie Core ML und ARKit zusammenarbeiten, um ein reaktives AR-Erlebnis auf dem iPhone zu realisieren. Besonders herausfordernd war die korrekte räumliche Positionierung der AR-Overlays relativ zu den erkannten Sehenswürdigkeiten.

### Web-Dashboard und Backend

Das Verwaltungs-Dashboard wurde als **Next.js**-Applikation mit **React** und **TypeScript** umgesetzt. Es ermöglicht authentifizierten Nutzer:innen, Sehenswürdigkeiten zu erstellen, zu bearbeiten und mit Bildern zu versehen. Als Backend-as-a-Service kommt **Supabase** zum Einsatz, das eine PostgreSQL-Datenbank, Authentifizierung (OAuth mit Google) und Row Level Security (RLS) bereitstellt (Supabase, 2024). Die Landmark-Daten werden über die Zurich Tourism API synchronisiert und umfassen aktuell 108 Zürcher Sehenswürdigkeiten.

**Lernerfolg:** Ich habe gelernt, ein Full-Stack-System mit getrenntem Frontend, Backend und ML-Pipeline zu konzipieren und umzusetzen. Die Arbeit mit Supabase hat mir gezeigt, wie moderne BaaS-Lösungen den Entwicklungsprozess beschleunigen können, ohne auf Sicherheitsaspekte wie RLS zu verzichten.

## Fachkompetenz und Relevanz

Das Projekt vereint mehrere Fachbereiche: Mobile App-Entwicklung, maschinelles Lernen, Augmented Reality und Web-Entwicklung. Die Kombination von visueller Landmark-Erkennung mit AR-Overlays geht dabei über die Inhalte der SAE-Diplomastufe hinaus und greift einen Trend auf, den Le et al. (2021) als vielversprechend für den mobilen Einsatz von ML und AR bewerten. Durch die durchgängige Bearbeitung aller Projektteile – vom Daten-Scraping über das ML-Training bis zur nativen iOS-App – habe ich eine breite technische Kompetenz aufgebaut, die in der Medienbranche zunehmend gefragt ist.

Die erworbenen Fähigkeiten in Swift/SwiftUI, Core ML, ARKit, Python/PyTorch und Next.js/React bilden eine solide Grundlage für eine Tätigkeit im Bereich iOS-Entwicklung, AR-Anwendungen oder Machine-Learning-Engineering.

---

## Quellenverzeichnis

### Im Leaflet zitierte Quellen

Apple Inc. (2024a) *Core ML*. Available at: https://developer.apple.com/documentation/coreml (Accessed: 15 February 2026).

Apple Inc. (2024b) *ARKit*. Available at: https://developer.apple.com/documentation/arkit (Accessed: 15 February 2026).

Azuma, R.T. (1997) 'A survey of augmented reality', *Presence: Teleoperators and Virtual Environments*, 6(4), pp. 355-385. Available at: https://doi.org/10.1162/pres.1997.6.4.355 (Accessed: 15 February 2026).

Cao, J., Lam, K.-Y., Lee, L.-H., Liu, X., Hui, P. and Su, X. (2023) 'Mobile augmented reality: user interfaces, frameworks, and intelligence', *ACM Computing Surveys*, 55(9), article 189, pp. 1-36. Available at: https://doi.org/10.1145/3557999 (Accessed: 15 February 2026).

Howard, A., Sandler, M., Chu, G., Chen, L.-C., Chen, B., Tan, M., Wang, W., Zhu, Y., Pang, R., Vasudevan, V., Le, Q.V. and Adam, H. (2019) 'Searching for MobileNetV3', *Proceedings of the IEEE/CVF International Conference on Computer Vision (ICCV)*, pp. 1314-1324. Available at: https://doi.org/10.1109/ICCV.2019.00140 (Accessed: 15 February 2026).

Le, H., Nguyen, M., Yan, W.Q. and Nguyen, H. (2021) 'Augmented reality and machine learning incorporation using YOLOv3 and ARKit', *Applied Sciences*, 11(13), 6006. Available at: https://doi.org/10.3390/app11136006 (Accessed: 15 February 2026).

Pan, S.J. and Yang, Q. (2010) 'A survey on transfer learning', *IEEE Transactions on Knowledge and Data Engineering*, 22(10), pp. 1345-1359. Available at: https://doi.org/10.1109/TKDE.2009.191 (Accessed: 15 February 2026).

Supabase (2024) *Supabase documentation*. Available at: https://supabase.com/docs (Accessed: 15 February 2026).

### Weitere im Projekt verwendete Quellen

Apple Inc. (2024) *Create ML*. Available at: https://developer.apple.com/documentation/createml (Accessed: 15 February 2026).
Verwendet zum Vergleich mit der eigenen PyTorch-Pipeline; Create ML bietet eine vereinfachte Alternative für das Modelltraining direkt auf dem Mac, wurde jedoch zugunsten grösserer Flexibilität und Kontrolle über Hyperparameter nicht eingesetzt.

Apple Inc. (2024) *SwiftUI*. Available at: https://developer.apple.com/documentation/swiftui (Accessed: 15 February 2026).
Primäre Referenz für die Entwicklung der Benutzeroberfläche der iOS-App. SwiftUI ermöglichte als deklaratives Framework eine effiziente und wartbare UI-Entwicklung.

Plested, J., Phiri, L. and Gedeon, T. (2022) 'Deep transfer learning for image classification: a survey', *arXiv preprint arXiv:2205.09904*. Available at: https://arxiv.org/abs/2205.09904 (Accessed: 15 February 2026).
Überblick über aktuelle Transfer-Learning-Ansätze für Bildklassifikation. Diente der Evaluation verschiedener Strategien (Feature Extraction vs. Fine-Tuning) im Kontext des eigenen Projekts.

PyTorch (2024) *PyTorch documentation*. Available at: https://pytorch.org/docs/stable/ (Accessed: 15 February 2026).
Zentrale Dokumentation für das Training des Bildklassifikationsmodells, insbesondere für den Einsatz von torchvision.models und die Konfiguration des Trainingsprozesses.

Vercel (2024) *Next.js documentation*. Available at: https://nextjs.org/docs (Accessed: 15 February 2026).
Referenz für die Entwicklung des Web-Dashboards mit Next.js App Router, Server Components und API Routes.
