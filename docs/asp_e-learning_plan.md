# E-Learning Plan
## Advanced Specialised Project (ASP)

**Jessica Schneiter** | BSc Web Development | SAE Institut Zürich
**Datum:** Januar 2026

---

## 1. Geplante Form des E-Learnings

### Format: Screencast-Tutorial mit Voice-Over (ca. 15 Minuten)

Das E-Learning wird als praxisnahes Screencast-Tutorial produziert, das meinen Lernprozess transparent und nachvollziehbar dokumentiert. Das Tutorial richtet sich an Einsteiger:innen in die iOS- und AR-Entwicklung, insbesondere an Web-Entwickler:innen (SAE-Diploma Niveau), die einen verständlichen Einstieg in kontextsensitive AR-Anwendungen suchen.

| Aspekt | Details |
|--------|---------|
| **Dauer** | Ca. 15 Minuten (± 5 Minuten) |
| **Format** | Video mit Screencast + Voice-Over |
| **Zielgruppe** | SAE-Diploma Absolvent:innen, Web-Entwickler:innen |
| **Werkzeuge** | Xcode, iPhone 14, QuickTime/OBS für Aufnahme |
| **Abgabeformat** | MP4-Video oder nach Absprache mit Tutor |

---

## 2. Inhaltlicher Abriss (Ausführliches Inhaltsverzeichnis)

### Kapitel 1: Einleitung (ca. 2 Min.)
- Vorstellung des Projekts: **AR-Prototyp für kontextsensitive Informationen**
- Zielsetzung: Sehenswürdigkeiten im Kamerabild erkennen und API-Daten als AR-Overlay darstellen
- Überblick über die Lernreise: Von Setup bis zum funktionsfähigen Prototyp
- Kurze Demo des fertigen Prototyps (ARLandmarks App)

### Kapitel 2: Entwicklungsumgebung & Setup (ca. 2 Min.)
- **Xcode-Einrichtung** und Apple Developer Account
- **GitHub-Repository** anlegen für Versionierung
- Projektstruktur und erste **SwiftUI-Grundlagen**
- Konfiguration von Info.plist für API-Keys (Supabase, OpenWeather)

### Kapitel 3: ARKit-Grundlagen (ca. 3 Min.)
- Einführung in **ARKit**: Was ist AR-Tracking?
- **ARSession** konfigurieren und AR-Ansicht erstellen
- Erste AR-Objekte im Raum platzieren (Mini-Projekt)
- Unterschied zwischen **Visual Recognition** und **Geo-Based** Modus
- Code-Beispiel: `ARViewContainer.swift` und `ARPositionCalculator.swift`

### Kapitel 4: API-Integration (ca. 3 Min.)
- Auswahl und Anbindung externer APIs:
  - **Supabase** für Landmark-Daten
  - **OpenWeather** für Wetterdaten
- JSON-Daten abrufen und verarbeiten mit Swift Codable
- Debugging-Strategien bei API-Problemen
- Live-Demo: `SupabaseService.swift` und `WeatherService.swift`

### Kapitel 5: AR-Overlay-Gestaltung (ca. 3 Min.)
- **SwiftUI-Komponenten** mit AR kombinieren
- Kontextsensitive Informationen visuell darstellen
- UI/UX-Prinzipien für zugängliche AR-Interfaces
- Implementierung: Landmark-Cards, Wetter-Overlay, Modus-Umschalter
- RealityKit: POI-Spheres und Tap-Interaktion

### Kapitel 6: Testing & Optimierung (ca. 1.5 Min.)
- Geräte-Tests auf iPhone 14
- Performance-Optimierung der ARSession
- Umgang mit typischen Problemen (GPS-Genauigkeit, AR-Tracking-Verlust)
- Location-Service Threading und Sendable-Konformität

### Kapitel 7: Fazit & Reflexion (ca. 0.5 Min.)
- Zusammenfassung der wichtigsten Learnings
- Ausblick: Weiterführung im **Major Project** (AR Mikro-Navigation für Rollstuhlfahrer:innen)
- Ressourcen und weiterführende Dokumentation

---

## 3. Erste Materialien und Zwischenstände

| Material | Status | Verwendung im E-Learning |
|----------|--------|--------------------------|
| **GitHub-Repository** | Vorhanden | Code-Beispiele und Commits zeigen |
| **Xcode-Projekt (ARLandmarks)** | Funktionsfähig | Live-Demo der Entwicklungsumgebung |
| **iOS App (21 Swift-Dateien)** | Abgeschlossen | Architektur und Code-Walkthrough |
| **ARKit Mini-Projekte** | Integriert | Schrittweise Lernfortschritte demonstrieren |
| **API-Integration** | Funktionsfähig | JSON-Verarbeitung visualisieren |
| **Lerntagebuch** | Laufend | Reflexionen und Entscheidungen dokumentieren |
| **Screenshots/Debugging** | Laufend | Visuelle Zwischenstände für Tutorial |
| **Dashboard (Next.js)** | Funktionsfähig | Admin-Interface zur Datenverwaltung |
| **ML Training Pipeline** | Vorbereitet | Dokumentation des Vision-Service |

### Projekt-Architektur (für E-Learning)

```
ARLandmarks/
├── Views/           # 6 SwiftUI Views
├── ViewModels/      # 2 ViewModels (MVVM)
├── Services/        # 5 Service-Klassen
├── Models/          # 4 Datenmodelle
└── Utilities/       # 3 Helper-Extensions
```

---

## 4. Interessante Quellen für das E-Learning

Die folgenden fünf Quellen werden im E-Learning vorgestellt und bilden die Grundlage für den Lernprozess:

### 1. Apple Developer Documentation – ARKit
Offizielle Dokumentation zu ARKit mit Best Practices für AR-Tracking, Scene Understanding und Rendering. Unverzichtbar für das Verständnis der technischen Grundlagen.

**URL:** [developer.apple.com/documentation/arkit](https://developer.apple.com/documentation/arkit)

### 2. WWDC Sessions – ARKit Updates
Jährliche Apple-Konferenz mit detaillierten Sessions zu neuen ARKit-Features. Besonders relevant: Sessions zu World Tracking und Scene Geometry.

**URL:** [developer.apple.com/videos](https://developer.apple.com/videos)

### 3. SwiftUI Tutorials – Apple
Interaktive Tutorials für SwiftUI-Grundlagen und fortgeschrittene UI-Patterns. Grundlage für die Integration von AR-Views mit SwiftUI-Komponenten.

**URL:** [developer.apple.com/tutorials/swiftui](https://developer.apple.com/tutorials/swiftui)

### 4. Hacking with Swift – ARKit Tutorials (Paul Hudson)
Praxisnahe Tutorials mit Schritt-für-Schritt-Anleitungen für ARKit-Projekte. Besonders hilfreich für Einsteiger:innen durch verständliche Erklärungen.

**URL:** [hackingwithswift.com](https://www.hackingwithswift.com)

### 5. Open Data API – swisstopo / OpenStreetMap
Offene Geodaten-APIs für Standortinformationen und Points of Interest. Werden für die Integration kontextsensitiver Daten im AR-Prototyp verwendet.

**URL:** [api3.geo.admin.ch](https://api3.geo.admin.ch) / [openstreetmap.org](https://www.openstreetmap.org)

---

## 5. Geplanter Aufnahme-Workflow

1. **Vorbereitung**
   - Xcode-Projekt bereinigen und relevante Dateien öffnen
   - iPhone 14 mit Xcode verbinden für Live-Demo
   - OBS/QuickTime für Bildschirmaufnahme einrichten

2. **Aufnahme**
   - Kapitelweise aufnehmen für einfache Nachbearbeitung
   - Code-Highlights mit Zoom-Effekten betonen
   - Voice-Over separat aufnehmen für bessere Audioqualität

3. **Nachbearbeitung**
   - Schnitt und Zusammenführung der Kapitel
   - Untertitel hinzufügen (Barrierefreiheit)
   - Intro/Outro mit Projektübersicht

---

## 6. Timeline für E-Learning-Produktion

| Phase | Zeitaufwand | Deadline |
|-------|-------------|----------|
| Skript finalisieren | 2h | Lernlab |
| Materialien vorbereiten | 2h | Lernlab |
| Aufnahme | 4h | Nach Lernlab |
| Nachbearbeitung | 3h | Vor Abgabe |
| Review & Export | 1h | Finale Abgabe |

---

*Formative Prüfung zum ASP | Creative Studio 3: Research and Practice*
