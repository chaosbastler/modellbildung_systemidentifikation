#Zusammenfassung Modellbildung und Systemidentifikation
##Grundlagen
###Norm
Motivation: Maß für Fehler ist notwendig

Eigenschaften:

* Abbildung von Vektor auf reele Zahl
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

##Dynamische Systeme
* mind 1 Eingang, mind 1 Ausgang, enthält "Gedächtnis" (=Energiespeicher)
* **linear**, wenn Superpositionsprinzip gilt:
$$ G(\alpha_1 u_1 + \alpha_2 u_2 ) = \alpha_1 \cdot G \circ u_1 + \alpha_2 \cdot G \circ u_2 \text{ mit } \alpha_1, \alpha_2 \in \mathbb{R} $$
* **zeitinvariant**, wenn beliebige zeitl. Verschiebung von Eingangssignal entsprechende zeitl. Verschiebung am Ausgang bewirkt

* nicht-parametrische Modellierung: Sprungantwort, Impulsantwort, Frequenzgang

### Parametrische Modelle
physikalische Modellierung => DLG => Laplace-Transformation => Zustandsraummdell mit Systemmatrizen

Abtastung liefert diskretes Modell:

$$x[k+1] = A x[k] + B u[k]$$
$$y[k]= C x[k]$$

Berechnung der Systemmatrizen aus zeitkontinuierlichen Modell:
$$A_D = e^{A^C \cdot \Delta t}$$
$$B_D = B^C \cdot \int\limits_{\tau}^{\Delta t} e^{A^C \cdot \tau} d \tau$$
$$C_D = C^C$$

\newpage
##Modellarten

u(z) : Systemeingang,
v(z) : Fehler
### Klassifikation nach Störung

#### AR (autoregressives System)
$$y = \frac{1}{C(z)} \cdot v$$

#### MA (Moving Average)
$$y = D(z) \cdot v$$

#### ARMA
$$y = \frac{D(z)}{C(z)} \cdot v$$


#### ARX (autoregressive with external input)
$$y = \frac{B(z)}{A(z)} u + \frac{1}{A(z)} v$$

#### AR MAX (autoregressive with external input)
$$y = \frac{B(z)}{A(z)} u + \frac{D(z)}{A(z)} v$$

### Klassifikation nach determ. Eingang (Ausgangsfehler-Modell):

####Fir
$$y = B(z) u + v$$

####OE (output error)
$$y = \frac{B(z)}{A(z)} u + v$$

#### BJ (Box-Jenkins)
$$y(z) = \frac{B(z)}{A(z)} \cdot u +  \frac{D(z)}{C(z)} \cdot v $$
