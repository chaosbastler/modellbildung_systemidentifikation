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

#3. Subspace-based State-Space System Identification (4 SID)
##3.1 Grundgleichungen, Zustandsraummodelle
Zustandsraummodell:

$x[k+1] = A x[x] + B u[k]$ - Folgezustand abhängig von aktuellem Zustand + Eingang

$y[k] = C x[k] + D u[k]$ - Ausgang abhängig von Zustand ü Eingang

Problem: Weder Zustandsfolge x[k] noch Zustandsdimension n bekannt

$\begin{pmatrix}y[0]\\y[1]\\...\\y[k-1]\end{pmatrix} = \begin{pmatrix}C\\C A\\C A^2 \\...\\C A^{k-1}\end{pmatrix} x[0] +
\begin{pmatrix}
D & 0 & ... & 0 \\
C B & D & ... & 0 \\
.... & ... & D & 0 \\
C A^{k-2} B & C A^{k-3} B & CB & D
\end{pmatrix} \begin{pmatrix}u[0]\\u[1]\\...\\u[k-1]\end{pmatrix}$

Bezeichnungen: $\begin{pmatrix}C\\C A\\C A^2 \\...\\C A^{k-1}\end{pmatrix} := Q_{B,k} = Beobachtbarkeitsmatrix$

TODO ...

### Subspace-Gleichungen
$Y_p = Q_{B,k} X_p + H_K U_p$

$Y_f = Q_{B,k} X_f + H_K U_f$

$X_f = A^k x_p + Q_{S,k} U_p$

mit $Q_{S,k} = (A^{k-1} B  \;   A^{k-2} B \;       A B \;  B)$ (erweiterte Steuerbarkeitsmatrix)


Durch Umformen/Einsetzten ergibt sich:

$X_f = ... $ (nur abhängig von Vergangenheit)

$Y_f = Q_{B-k} L_{P,k} (U_p \; y_p)^T + H_k U_f$

=> Für nächsten Ausgang Wissen der zukünftigen Eingabe erforderlich
###3.2 Grundlagen: Projektion
TODO

...


### Ablaufschema 4 SID
* Messdaten u[i], y[i] aufnehmen, in Hankelmatrizen U, Y anordnen
* Schiefen Prädiktor P berechnen
* SVD von P
(Schätzung der Systemordnung (Länge Zustandsvektor); Schätzung für Beobachtbarkeitsmatrix $Q_{B,k}$)
 * Berechnen von A, C
 * Berechnen von B, D

# Kalman-Filter
Modell:

x[k+1] = A x[k] + B u[k] + v[k]

y[k] = C x[k] + e[k]

## Annahmen
* Systemmatrizen A,B,C,D bekannt
* Eingang u[k], Ausgang y[k] bekannt
* Ziel: Zustandsvektor x[k] schätzen
* Systemrauschen v[k] und Messrauschen e[k]: unkorrelierte, mittelwertfreie Rauschprozesse

## Filterstruktur
$\hat{x}[k+1]$ = Prädiktionsterm + Korrekturterm = $( A \hat{x}[k] + B u[k] ) + (K[k] (y[k]-\hat{x}[x]))$

K[k]: Kalman-Matrix, so gewählt, dass Kovarianz von Schätzfehler $\tilde{x}[k+1] = \hat{x}[k+1] - x[k+1]$ minimiert wird


=> K[k] = P[k] C^T (Y- C P[k] C^T)^{-1}

P[k] = A P[k] A^T + V - K[k] C P[k]

Ergebnis: erwartungstreuer Schätzer mit kleinster Varianz

## Filteralgorithmus
* Init
* Prädiktion (Schätzung des Zustands auf Basis der Messwerte zum Zeitpunkt k)
* Korrektur (Berechnung der Kalman-Matrix, Korrektur der Zustandsschätzung anhand des neuen Messertes y[k+1]: a posteriori Schätzung)
