#Zusammenfassung Modellbildung und Systemidentifikation
##Grundlagen
###Modellarten
* ARX
* TODO

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
### Dynamisch zeitdiskrete Systeme
Dynamische Modelle = ARX (autoregressive) Modelle
### Dynamisch zeitkontinuierliche Systeme
Ausgangspunkt: DGL
Problem: Ableitungen beschaffen

Lösung:
a) Finite Differenzen (Vorwärts/Rückwärtsdifferenz)
Störanfällig, Messrauschen wird verstärkt

b) Filterung von Ein- und Ausgangssignalen

Idee: Ausnutzen von Eigenschaften des Faltungsoperators

$d/dt( x(t) * g(t) ) = x(t) * d/dt(g(t))$ (g(t): Impulsantwort)

Zustandsvariablenfilter:

Ansatz:

$F(s) = \frac{f_0}{f_0+f_1 s + ... + s^n}$

Adaptives Zustandsvariablenfilter:

z.B. Butterworth-Filter

### Wann sind physikalische Parameter vollständig identifizierbar?
* np = n+m+1
Jacobi-Matrix \delta f / \delta p ist regulär
