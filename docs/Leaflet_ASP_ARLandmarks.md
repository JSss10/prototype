# Leaflet – Allgemeines Schulprojekt (ASP)

**Projekt:** ARLandmarks – Augmented Reality Stadtführer für Zürich
**Autorin:** Jessica Schneiter
**Datum:** Februar 2026

---

## 1. Einleitung und Projektübersicht

Im Rahmen meines ASP habe ich «ARLandmarks» entwickelt – eine iOS-Applikation, die Augmented Reality (AR) nutzt, um Sehenswürdigkeiten in Zürich interaktiv erlebbar zu machen. Die App verbindet zwei zentrale Funktionen: Eine **visuelle Erkennung** von Wahrzeichen mittels Machine Learning und eine **GPS-basierte Anzeige** von Points of Interest (POI) in der AR-Ansicht.

Das Ziel war es, ein funktionsfähiges Medienprodukt zu schaffen, das moderne Technologien wie Computer Vision, Augmented Reality und Cloud-Dienste in einer benutzerfreundlichen Anwendung vereint.

<!-- Screenshot: Hauptansicht der App mit AR-Kameraansicht einfügen -->
<!-- Bild: ![ARLandmarks Hauptansicht](pfad/zum/screenshot.png) -->

---

## 2. Lernerfolge und erworbene Fachkompetenzen

### 2.1 iOS-Entwicklung mit SwiftUI und ARKit

Zu Beginn des Projekts hatte ich grundlegende Kenntnisse in Swift. Durch die Arbeit an ARLandmarks habe ich meine Fähigkeiten in der iOS-Entwicklung wesentlich vertieft. Konkret habe ich gelernt:

- **SwiftUI** als deklaratives UI-Framework einzusetzen, um Views wie die `ARLandmarkView`, `OverviewView` und `LandmarkDetailSheet` zu gestalten.
- **ARKit** für die Darstellung von 3D-Inhalten im Kamerabild zu nutzen. Dabei musste ich verstehen, wie reale GPS-Koordinaten in AR-Weltkoordinaten umgerechnet werden (`ARPositionCalculator`).
- Das **MVVM-Architekturmuster** (Model-View-ViewModel) konsequent umzusetzen, z. B. mit dem `ARModeManager` als zentralem ViewModel für die AR-Modussteuerung.

**Bezug zum Lerntagebuch:** Die grösste Herausforderung war die korrekte Positionierung der AR-Marker basierend auf GPS und Kompassdaten. Durch iteratives Testen und Anpassen des Distanz-Skalierungsalgorithmus (2–6 Meter im AR-Raum für bis zu 2 km reale Distanz) konnte ich eine stabile Darstellung erreichen.

### 2.2 Machine Learning und Core ML

Ein zentraler Lernerfolg war der Aufbau einer vollständigen **ML-Pipeline** – vom Sammeln der Trainingsdaten bis zur Bereitstellung eines Modells auf dem iPhone:

1. **Datensammlung**: Automatisiertes Herunterladen von Bildern via Wikimedia Commons sowie manuelles Ergänzen von qualitativ hochwertigen Fotos.
2. **Modelltraining**: Einsatz von **Transfer Learning** mit MobileNetV3-Small in PyTorch. Ich lernte, wie vortrainierte Gewichte auf eine neue Aufgabe (Landmark-Klassifikation) angepasst werden und wie Data Augmentation (Rotation, Farbveränderung, Spiegelung) die Generalisierung verbessert (vgl. Howard et al., 2019).
3. **Konvertierung und Deployment**: Umwandlung des PyTorch-Modells in das Core ML-Format mittels `coremltools` und Integration in die iOS-App über das Vision-Framework.

Das trainierte Modell erreicht eine **Validierungsgenauigkeit von 70–85 %** bei einer Inferenzzeit von unter 50 ms auf dem iPhone – ein praxistaugliches Ergebnis für Echtzeit-Erkennung.

<!-- Bild: Trainings-Accuracy-Kurve oder Confusion Matrix einfügen -->
<!-- Bild: ![Training History](pfad/zum/training_chart.png) -->

### 2.3 Backend-Entwicklung und Datenmanagement

Für die Datenhaltung und das Content-Management habe ich **Supabase** als Backend-as-a-Service eingesetzt und gelernt:

- Eine **relationale Datenbank** (PostgreSQL) mit Tabellen für Landmarks, Kategorien und Fotos zu modellieren und über REST-APIs anzubinden.
- Ein **Management-Dashboard** mit Next.js und React zu entwickeln, das CRUD-Operationen, Suche und Sortierung sowie die Synchronisation mit der Zürich Tourismus API ermöglicht.
- **Authentifizierung** mittels Supabase Auth zu implementieren, um den Zugang zum Dashboard zu schützen.

### 2.4 Projektmanagement und Dokumentation

Über das Projekt hinweg habe ich gelernt, technische Dokumentation so zu verfassen, dass sie auch für Einsteiger verständlich ist. Die erstellten Guides (Quickstart, Schritt-für-Schritt-Anleitungen, Troubleshooting) folgen einem didaktischen Aufbau und ermöglichen eine Reproduzierbarkeit des gesamten ML-Trainings.

---

## 3. Reflexion und Fazit

Das ASP hat mir gezeigt, wie komplex die Entwicklung eines Medienprodukts ist, das mehrere Technologiedomänen vereint. Die grössten Lerneffekte entstanden dort, wo Theorie und Praxis aufeinandertrafen – etwa beim Verständnis, warum ein ML-Modell mit wenigen Trainingsdaten schlecht generalisiert, oder wie GPS-Ungenauigkeiten die AR-Darstellung beeinflussen.

In einer Bewerbungssituation würde ich dieses Projekt als Nachweis meiner Fähigkeit anführen, eigenständig ein technisch anspruchsvolles Produkt von der Konzeption bis zur funktionsfähigen Umsetzung zu realisieren. Die erworbenen Kompetenzen in Swift/SwiftUI, Machine Learning, Cloud-Diensten und Projektdokumentation sind direkt auf professionelle Entwicklungsprojekte übertragbar.

---

## Quellenverzeichnis

### Im Leaflet zitierte Quellen

Apple Inc. (2025). *ARKit Documentation*. Apple Developer. https://developer.apple.com/documentation/arkit

Apple Inc. (2025). *Core ML Documentation*. Apple Developer. https://developer.apple.com/documentation/coreml

Apple Inc. (2025). *Vision Framework Documentation*. Apple Developer. https://developer.apple.com/documentation/vision

Howard, A., Sandler, M., Chen, B., Wang, W., Chen, L.-C., Tan, M., Chu, G., Vasudevan, V., Zhu, Y., Pang, R., Adam, H., & Le, Q. V. (2019). Searching for MobileNetV3. *Proceedings of the IEEE/CVF International Conference on Computer Vision (ICCV)*, 1314–1324. https://doi.org/10.1109/ICCV.2019.00140

Paszke, A., Gross, S., Massa, F., Lerer, A., Bradbury, J., Chanan, G., Killeen, T., Lin, Z., Gimelshein, N., Antiga, L., Desmaison, A., Köpf, A., Yang, E., DeVito, Z., Raison, M., Tejani, A., Chilamkurthy, S., Steiner, B., Fang, L., Bai, J., & Chintala, S. (2019). PyTorch: An Imperative Style, High-Performance Deep Learning Library. *Advances in Neural Information Processing Systems*, 32. https://doi.org/10.48550/arXiv.1912.01703

### Weitere im Projekt verwendete Quellen

Apple Inc. (2025). *SwiftUI Tutorials*. Apple Developer. https://developer.apple.com/tutorials/swiftui
→ Grundlage für den Aufbau der Benutzeroberfläche und Navigation der iOS-App.

Next.js (2025). *Next.js Documentation*. Vercel. https://nextjs.org/docs
→ Verwendet für die Entwicklung des Management-Dashboards mit Server-Side Rendering.

Supabase (2025). *Supabase Documentation*. https://supabase.com/docs
→ Referenz für die Einrichtung der Datenbank, Authentifizierung und REST-API-Anbindung.

PyTorch (2025). *PyTorch Documentation*. https://pytorch.org/docs
→ Grundlage für das Training des MobileNetV3-Modells mittels Transfer Learning.

CoreMLTools (2025). *coremltools Documentation*. Apple. https://coremltools.readme.io
→ Verwendet für die Konvertierung des PyTorch-Modells ins Core ML-Format.

Wikimedia Commons (2025). *Wikimedia Commons API*. https://commons.wikimedia.org/wiki/Commons:API
→ Quelle für das automatisierte Herunterladen von Trainingsbildern der Zürcher Sehenswürdigkeiten.

Stadt Zürich Tourismus (2025). *Zürich Tourismus Open Data API*.
→ Datenquelle für Points of Interest inkl. Öffnungszeiten, Adressen und Beschreibungen.

Tailwind CSS (2025). *Tailwind CSS Documentation*. https://tailwindcss.com/docs
→ CSS-Framework für das Styling des Dashboards.
