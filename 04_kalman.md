\newpage

#4. Kalman-Filter
Ausgangspunkt: System mit Zustandsraummodell

$$
\begin{aligned}
x[k+1] &= A x[k] + B u[k] + v[k] \\
y[k] &= C x[k] + e[k]
\end{aligned}
$$

## 4.1 Grundannahmen
* Systemmatrizen A,B,C bekannt
* Eingang u[k], Ausgang y[k] bekannt
* Systemrauschen v[k] und Messrauschen e[k]: unkorrelierte, mittelwertfreie Rauschprozesse

### Ziel

Schätzung $\hat{x}[k]$ des Zustandsvektors $x[k]$

### Ansatz: Filterstruktur

$\hat{x}[k+1]$ = $\underbrace{ A \hat{x}[k] + B u[k] }_{\substack{\text{Prädiktionsterm}\\\text{``a priori Schätzung''}}} + \underbrace{K[k]}_{\substack{\text{Kalman-Matrix}\\\text{``Korrekturmatrix''}}} \underbrace{(y[k]-C\hat{x}[k])}_{\substack{\text{Korrekturterm}}}$

* Dieser Schätzer ist besonders gut, da erwartungstreu
* Kalman-Matrix so wählen, dass Kovarianz $P[k]$ von Schätzfehler $\tilde{x}[k+1] = \hat{x}[k+1] - x[k+1]$ minimiert wird

$$
\begin{aligned}
K[k] &= P[k] C^T (Y + C P[k] C^T)^{-1} \\
P[k+1] &= A P[k] A^T + V - K[k] C P[k]
\end{aligned}
$$

* V: Kovarianz des Systemrauschens
* Y: Kovarianz des Messrauschens (frei wählbar)

__Ergebnis__: erwartungstreuer Schätzer mit kleinster Varianz
\newpage 

## 4.2 Filteralgorithmus
1. Init: $\hat{x}[0]$ \& $P[0]$ (Anfangszustand aus phys. Vorwissen wählen oder 0 setzen)
2. Prädiktion/Zeitupdate: Schätzung des Zustands auf Basis der Messwerte bis Zeitpunkt k

$$
\begin{centering}
	\hat{x}^-[k+1]=A\hat{x}[k]+Bu[k]
\end{centering}
$$

3. Korrektur/Messupdate: Berechnung der neuen Kalman-Matrix, Korrektur der Zustandsschätzung anhand des neuen Messwertes $y[k+1]$ $\rightarrow$ a posteriori Schätzung

* Schritte 2. und 3. iterativ für alle Messwerte wiederholen bis Schätzung des internen Zustands konvergiert

## 4.3 Kalman-Filter als Parameterschätzer
Ausgangspunkt: statisches, parameterlineares Modell

$$y[k] = \varphi^T[k] a + e[k]$$

Modell als lineares Zustandsraummodell:
$$a[k+1] = a[k]$$ $\rightarrow$ interner Zustand = konstanter Parameter
$$y[k] = \varphi^T[k] a[k] + e[k]$$

Kalman-Filter entspricht in dieser Form der rekursiven MkQ

## 4.4 Extended Kalman-Filter

$$
\begin{aligned}
  x[k+1] &= \underbrace{f(x[k], u[k])}_{\text{nicht lin. Fkt.}} &+ v[k] \\
  y[k] &= \underbrace{h(x[k])}_{\text{nicht lin. Fkt.}} &+ e[k]
\end{aligned}
$$

- Linearisieren der Systemmatrizen A[k], B[k] und C[k] um geschätzen Zustand
- a posteriori Schätzung für Filteralgorithmus: $\hat{x}^-[k+1] = f(\hat{x}[k], u[k])$
- sonst wie im linearen Fall
