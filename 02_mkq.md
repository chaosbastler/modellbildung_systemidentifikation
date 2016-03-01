\newpage
#2. Methode der kleinsten Fehlerquadrate
Gegeben: Messdatenpaare, Modell $y = f(u,a)$

Ziel: Finde Parameter a, so dass $y_i \approx f(u_i,a)$ für Daten möglichst gut erfüllt wird

$\rightarrow$ Überbestimmtes Problem $\rightarrow$ Minimierung von Modellfehler $$\epsilon_i = y_i - f(u_i,a)$$

Gütekriterium: quadratischer Fehler$$L(a) = \sum \limits_{i=1}^{N} \epsilon_i^2 = \epsilon^T \cdot \epsilon$$

##2.1 MkQ für Statische Systeme
### Parameterlineare Modelle
**Prinzip:** Kostenfunktion $\epsilon^T \cdot \epsilon$ definieren und minimieren (Variante: Gewichtete Kostenfunktion)

mit $\epsilon	 = \text{Messwert} - \text{Modell}$

Gleichungssystem in Matrix-Form mit n Messwerten:

$\begin{pmatrix}
y_1 \\
\dots \\
y_n
\end{pmatrix} =
\begin{pmatrix}
\varphi^T(u_1) \\
\dots \\
\varphi^T(u_n)
\end{pmatrix}
\begin{pmatrix}
a_1 \\
\dots \\
a_n\\
\end{pmatrix}$

$y=\phi \cdot a$

Fehlerfunktion: $L(a) = \epsilon^T \epsilon = (y- \Phi a)^T (y- \Phi a) = y^T y - 2 y^T \Phi a + (\Phi a)^T \Phi a$

Partielle Ableitung nach a:
$L'(a) = - 2 y^T \Phi + 2 a^T \Phi^T \Phi \stackrel{!}{=} 0$

$$y^T \Phi = a^T \Phi^T \Phi$$
$$\Phi^T y = \Phi^T \Phi a$$

Gleichung umstellen ergibt Lösung :

$a = (\phi^T \cdot \phi)^{-1} \cdot \phi \cdot y = \phi^+ \cdot y$

Singulärwertzerlegung (SVD) kann für einfache Berechnung von $\phi^+$ genutzt werden:

$\phi = U \cdot \Sigma \cdot V^T  \rightarrow \phi^+ = V \cdot \Sigma^+  \cdot U^T$

mit $\Sigma^+ = diag(\frac{1}{\sigma_1},\frac{1}{\sigma_2},...,\frac{1}{\sigma_n}, 0, \dots ,0)$

### ParameterNICHTlineare Modelle
Ansatz wie bei parameterlinearen Modellen.

**Problem:** nichtlineare Gleichungen, Minimum nicht so einfach bestimmbar

**Lösung:** Linearisierung der Fehlergleichung (in jedem Iterationsschritt)

Statt $\epsilon$ wird $\epsilon + \Delta \epsilon$ minimiert:

$$\epsilon + \Delta \epsilon = \underbrace{y - f(u,a}_{\epsilon} \underbrace{- \frac{\partial f}{\partial a} (u,a \cdot \Delta a)}_{\Delta \epsilon}$$

#### Gauß-Newton-Verfahren (ggf. mit Dämpfungsfaktor)
* Iterationsvorschrift: $a_{i+1} = a_i + \Delta a_i = a_i + J_i^T (y-f(u,a_i))$
* keine gesicherte Konvergenz
* $\rightarrow$ mit Dämpfungsfaktor $\alpha$: $a_{i+1} =  a_i + \alpha J_i^T (y-f(u,a_i))$

#### Gradientenverfahren (line search)
* Iterationsvorschrift: $a_{i+1} = a_i + \alpha (\frac{\partial f}{\partial a} (u,a_i))^T \epsilon$
* $\alpha$ so wählen, dass L minimal wird

#### Levenberg-Marquardt-Algorithmus
* robuster als Gauß-Newton-Verfahren $\rightarrow$ Formel siehe Skript

\newpage
##2.2 MkQ für Dynamische Systeme    
###Dynamisch zeitdiskrete Systeme

* Dynamische Modelle = ARX (autoregressive) Modelle
* Differenzengleichung der Form:
$$y[k] = b_m u[k-m]+ b_{m-1} u[k-m+1] + \dots + b_{0} u[k] + \epsilon[k] - (a_n y[k-n] + \dots + a_1 y[k-1])$$
* (Sonderfall: FIR mit $y[k] = b_m u[k-m]+ b_{m-1} u[k-m+1] + \dots + b_{0} u[k]$; Spezialfall Output-Error Modell)
* Gleichungssystem in Matrix-Form:

$$
\underbrace{
\begin{pmatrix}
y[l] \\
y[l+1] \\
\dots \\
y[N-1]
\end{pmatrix}}_{Y_{N-1}} =
\underbrace{
\begin{pmatrix}
-y[l-1] & \dots & -y[l-n] & u[l] & \dots & u[l-m] \\
-y[k]   & \dots & -y[l-n+1] & u[l+1] & \dots & u[l-m+1]\\
\dots & \dots & \dots & \dots & \dots & \dots \\
-y[N-2]& \dots & -y[N-1-m] & u[N-1] & \dots & u[N-1-m] \\
\end{pmatrix}
}_{\Phi_{N-1}}
\underbrace{
\begin{pmatrix}
a_1 \\
\dots \\
a_n\\
b_1\\
\dots \\
b_m\\
\end{pmatrix}
}_{a_{N-1}}
+
\underbrace{
\begin{pmatrix}
e[l] \\
\\
\dots \\
\\
\\
e[N-1] \\
\end{pmatrix}
}_{\epsilon_{N-1}}
$$

$$Y_{N-1} = \Phi_{N-1} a_{N-1} + \epsilon_{N-1}$$

* Lösung (Minimierung von $\epsilon_{N-1}$):

$$a_{N-1} = \Phi_{N-1}^+ Y_{N-1} $$

##2.3 Dynamisch zeitkontinuierliche Systeme
Ausgangspunkt DGL:
$$y(kT) =
\begin{pmatrix}
-y'(kT) & \dots & -y^{(n)}(kT)  & u(kT) & \dots & u^{(m)}(kT)\\
\end{pmatrix}
\begin{pmatrix}
a_1^c \\
\dots \\
a_n^c \\
b_0^c \\
\dots \\
b_m^c \\
\end{pmatrix}$$

Problem: Ableitungen beschaffen

Beschaffung von Zeitableitungen:

a) Finite Differenzen (Vorwärts/Rückwärtsdifferenzenquotient)

* $y'(kT) \approx \frac{y(kT)-y((k-1)T)}{T}$
* $y'(kT) \approx \frac{y((k+1)T)-y(kT)}{T}$

Nachteil:
Störanfällig, Messrauschen wird verstärkt, schlecht geeignet für höhere Ableitungen

b) Filterung von Ein- und Ausgangssignalen

Idee: Ausnutzen von Eigenschaften des Faltungsoperators

$d/dt( x(t) * g(t) ) = x(t) * d/dt(g(t))$ (g(t): Impulsantwort)

Zustandsvariablenfilter mit Ansatz:

$F(s) = \frac{f_0}{f_0+f_1 s + ... + s^n}$

Adaptives Zustandsvariablenfilter

Iterationsvorschrift:

* Schätzung Nennerpolynom $\hat{a}$
* Anpassung der Filterkoeffizienten

z.B. Butterworth-Filter

### Wann sind physikalische Parameter vollständig identifizierbar?


* Anzahl physikalischer Parameter $n_p = n+m+1$ (Anzahl Modellparameter)
* Jacobi-Matrix $\partial f / \partial p$ ist regulär

\newpage

##2.5 Rechentechnische Umsetzung der MkQ

* Cholesky-Zerlegung von $\phi$ (in Dreiecksmatrizen) vereinfacht Lösung von $a=\Phi y$; nur ca. 50% Rechenaufwand im Vgl. zu Gauss
* Orthogonalisierungsverfahren, Konditionierung, QR-Zerlegung -> siehe Skript

###2.5.3 Rekursive MkQ

Herleitungsansatz: Ausgehend von $a_n$ ergibt sich mit der nächsten Messung $a_{n+1}$ und damit
$\Phi_{n+1} = \begin{pmatrix}
\Phi_N \\
\varphi_{N+1}^T
\end{pmatrix}$ $\rightarrow$ 2 Seiten Herleitung ergibt Iterationsvorschrift:

$$a_{N+1} = \underbrace{a_n}_{\text{vorheriger Parametervektor}} + \gamma_N(\underbrace{y[N+1]}_{\text{neuer Messwert}}- \underbrace{\Phi_{N+1}^T a_N}_{\text{vorhergesagter Ausgang}})$$

Vorteile der rekursiven MkQ:

- Matrix-Inversion gespart
- Rechenaufwand konstant, unabhängig von Menge der Daten
- Rechenaufwand geringer
- online implementierbar
- deutlich weniger Speicherbedarf (vorheriger Parametervektor, aktueller Messwert)

#### Wahl der Startwerte

a) Nicht-rekursive MkQ

Nachteile:

* Warten bis $N$ Werte vorhanden sind ($N > n+m+1$)
* $P_n^{-1}$ muss erst rechenaufwendig bestimmt werden

b) Wahl von Standardwerten $a_0 = 0$ und $P_0^{-1} = \alpha I$

###2.5.4 Rekursive MkQ mit exponentiell nachlassendem Gedächtnis
* mit Wichtungsmatrix
$$W_N = \begin{pmatrix}
\lambda^{N-1}  & & &\\
& \dots &  &\\
& &  \lambda &  \\
& &  & 1 \\
\end{pmatrix}$$

* ältere Messwerte beeinflussen aktuelle Schätzung immer weniger (werden 'vergessen')
* Ausgleich von Arbeitspunktwechsel oder Störungen

##2.6 Identifikation nicht-linearer Systeme
**Wiener-Modell**:
dynamisch lineares System + nicht-linear statisches System

###Hammerstein-Modell
- nicht-linear statisches System + dynamisch lineares System


Einfacher Ansatz für nicht-Linearität:
$\widetilde{u}[k] = r_0 + r_1 \cdot u[k] + ... r_p \cdot {u[k]}^p$

Ergibt lineares Modell mit mehreren Eingängen, darstellbar in der Form $y[k] = \phi a$:

```
              ___________
u^0 -> r_0 -> |B(z^-1)  |
u^1 -> r_1 -> |---/-----|---> Y
u^2 -> r_2 -> |A(z^-1)  |
u^p -> r_p -> |_________|

```

##2.7 Modifikationen der MkQ
###2.7.1 Totale MkQ (orthogonale Regression)
Minimierung des Fehlers der Ausgangsdaten $\epsilon$ und des Fehlers der Eingangsdaten F:

$y + \epsilon = (\Phi + F)a$
$\rightarrow$ $[\begin{pmatrix}\Phi & y\end{pmatrix} + \begin{pmatrix}F & \epsilon\end{pmatrix}] \begin{pmatrix}a\\-1\end{pmatrix} = 0$

=> Minimierung von Fehler $\begin{pmatrix}F & \epsilon\end{pmatrix}$ im Sinne der Frobeniusnorm

###Einschub: Singulärwertzerlegung
Man kann Matrizen unter gewissen Vorraussetzungen folgendermaßen zerlegen:

$$C = U \Sigma V^T$$

- Approximation von C durch "wegwerfen" von unteren Elementen aus $\Sigma$
- Anwendung: Kompression

###2.7.2 Methode der Hilfsvariablen
Anwendung: Beseitigung des Mittelwertes/Bias des Ausgangsfehlers

Prinzip: Multiplikation der Modellfehlergleichung mit sog. Hilfsvariablen:
$W^T \epsilon = W^T y - W^T \Phi a$

W ist so wählen, dass Spalten unkorreliert mit $\epsilon$ sind.

=> Lösung der modifizierten Normalengleichung: $a_N = (W^T \Phi)^{-1} W^T y$

Ablauf:

1. Schätzen von Parametervektor mit MkQ: $\hat{a} = \Phi^+ y$

2. Simulation des Models $\hat{y} = \Phi \hat{a}$

3. W = ... (siehe Skript)

4. Schätzung für $a_N$ mittels Hilfsvariablen (siehe modifizierte Normalengleichung)

Iteratives Wiederholen der Schritte 2-4
