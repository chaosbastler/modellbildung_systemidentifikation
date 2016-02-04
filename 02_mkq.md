\newpage
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
* $np = n+m+1$
* Jacobi-Matrix $\delta f / \delta p$ ist regulär

## Rekursive MkQ
Iterationsvorschrift -> siehe Skript

### Bestimmung der Startwerte
####Nutzung der nicht-rekursiven MkQ
####Wahl von Standardwerten

Startwertwahl von a_0 = 0 $P_0 = 1/\alpha I$ (I: Einheitsmatrix).
Dies führt für große Alpha zu $P_k \approx \phi_k^T \phi_k$

## Rekursive MkQ mit exponentiell nachlassendem Gedächtnis


## Rechentechnische Umsetzung der MkQ
TODO

## Identifikation nicht-linearer Systeme
**Hammerstein-Modell**:
nicht-linear statisches System + dynamisch lineares System

Einfacher Ansatz für nicht-Linearität:
$\widetilde{u}[k] = r_0 + r_1 \cdot u[k] + ... r_p \cdot {u[k]}^p$

Ergibt lineares Modell mit mehreren Eingängen, darstellbar in der Form $y[k] = \phi a$


##2.7 Modifikationen der MkQ
###2.7.1 Totale MkQ (orthogonale Regression)
Minimierung des Fehlers der Ausgangsdaten F und des Fehlers der Eingangsdaten $\epsilon$:

$y + \epsilon = (\Phi + F)a$

=> $[(\Phi y) + (F \epsilon)] \begin{pmatrix}a\\-1\end{pmatrix}$

=> Minimierung von $(F \epsilon)$ im Sinne der Frobeniusnorm.

###Einschub: Singulärwertzerlegung
Mann kann Matrizen unter gewissen Vorraussetzungen folgendermaßen zerlegen:

$C = U \Sigma V^T$

TODO

###2.7.2 Methode der Hilfsvariablen
Anwendung: bei verzerrten Schätzern (ARX-Modell nicht perfekt)

Prinzip: Multiplikation der Modellfehlergleichung mit sog. Hilfsvariablen:
$W^T \epsilon = W^T y - W^T \Phi a$

W ist so wählen, dass Spalten unkorreliert mit $\epsilon$ sind.

=> Lösung der modifizierten Normalengleichung: $a = (W^T \Phi)^-1 W^T y$

Wahl von W:

1. Schätzen von Parametervektor mit MkQ: $\hat{a} = \Phi^+ y$

2. Simulation des Models $\hat{y} = \Phi \hat{a}$

3. W = ... (siehe Skript)

4. Schätzung mittels Hilfsvariablen

Iteratives Wiederholen von 2-4 beseitigt Bias von MkQ Schätzer