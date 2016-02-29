#Zusammenfassung Modellbildung und Systemidentifikation
#1. Grundlagen
##1.1 Norm
Motivation: Maß für Fehler ist notwendig

Eigenschaften:

* Abbildung von Vektor auf reelle Zahl
* $||x|| = 0 \leftrightarrow x = 0$
* $||\alpha \cdot x|| = |\alpha| \cdot ||x||$
* $||x+y|| \leq  ||x|| +||y||$

###Beispiele:

Euklische Norm (2-Norm): $||x||_2 = \sqrt{ \sum\limits_{i=1}^n x_i^2}$

Summennorm (Betragsnorm): $||x||_1 = \sqrt{ \sum\limits_{i=1}^n |x_i|}$

Maximumsnorm : $||x||_\infty = \max\limits_{i}^{} |x_i|$

###Matrixnormen

Matrixnorm heißt verträglich mit Vektornorm wenn:

$$||A \cdot x|| \leq ||A|| \cdot ||x|| $$ (A: Matrix, V: Vektor)

Durch Vektornorm induzierte Matrixnorm:

$$||A|| :=  \max\limits_{x \neq 0}^{}  \frac{||A \cdot x||}{||x||}$$ (A: Matrix, V: Vektor)

Bsp: Spektralnorm (induziert durch 2-Norm):
$$||A||_2 = \max  = \max\limits_{||x||_2 = 1}^{} ||A \cdot x|| = \sqrt{ \{ \lambda (A^T \cdot A)\}}$$

wobei $\lambda$ die Singulärwerte der Matrix A sind.

Bsp für nicht induzierte Norm: Frobenius-Norm:

$$||A||_F = \sqrt{trace(A^T \cdot A)}  $$

##1.2 Dynamische Systeme
* mind 1 Eingang, mind 1 Ausgang, enthält "Gedächtnis" (=Energiespeicher)
* **linear**, wenn Superpositionsprinzip gilt:
$$ G(\alpha_1 u_1 + \alpha_2 u_2 ) = \alpha_1 \cdot G \circ u_1 + \alpha_2 \cdot G \circ u_2 \text{ mit } \alpha_1, \alpha_2 \in \mathbb{R} $$
* **zeitinvariant**, wenn beliebige zeitl. Verschiebung von Eingangssignal entsprechende zeitl. Verschiebung am Ausgang bewirkt

* nicht-parametrische Modellierung: Sprungantwort, Impulsantwort, Frequenzgang

###1.2.1 Parametrische Modelle

#### Zustandsraumdarstellung aus physikalischem Modell
physikalische Modellierung $\rightarrow$ DGL (evtl. Linearisierung um Ruhelage) 

$\rightarrow$ Laplace-Transformation 

$G(s)=\frac{b_m s^m + b_{m-1} s^{m-1} + \dots}{s^n+a_{n-1} s^{n-1} + \dots}$

$\rightarrow$ Zustandsraummodell mit Systemmatrizen $A_c$ $B_c$ $C_c$

$A_c=$
$\begin{pmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
-a_0 & -a_1 & \dots & -a_{n-1}
\end{pmatrix}$
$B_c=$
$\begin{pmatrix}
0 \\
0 \\
\dots \\
1
\end{pmatrix}$
$C_c=$
$\begin{pmatrix}
b_0 & \dots & b_m & 0 & \dots & 0
\end{pmatrix}$

Abtastung liefert diskretes Modell:

$$x[k+1] = A_d x[k] + B_d u[k]$$
$$y[k]= C_d x[k]$$

Diskretisierung des zeitkontinuierlichen Modells über Berechnung der Systemmatrizen:

Annahmen:

* Abtastung zu Zeitpunkten $t=k*\Delta t$
* Stückweise konstantes Eingangssignal

$$A_d = e^{A_c \cdot \Delta t}$$
$$B_d = B_c \cdot \int\limits_{\tau}^{\Delta t} e^{A_c \cdot \tau} d \tau$$
$$C_d = C_c$$

##1.3 Modellarten

u(z) : Systemeingang,
v(z) : Fehler

### Klassifikation nach Störung

#### AR (autoregressives System)
$$y = \frac{1}{C(z)} \cdot v$$

#### MA (Moving Average)
$$y = D(z) \cdot v$$

#### ARMA (autoregressiv + moving average)
$$y = \frac{D(z)}{C(z)} \cdot v$$


#### ARX (autoregressive with external input)
$$y = \frac{B(z)}{A(z)} u + \frac{1}{A(z)} v$$

#### AR MAX (autoregressive with external input)
$$y = \frac{B(z)}{A(z)} u + \frac{D(z)}{A(z)} v$$

### Klassifikation nach determ. Eingang (Ausgangsfehler-Modell):

####FIR
$$y = B(z) u + v$$

####OE (output error)
$$y = \frac{B(z)}{A(z)} u + v$$

#### BJ (Box-Jenkins)
$$y(z) = \frac{B(z)}{A(z)} \cdot u +  \frac{D(z)}{C(z)} \cdot v $$
