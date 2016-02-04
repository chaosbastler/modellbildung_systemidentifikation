\newpage
#4. Kalman-Filter
Ausgangspunkt: System mit Zustandsraummodell

$$
\begin{aligned}
x[k+1] &= A x[k] + B u[k] + v[k] \\
y[k] &= C x[k] + e[k]
\end{aligned}
$$

## Annahmen
* Systemmatrizen A,B,C bekannt
* Eingang u[k], Ausgang y[k] bekannt
* Systemrauschen v[k] und Messrauschen e[k]: unkorrelierte, mittelwertfreie Rauschprozesse

## Ziel

Schätzung $\hat{x}[k]$ des Zustandsvektors $x[k]$

## Ansatz: Filterstruktur

$\hat{x}[k+1]$ = $\underbrace{ A \hat{x}[k] + B u[k] }_{\substack{\text{Prädiktionsterm}\\\text{``a priori Schätzung''}}} + \underbrace{K[k]}_{\substack{\text{Kalman-Matrix}\\\text{``Korrekturmatrix''}}} \underbrace{(y[k]-\hat{x}[k])}_{\substack{\text{Korrekturterm}}}$

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

## Filteralgorithmus
1. Init: $\hat{x}[0]$ \& $P[0]$ (Anfangszustand aus phys. Vorwissen wählen oder 0 setzen)
2. Prädiktion/Zeitupdate: Schätzung des Zustands auf Basis der Messwerte bis Zeitpunkt k

$$
\begin{centering}
	\hat{x}^-[k+1]=A\hat{x}[k]+Bu[k]
\end{centering}
$$

3. Korrektur/Messupdate: Berechnung der neuen Kalman-Matrix, Korrektur der Zustandsschätzung anhand des neuen Messwertes $y[k+1]$ $\rightarrow$ a posteriori Schätzung

* Schritte 2. und 3. iterativ für alle Messwerte wiederholen bis Schätzung des internen Zustands konvergiert

## Kalman-Filter als Parameterschätzer
