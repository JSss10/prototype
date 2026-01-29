# Selbstkritische Reflexion nach Gibbs
## Advanced Specialised Project (ASP)

**Jessica Schneiter** | BSc Web Development | SAE Institut Zürich
**Datum:** Januar 2026
**Projekt:** ARLandmarks – Kontextsensitive AR-Informationen für Zürich

---

## Das Gibbs-Reflexionsmodell

Die folgende Reflexion orientiert sich am Reflexionszyklus nach Graham Gibbs (1988), der sechs Phasen umfasst: Beschreibung, Gefühle, Bewertung, Analyse, Schlussfolgerung und Handlungsplan.

---

## 1. Beschreibung (Description)
*Was ist passiert?*

Im Rahmen meines Advanced Specialised Projects habe ich **ARLandmarks** entwickelt – eine iOS-Applikation, die Augmented Reality nutzt, um Sehenswürdigkeiten in Zürich kontextsensitiv darzustellen.

Als Web-Entwicklerin mit Fokus auf JavaScript/TypeScript habe ich mich bewusst für eine neue Technologie-Domäne entschieden: **Native iOS-Entwicklung mit Swift, ARKit und Machine Learning**.

Das Projekt umfasst:
- Eine iOS-App mit 21 Swift-Dateien (Views, ViewModels, Services, Models)
- Dual-Modus-Erkennung (Visual Recognition + Geo-Based)
- Integration von Supabase, OpenWeather und Zurich Tourism APIs
- Ein Next.js Admin-Dashboard
- Eine ML-Training-Pipeline für Landmark-Erkennung

Der Entwicklungsprozess erstreckte sich über mehrere Wochen mit iterativen Lernzyklen.

---

## 2. Gefühle (Feelings)
*Was habe ich gedacht und gefühlt?*

### Zu Beginn:
- **Überwältigung**: Die Menge an neuem Wissen (Swift, ARKit, RealityKit, Core ML) war einschüchternd
- **Unsicherheit**: Als Web-Entwicklerin in einer völlig neuen Umgebung fühlte ich mich wie eine Anfängerin
- **Neugier**: Die Möglichkeiten von AR faszinierten mich und trieben mich an

### Während der Entwicklung:
- **Frustration**: Besonders bei Threading-Problemen und AR-Positionierungsfehlern
- **Erfolgserlebnisse**: Jedes funktionierende Feature steigerte meine Motivation
- **Selbstzweifel**: Bei komplexen Problemen fragte ich mich, ob ich die richtige Wahl getroffen hatte

### Am Ende:
- **Stolz**: Auf einen funktionsfähigen Prototypen mit professioneller Architektur
- **Erleichterung**: Die steile Lernkurve gemeistert zu haben
- **Vorfreude**: Auf die Weiterentwicklung im Major Project

---

## 3. Bewertung (Evaluation)
*Was war gut? Was war schlecht?*

### Positiv:

| Aspekt | Bewertung |
|--------|-----------|
| **Architektur** | Saubere MVVM-Struktur mit klarer Trennung von Concerns |
| **Code-Qualität** | Moderne Swift-Patterns, Thread-Sicherheit, Error-Handling |
| **Dokumentation** | Ausführliche Guides für ML-Training und API-Integration |
| **Iterativer Ansatz** | Mini-Projekte ermöglichten sichtbare Fortschritte |
| **Technische Tiefe** | Von Setup bis funktionierender AR-App |

### Verbesserungswürdig:

| Aspekt | Bewertung |
|--------|-----------|
| **Zeitschätzung** | Unterschätzte Einarbeitungszeit für ARKit |
| **ML-Training** | Image Collection für Training noch nicht abgeschlossen |
| **Testing** | Mehr automatisierte Tests wären sinnvoll gewesen |
| **Scope Management** | Manchmal zu viele Features gleichzeitig angefangen |

---

## 4. Analyse (Analysis)
*Was bedeutet das? Warum ist es so gelaufen?*

### Erfolgsfaktoren:

**1. Strukturierter Lernansatz**
Die Entscheidung, mit Mini-Projekten zu arbeiten statt direkt das Endprodukt anzugehen, war entscheidend. Jeder kleine Erfolg (erste AR-Objekte platzieren, erste API-Abfrage, erster Service) baute Selbstvertrauen auf.

**2. Nutzung etablierter Ressourcen**
Die Apple-Dokumentation, WWDC-Sessions und Hacking with Swift bildeten ein solides Fundament. Anstatt wahllos zu googeln, konzentrierte ich mich auf qualitativ hochwertige Quellen.

**3. Architektur-First-Ansatz**
Die frühe Entscheidung für MVVM und eine Service-Schicht zahlte sich aus. Änderungen waren einfacher umzusetzen, und der Code blieb wartbar.

### Herausforderungen:

**1. Paradigmenwechsel von Web zu Native**
Swift ist keine dynamische Sprache wie JavaScript. Strenge Typisierung, optionals, und Concurrency-Patterns erforderten ein Umdenken.

**2. AR-spezifische Komplexität**
Die Kombination aus Kamera, GPS, Sensordaten und 3D-Rendering in Echtzeit war technisch anspruchsvoll. Debugging war schwieriger als bei Web-Anwendungen.

**3. Ressourcenbeschränkungen**
Der automatische Image-Download für ML-Training schlug fehl (403-Fehler). Dies erforderte eine Planänderung (manuelle Image Collection).

### Was hätte ich anders machen können?

- Früher mit dem ML-Training beginnen, um Puffer für technische Probleme zu haben
- Mehr Zeit für Testing einplanen
- Pair Programming oder Code Reviews organisieren

---

## 5. Schlussfolgerung (Conclusion)
*Was habe ich gelernt?*

### Fachliche Learnings:

1. **iOS-Entwicklung** ist strukturierter als Web-Entwicklung, aber die strikten Vorgaben (Typisierung, Lifecycle) führen zu robusterem Code.

2. **AR-Entwicklung** erfordert räumliches Denken und ein tiefes Verständnis für Koordinatensysteme, Sensordaten und Performance-Optimierung.

3. **Machine Learning** ist nicht nur Modell-Training, sondern vor allem Datenaufbereitung und Integration in die Produktions-Umgebung.

4. **Full-Stack-Denken** ist auch bei nativen Apps wichtig – Backend, Admin-Tools und Client müssen zusammenspielen.

### Persönliche Learnings:

1. **Frustrationstoleranz**: Steile Lernkurven sind temporär. Durchhalten lohnt sich.

2. **Scope Management**: Weniger ist oft mehr. Ein funktionierendes Kern-Feature ist besser als viele halbfertige.

3. **Dokumentation während der Arbeit**: Das Lerntagebuch half, Entscheidungen später nachzuvollziehen.

4. **Puffer einplanen**: Technische Probleme sind normal, nicht Ausnahme.

---

## 6. Handlungsplan (Action Plan)
*Was werde ich in Zukunft anders machen?*

### Für das Major Project (AR Mikro-Navigation):

| Bereich | Massnahme |
|---------|-----------|
| **Planung** | ML-Training früh starten; Puffer verdoppeln |
| **Testing** | Unit Tests von Anfang an schreiben |
| **Code Review** | Regelmässigen Austausch mit Peers organisieren |
| **Dokumentation** | Architektur-Entscheidungen (ADRs) festhalten |

### Für meine allgemeine Entwicklung:

1. **Neue Technologien**: Weiterhin bereit sein, Komfortzone zu verlassen
2. **Community**: Aktiver in iOS/AR-Communities teilnehmen (Stack Overflow, Swift Forums)
3. **Open Source**: Eigene Lösungen teilen, um Feedback zu bekommen
4. **Mentoring**: Wissen an andere Web-Entwickler:innen weitergeben, die AR lernen möchten

### Konkrete nächste Schritte:

1. E-Learning fertigstellen (Screencast-Tutorial)
2. ML-Modell mit mindestens 10 Landmarks trainieren
3. Erkenntnisse in Präsentation für summative Prüfung einarbeiten
4. ARLandmarks-Architektur als Basis für Major Project nutzen

---

## Fazit

Das ASP war eine intensive, aber lohnende Lernerfahrung. Der Wechsel von Web zu Native iOS/AR hat mein technisches Spektrum erheblich erweitert und mir gezeigt, dass strukturiertes Lernen auch komplexe neue Domänen erschliessbar macht.

Die grösste Erkenntnis: **Perfektionismus ist der Feind des Fortschritts**. Iteratives Arbeiten mit sichtbaren Zwischenergebnissen hält die Motivation hoch und macht Erfolge greifbar.

Das Projekt bildet eine solide Grundlage für mein Major Project und meine berufliche Spezialisierung in barrierefreier AR-Entwicklung.

---

*Selbstkritische Reflexion nach Gibbs | Creative Studio 3: Research and Practice*
*Advanced Specialised Project | Januar 2026*
