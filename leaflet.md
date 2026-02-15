# AR Landmarks Zurich – Leaflet

Texte für das Leaflet-Layout – ergebnisorientiert, mit expliziten Lernzyklen und gebündelter Reflexion.

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

AR Landmarks Zurich ist eine iOS-App, die Zürcher Sehenswürdigkeiten in Echtzeit über die Kamera erkennt und kontextbezogene Informationen als Augmented-Reality-Overlay einblendet (Azuma, 1997). Im Gegensatz zu GPS-basierten Reiseführer-Apps setzt AR Landmarks auf visuelle Erkennung durch maschinelles Lernen – ein Ansatz, der laut Cao et al. (2023) zunehmend an Bedeutung gewinnt. Das Projekt umfasst drei Komponenten: die iOS-App, ein Web-Dashboard zur Datenverwaltung und eine ML-Training-Pipeline.

---

### Iteratives Vorgehen & Lernerfolge (rechts mitte)

**ML-Modell: Drei Iterationszyklen bis zum Ergebnis**

Das Erkennungsmodell durchlief drei klar abgegrenzte Iterationszyklen:

*Zyklus 1 – Baseline:* Erster Trainingsversuch mit MobileNetV3-Small (Howard et al., 2019) und Transfer Learning (Pan und Yang, 2010) auf 20–50 Bildern pro Landmark. Ergebnis: ~60% Genauigkeit. Erkenntnis: Die Trainingsdaten waren zu wenig divers.

*Zyklus 2 – Data Augmentation:* Einführung von automatisierten Bildtransformationen (Spiegelungen, Rotationen, Farbverschiebungen) in der PyTorch-Pipeline. Ergebnis: Genauigkeit stieg auf ~70%. Erkenntnis: Augmentation verbessert die Generalisierung deutlich, aber Verwechslungen bei ähnlichen Gebäuden blieben.

*Zyklus 3 – Fine-Tuning & Evaluation:* Systematische Anpassung von Lernrate, Epochenzahl und Dropout. Analyse der Confusion Matrix zur gezielten Verbesserung. Ergebnis: 75%+ Genauigkeit bei <50 ms Inferenzzeit auf dem iPhone.

**iOS-App: Vom Prototyp zur modularen Architektur**

Die App startete als einfacher Kamera-View mit ML-Erkennung. Durch iterative Erweiterung entstand eine modulare MVVM-Architektur mit getrennten Services für Datenbank, Vision, Wetter-API, Standort und AR-Positionierung. Die Landmark-Erkennung läuft vollständig On-Device über Core ML (Apple Inc., 2024a), die AR-Darstellung nutzt ARKit (Apple Inc., 2024b). Besonders herausfordernd war die korrekte räumliche Positionierung der Overlays – ein Problem, das ich durch schrittweises Testen an verschiedenen Standorten und Lichtverhältnissen iterativ löste.

**Web-Dashboard & Backend**

Das Dashboard (Next.js, React, TypeScript) und das Supabase-Backend (PostgreSQL, OAuth, RLS) wurden parallel zur App entwickelt (Supabase, 2024). Die Datenverwaltung für 108 Zürcher Sehenswürdigkeiten entstand schrittweise: erst manuelle Einträge, dann API-Synchronisation mit Zurich Tourism, schliesslich Bild-Upload und -Verwaltung.

---

### Statistiken-Leiste

108 Zürcher Wahrzeichen | 75%+ Modellgenauigkeit | < 50 ms Erkennungszeit | 2 AR-Modi

---

## SEITE 2

---

### Das Medienprodukt (links oben)

AR Landmarks Zurich besteht aus drei Komponenten:

**iOS-App** (Swift, SwiftUI, Core ML, ARKit) – Erkennung und AR-Darstellung von Zürcher Sehenswürdigkeiten in Echtzeit auf dem iPhone.

**Web-Dashboard** (Next.js, React, TypeScript) – Verwaltung der 108 Landmarks mit Bildern, Beschreibungen und Metadaten.

**ML-Pipeline** (Python, PyTorch) – Training des MobileNetV3-Klassifikationsmodells mit Transfer Learning, Data Augmentation und Konvertierung ins Core-ML-Format.

Das Projekt geht über die Inhalte der SAE-Diplomastufe hinaus und greift einen Trend auf, den Le et al. (2021) als vielversprechend für den mobilen Einsatz von ML und AR bewerten.

---

### Reflexion: Was ich gelernt habe – und wie (links unten)

Dieses Projekt war mein erster durchgängiger Entwicklungszyklus von der Datensammlung über das ML-Training bis zur nativen iOS-App. Drei zentrale Erkenntnisse:

**1. Iteratives Arbeiten ist keine Methode, sondern eine Notwendigkeit.**
Kein Teilsystem funktionierte beim ersten Versuch wie geplant. Das ML-Modell brauchte drei Trainingszyklen, die AR-Positionierung erforderte wiederholtes Testen vor Ort, das Dashboard wuchs mit den Anforderungen der App. Ich habe gelernt, Zwischenergebnisse systematisch zu evaluieren und daraus die nächsten Schritte abzuleiten – statt auf ein fertiges Konzept zu warten.

**2. Theorie wird erst durch Anwendung greifbar.**
Transfer Learning (Pan und Yang, 2010) und AR-Konzepte (Azuma, 1997) kannte ich aus der Literatur. Erst die praktische Umsetzung – warum eine bestimmte Lernrate versagt, wie Lichtverhältnisse die Erkennung beeinflussen – hat das Wissen verankert.

**3. Full-Stack heisst, Schnittstellen zu denken.**
Die grösste Herausforderung war nicht die einzelne Technologie, sondern das Zusammenspiel: Wie kommen Trainingsdaten vom Dashboard ins Modell? Wie wird ein Core-ML-Modell in die App integriert? Diese Schnittstellenkompetenz betrachte ich als den wichtigsten Lernerfolg.

---

### Erworbene Fachkompetenzen (rechts oben, 4 Boxen)

**Mobile App-Entwicklung**
Native iOS-Entwicklung mit Swift und SwiftUI, Integration von ARKit für Augmented Reality und Core ML für On-Device Machine Learning.

**Backend & Datenbanken**
Full-Stack-System mit Supabase (PostgreSQL, OAuth, RLS), API-Synchronisation und serverseitiger Datenverwaltung via Next.js.

**Machine Learning**
MobileNetV3-Klassifikationsmodell mit Transfer Learning in PyTorch, Data Augmentation, Hyperparameter-Tuning und Core-ML-Konvertierung.

**Iterative Entwicklung**
Systematische Evaluation von Zwischenergebnissen, datengetriebene Entscheidungsfindung und schrittweise Optimierung über mehrere Entwicklungszyklen.

---

### Im Leaflet zitierte Quellen (rechts mitte)

Apple Inc. (2024a) *Core ML*. Available at: https://developer.apple.com/documentation/coreml (Accessed: 15 February 2026).

Apple Inc. (2024b) *ARKit*. Available at: https://developer.apple.com/documentation/arkit (Accessed: 15 February 2026).

Azuma, R.T. (1997) 'A survey of augmented reality', *Presence: Teleoperators and Virtual Environments*, 6(4), pp. 355-385. Available at: https://doi.org/10.1162/pres.1997.6.4.355 (Accessed: 15 February 2026).

Cao, J., Lam, K.-Y., Lee, L.-H., Liu, X., Hui, P. and Su, X. (2023) 'Mobile augmented reality: user interfaces, frameworks, and intelligence', *ACM Computing Surveys*, 55(9), article 189, pp. 1-36. Available at: https://doi.org/10.1145/3557999 (Accessed: 15 February 2026).

Howard, A., Sandler, M., Chu, G., Chen, L.-C., Chen, B., Tan, M., Wang, W., Zhu, Y., Pang, R., Vasudevan, V., Le, Q.V. and Adam, H. (2019) 'Searching for MobileNetV3', *Proceedings of the IEEE/CVF International Conference on Computer Vision (ICCV)*, pp. 1314-1324. Available at: https://doi.org/10.1109/ICCV.2019.00140 (Accessed: 15 February 2026).

Le, H., Nguyen, M., Yan, W.Q. and Nguyen, H. (2021) 'Augmented reality and machine learning incorporation using YOLOv3 and ARKit', *Applied Sciences*, 11(13), 6006. Available at: https://doi.org/10.3390/app11136006 (Accessed: 15 February 2026).

Pan, S.J. and Yang, Q. (2010) 'A survey on transfer learning', *IEEE Transactions on Knowledge and Data Engineering*, 22(10), pp. 1345-1359. Available at: https://doi.org/10.1109/TKDE.2009.191 (Accessed: 15 February 2026).

Supabase (2024) *Supabase documentation*. Available at: https://supabase.com/docs (Accessed: 15 February 2026).

---

### Weitere im Projekt verwendete Quellen (rechts unten)

Apple Inc. (2024) *Create ML*. Available at: https://developer.apple.com/documentation/createml (Accessed: 15 February 2026).
Verwendet zum Vergleich mit der eigenen PyTorch-Pipeline; Create ML wurde zugunsten grösserer Flexibilität nicht eingesetzt.

Apple Inc. (2024) *SwiftUI*. Available at: https://developer.apple.com/documentation/swiftui (Accessed: 15 February 2026).
Primäre Referenz für die deklarative UI-Entwicklung der iOS-App.

Plested, J., Phiri, L. and Gedeon, T. (2022) 'Deep transfer learning for image classification: a survey', *arXiv preprint arXiv:2205.09904*. Available at: https://arxiv.org/abs/2205.09904 (Accessed: 15 February 2026).
Diente der Evaluation von Feature Extraction vs. Fine-Tuning im Kontext des Projekts.

PyTorch (2024) *PyTorch documentation*. Available at: https://pytorch.org/docs/stable/ (Accessed: 15 February 2026).
Zentrale Dokumentation für das Modelltraining mit torchvision.models.

Vercel (2024) *Next.js documentation*. Available at: https://nextjs.org/docs (Accessed: 15 February 2026).
Referenz für das Web-Dashboard mit Next.js App Router und Server Components.
