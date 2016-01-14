#Zusammenfassung Modellbildung und Systemidentifikation

##MkQ für Statische Systeme
### Parameterlineare Modelle
**Prinzip:** Kostenfunktion $\epsilon^T \cdot \epsilon$ definieren und minimieren (Variante: Gewichtete Kostenfunktion)

mit $\epsilon	 = \text{Messwert} - \text{Modell}$

$y=\phi \cdot p$

Mit Ableitung ergibt sich Lösung :

$p = (\phi^T \cdot \phi)^-1 \cdot \phi \cdot y = \phi^+ \cdot y$

Singulärwertzerlegung (SVD) kann für einfache Berechnung von $\phi^+$ genutzt werden:

$\phi = U \cdot \Sigma \cdot V^T  \rightarrow \phi^+ = V \cdot \Sigma^T  \cdot U^T$

### ParameterNICHTlineare Modelle
Ansatz wie bei parameterlinearen Modellen.

**Problem:** nichtlineare Gleichungen

**Lösung:** Linearisierung der Fehlergleichung

Verfahren:

* Gauß-Newton-Verfahren (gegf. mit Dämpfungsfaktor)
* Gradientenverfahren (line search)
* Levenberg-Marquardt-Algorithmus


## MkQ für Dynamische Systeme
