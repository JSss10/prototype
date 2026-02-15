# AR Landmarks Zurich – Leaflet

Texte für das bestehende Layout, gegliedert nach Sektionen.

---

## SEITE 1

---

### Hero (links)

**Titel:**
Entdecke Zürich mit ARLandmarks!

**Untertitel:**
Augmented Reality trifft Bilderkennung – erlebe Zürcher Wahrzeichen interaktiv durch die Kamera deines iPhones.

**Footer-Leiste:**
B.Sc. Web Development | Advanced Specialised Project (ASP) – Leaflet | SAE Institut Zürich

---

### Projektübersicht (rechts oben)

AR Landmarks Zurich ist eine iOS-Applikation, die Zürcher Sehenswürdigkeiten in Echtzeit über die Kamera erkennt und kontextbezogene Informationen als Augmented-Reality-Overlay einblendet. Augmented Reality beschreibt die Überlagerung der realen Umgebung mit computergenerierten virtuellen Objekten in Echtzeit (Azuma, 1997). Im Gegensatz zu klassischen Reiseführer-Apps, die auf GPS setzen, kombiniert AR Landmarks visuelle Erkennung durch ein Machine-Learning-Modell mit AR-gestützter Darstellung – ein Ansatz, der laut Cao et al. (2023) zunehmend an Bedeutung für mobile Anwendungen gewinnt. Ergänzt wird die App durch ein webbasiertes Dashboard zur Verwaltung der Landmark-Daten sowie eine ML-Pipeline zum Trainieren des Erkennungsmodells.

---

### Lernerfolge & Reflexion (rechts mitte)

**iOS-Entwicklung mit SwiftUI & ARKit**

Die App wurde vollständig in Swift mit SwiftUI entwickelt. Die Landmark-Erkennung erfolgt über Core ML, das sämtliche Bilddaten lokal auf dem Gerät verarbeitet und so die Privatsphäre der Nutzer:innen gewährleistet (Apple Inc., 2024a). Die AR-Darstellung basiert auf ARKit, das eine präzise Erfassung der realen Umgebung über Kamera und Gerätesensoren ermöglicht (Apple Inc., 2024b). Besonders herausfordernd war die korrekte räumliche Positionierung der AR-Overlays relativ zu den erkannten Sehenswürdigkeiten. Ich habe gelernt, wie Core ML und ARKit zusammenarbeiten, um ein reaktives AR-Erlebnis auf dem iPhone zu realisieren – ein Zusammenspiel, das auch Le et al. (2021) in ihrer Forschung zu ARKit-basierter Objekterkennung als besonders effektiv beschreiben.

**Backend & Datenmanagement**

Als Backend-as-a-Service kommt Supabase zum Einsatz, das eine PostgreSQL-Datenbank, Authentifizierung via OAuth und Row Level Security (RLS) bereitstellt (Supabase, 2024). Das Dashboard wurde als Next.js-Applikation mit React und TypeScript umgesetzt und ermöglicht die Verwaltung von 108 Zürcher Sehenswürdigkeiten. Ich habe gelernt, ein Full-Stack-System mit getrenntem Frontend, Backend und ML-Pipeline zu konzipieren und die Datenflüsse zwischen den Komponenten effizient zu gestalten.

---

### Statistiken-Leiste

108 Zürcher Wahrzeichen | 75%+ Modellgenauigkeit | < 50 ms Erkennungszeit | 2 AR-Modi

---

### Abschluss-Absatz (unten, Seite 1)

Das Herzstück der Erkennung ist ein Bildklassifikationsmodell auf Basis der MobileNetV3-Small-Architektur, die gezielt für mobile Endgeräte optimiert wurde (Howard et al., 2019, pp. 1314–1315). Trainiert wurde es mittels Transfer Learning – einem Verfahren, bei dem ein auf grossen Datensätzen vortrainiertes Modell auf eine neue Aufgabe angepasst wird (Pan und Yang, 2010). Dies ermöglichte trotz begrenzter Trainingsdaten (20–50 Bilder pro Sehenswürdigkeit) eine zuverlässige Erkennung. Die Arbeit an diesem Projekt hat mir gezeigt, wie vielschichtig die Entwicklung eines AR-gestützten Erkennungssystems ist – von der Datensammlung über das ML-Training bis zur nativen iOS-Umsetzung.

---

## SEITE 2

---

### Das Medienprodukt (links oben)

AR Landmarks Zurich ist das konkrete Ergebnis meines ASP und dient als Kernstück meiner Bewerbungsmappe. Die App besteht aus drei Komponenten: der iOS-App (Swift, SwiftUI, Core ML, ARKit), dem Web-Dashboard (Next.js, React, TypeScript) und der ML-Training-Pipeline (Python, PyTorch). Die modulare MVVM-Architektur der iOS-App trennt Services für Datenbankanbindung, Vision, Wetter-API, Standort und AR-Positionierung voneinander – ein Aufbau, der sowohl Wartbarkeit als auch Erweiterbarkeit sicherstellt.

---

### Erworbene Fachkompetenzen (links unten, 4 Boxen)

**Mobile App-Entwicklung**
Native iOS-Entwicklung mit Swift und SwiftUI, Integration von ARKit für Augmented Reality und Core ML für On-Device Machine Learning.

**Backend & Datenbanken**
Aufbau eines Full-Stack-Systems mit Supabase (PostgreSQL, OAuth, RLS), API-Synchronisation und serverseitiger Datenverwaltung via Next.js.

**Machine Learning**
Training eines MobileNetV3-Klassifikationsmodells mit Transfer Learning (Pan und Yang, 2010) in PyTorch, inklusive Data Augmentation und Konvertierung ins Core-ML-Format.

**Dokumentation & Methodik**
Strukturierte Projektdokumentation, systematische Evaluation von Modellparametern und methodisches Vorgehen bei der iterativen Weiterentwicklung.

---

### Im Leaflet zitierte Quellen (rechts oben)

Apple Inc. (2024a) *Core ML*. Available at: https://developer.apple.com/documentation/coreml (Accessed: 15 February 2026).

Apple Inc. (2024b) *ARKit*. Available at: https://developer.apple.com/documentation/arkit (Accessed: 15 February 2026).

Azuma, R.T. (1997) 'A survey of augmented reality', *Presence: Teleoperators and Virtual Environments*, 6(4), pp. 355–385. Available at: https://doi.org/10.1162/pres.1997.6.4.355 (Accessed: 15 February 2026).

Cao, J., Lam, K.-Y., Lee, L.-H., Liu, X., Hui, P. and Su, X. (2023) 'Mobile augmented reality: user interfaces, frameworks, and intelligence', *ACM Computing Surveys*, 55(9), article 189, pp. 1–36. Available at: https://doi.org/10.1145/3557999 (Accessed: 15 February 2026).

Howard, A., Sandler, M., Chu, G., Chen, L.-C., Chen, B., Tan, M., Wang, W., Zhu, Y., Pang, R., Vasudevan, V., Le, Q.V. and Adam, H. (2019) 'Searching for MobileNetV3', *Proceedings of the IEEE/CVF International Conference on Computer Vision (ICCV)*, pp. 1314–1324. Available at: https://doi.org/10.1109/ICCV.2019.00140 (Accessed: 15 February 2026).

Le, H., Nguyen, M., Yan, W.Q. and Nguyen, H. (2021) 'Augmented reality and machine learning incorporation using YOLOv3 and ARKit', *Applied Sciences*, 11(13), 6006. Available at: https://doi.org/10.3390/app11136006 (Accessed: 15 February 2026).

Pan, S.J. and Yang, Q. (2010) 'A survey on transfer learning', *IEEE Transactions on Knowledge and Data Engineering*, 22(10), pp. 1345–1359. Available at: https://doi.org/10.1109/TKDE.2009.191 (Accessed: 15 February 2026).

Supabase (2024) *Supabase documentation*. Available at: https://supabase.com/docs (Accessed: 15 February 2026).

---

### Weitere im Projekt verwendete Quellen (rechts mitte)

Apple Inc. (2024) *Create ML*. Available at: https://developer.apple.com/documentation/createml (Accessed: 15 February 2026).
Verwendet zum Vergleich mit der eigenen PyTorch-Pipeline; Create ML bietet eine vereinfachte Alternative für das Modelltraining direkt auf dem Mac, wurde jedoch zugunsten grösserer Flexibilität nicht eingesetzt.

Apple Inc. (2024) *SwiftUI*. Available at: https://developer.apple.com/documentation/swiftui (Accessed: 15 February 2026).
Primäre Referenz für die Entwicklung der Benutzeroberfläche der iOS-App mit deklarativem UI-Framework.

Plested, J., Phiri, L. and Gedeon, T. (2022) 'Deep transfer learning for image classification: a survey', *arXiv preprint arXiv:2205.09904*. Available at: https://arxiv.org/abs/2205.09904 (Accessed: 15 February 2026).
Überblick über Transfer-Learning-Ansätze für Bildklassifikation. Diente der Evaluation verschiedener Strategien (Feature Extraction vs. Fine-Tuning).

PyTorch (2024) *PyTorch documentation*. Available at: https://pytorch.org/docs/stable/ (Accessed: 15 February 2026).
Zentrale Dokumentation für das Training des Klassifikationsmodells mit torchvision.models.

Vercel (2024) *Next.js documentation*. Available at: https://nextjs.org/docs (Accessed: 15 February 2026).
Referenz für die Entwicklung des Web-Dashboards mit Next.js App Router und Server Components.
