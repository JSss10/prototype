# Lernfortschritt – Reflexion
## Advanced Specialised Project (ASP)

**Jessica Schneiter** | BSc Web Development | SAE Institut Zürich
**Datum:** Januar 2026
**Projekt:** ARLandmarks – Kontextsensitive AR-Informationen für Zürich

---

## Projektstatus-Übersicht

| Komponente | Status | Fortschritt |
|------------|--------|-------------|
| iOS App (ARLandmarks) | Funktionsfähig | 90% |
| AR-Visualisierung | Abgeschlossen | 100% |
| API-Integration (Supabase) | Abgeschlossen | 100% |
| Wetter-Integration | Abgeschlossen | 100% |
| ML-Modell Training | Vorbereitet | 60% |
| Dashboard (Next.js) | Funktionsfähig | 95% |
| E-Learning Materialien | In Arbeit | 50% |

---

## 1. Bin ich im Zeitrahmen?

### Ja, ich befinde mich aktuell in der Learning-/Integrationsphase gemäss meinem Projektstrukturplan.

**Abgeschlossene Meilensteine:**
- Setup-Phase: Xcode, Developer Account, GitHub Repository
- Grundlegende App-Architektur (MVVM-Pattern)
- ARKit- und SwiftUI-Integration
- API-Anbindung an Supabase und OpenWeather
- Dual-Modus-System (Visual Recognition + Geo-Based)
- Admin-Dashboard für Datenverwaltung

**Aktuelle Phase:**
- E-Learning-Produktion vorbereiten
- ML-Modell für Landmark-Erkennung trainieren (Image Collection)
- Dokumentation finalisieren

**Pufferwochen sind eingeplant**, um bei Verzögerungen flexibel zu bleiben. Das ML-Training kann parallel zur E-Learning-Produktion erfolgen.

---

## 2. Sind die bisherigen Ergebnisse zufriedenstellend?

### Ja, die Lernkurve ist wie erwartet steil, aber durch die Mini-Projekte mit wachsendem Schwierigkeitsgrad bleibe ich motiviert.

**Erfolge:**
- **21 Swift-Dateien** mit sauberer Architektur (Views, ViewModels, Services, Models)
- **Moderne Swift-Patterns**: async/await, @MainActor, Sendable-Konformität
- **Robuste Fehlerbehandlung** mit Retry-Logik und Exponential Backoff
- **Vollständige AR-Infrastruktur** mit RealityKit und ARWorldTrackingConfiguration
- **Duale Erkennungsmodi** für flexible Nutzung

**Herausforderungen gemeistert:**
- Threading-Probleme mit CoreLocation → Sendable-konforme Implementierung
- AR-Positionierung → ARPositionCalculator mit Bearing-Berechnung
- API-Daten-Mapping → Custom Codable für snake_case ↔ camelCase

**Ist das finale Ergebnis gefährdet?**
Nein. Die iterative Arbeitsweise hilft, Perfektionismusdruck zu reduzieren und Fortschritte sichtbar zu machen. Der Prototyp ist funktionsfähig und demonstriert alle Kernkonzepte.

---

## 3. Was kann ich zum nächsten Meilenstein vorzeigen?

### Funktionsfähiger AR-Prototyp mit folgenden Features:

**iOS App (ARLandmarks):**
- AR-Visualisierung mit POI-Spheres in der Kameraansicht
- Zwei Erkennungsmodi (Visual Recognition / Geo-Based)
- Landmark-Details mit Fotos, Öffnungszeiten, Kontaktdaten
- Wetter-Overlay mit aktuellen Zürich-Daten
- Kategorie-Filterung und Sortierung
- 5-seitige Onboarding-Sequenz
- Apple Maps Integration für Navigation

**Technische Dokumentation:**
- GitHub-Repository mit strukturiertem Code
- Lerntagebuch mit Entscheidungsdokumentation
- ML-Training-Pipeline mit ausführlichen Guides
- API-Sync-Skripte für Zurich Tourism Daten

**Admin-Dashboard:**
- Landmark-CRUD-Operationen
- Kategorieverwaltung
- Foto-Management
- API-Synchronisation

---

## 4. Wie entwickeln sich meine Soft Skills?

### Meine überfachlichen Kompetenzen entwickeln sich positiv:

| Kompetenz | Entwicklung | Beispiel |
|-----------|-------------|----------|
| **Selbstständige Recherche** | Stark verbessert | Intensive Nutzung der Apple-Dokumentation, WWDC-Sessions, Hacking with Swift |
| **Zeitmanagement** | Verbessert | Klare Wochenziele und tägliche Mini-Steps; Pufferwochen eingeplant |
| **Analytische Problemlösung** | Stark verbessert | Systematisches Debugging bei AR-Positionierung und Threading-Problemen |
| **Technische Dokumentation** | Verbessert | Ausführliche ML-Training-Guides, Code-Kommentare, README-Dateien |
| **Architektur-Denken** | Neu erworben | MVVM-Pattern, Service-Schicht, saubere Trennung von Concerns |

**Besondere Learnings:**
- Von Web-Development (JavaScript/TypeScript) zu Swift ist ein grosser Paradigmenwechsel
- AR-Entwicklung erfordert räumliches Denken und Verständnis für 3D-Koordinatensysteme
- Die Apple-Dokumentation ist umfangreich, aber sehr gut strukturiert
- Testing auf physischen Geräten ist bei AR unerlässlich

---

## 5. Nächste Schritte

### Kurzfristig (Lernlab):
1. E-Learning-Plan mit Peers und Expert:innen besprechen
2. Feedback einholen und Plan anpassen
3. Aufnahme-Setup testen

### Mittelfristig (bis Abgabe):
1. ML-Modell mit 3-10 Landmarks trainieren
2. E-Learning Screencast aufnehmen
3. Selbstkritische Reflexion nach Gibbs verfassen
4. Leaflet für Bewerbungsdossier finalisieren

### Langfristig (Major Project):
- Erkenntnisse aus ARLandmarks in AR Mikro-Navigation für Rollstuhlfahrer:innen übertragen
- Barrierefreie AR-Interfaces weiterentwickeln

---

## 6. Risiken und Mitigationen

| Risiko | Wahrscheinlichkeit | Mitigation |
|--------|-------------------|------------|
| ML-Training dauert länger | Mittel | Quickstart mit 3 Landmarks; parallele Arbeit möglich |
| Technische Probleme bei Aufnahme | Niedrig | Backup-Equipment bereit; Kapitelweise Aufnahme |
| Zeitdruck vor Abgabe | Niedrig | Pufferwochen eingeplant; priorisierte Features |

---

*Formative Prüfung zum ASP | Creative Studio 3: Research and Practice*
