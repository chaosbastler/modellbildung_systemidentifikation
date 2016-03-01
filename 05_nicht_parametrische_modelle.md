\newpage
#5. Identifikation nichtparametrischer Modelle

##5.1 Frequenzgang mit period. Anregung

### Variante 1: Anregung mit harmon. Eingangssignal (Sinus)

* Nach Einschwingen: Amplitude + Phase messen
* Wiederholung für versch. Frequenzen

Problem: reine Sinusschwingungen schwierig zu erzeugen

### Variante 2: Anregung mit Trapez- oder Rechtecksignal

* Beginn bei hohen Frequenzen
* Bei kleineren Anregungsfrequenzen: Berücksichtigung der höheren harmonischen notwendig
* Aus vorherigen Messungen ist Übertragungsverhalten für hohe Frequenzen bekannt $\rightarrow$ Signalanteile können subtrahiert werden; somit wird Grundschwingung isoliert

Nachteil: zeitaufwendig, da Warten auf Einschwingen

Ausweg: Signale mit mehreren Freq uenzanteilen

Allgemeine Nachteile:

* nur stabile Systeme
* keine passive Messungen
* nur kleine Störsignale

##5.2 Korrelationsanalyse
###5.2.1 Schätzung der Korrelationsfunktion
Def. Kreuzkorrelationsfolge: $R_{u y}[j] = \lim\limits_{N \to \infty} \frac{1}{N} \sum \limits_{k=0}^{N-1} u[k-j] y[k]$

Def. Autokorrelationsfolge: $R_u[j] = R_{u u}[j] = \lim\limits_{N \to \infty} \frac{1}{N} \sum \limits_{k=0}^{N-1} u[k-j] u[k]$

Eigenschaften:

* $R_{u y}[j] = R_{y u}[-j]$
* $R_{u}[j] = R_{u}[-j]$

Problem: Messung nur über endlichen Zeithorizont $\rightarrow$ Schätzung

Schätzung der Autokorrelationsfolge:
$\hat{R}_{u}[j] =  \frac{1}{N} \sum \limits_{k=0}^{N-|j|-1} u[k-|j|] u[k]$

Bemerkung: Schätzung $\hat{R}_{u}[j]$ ist nicht erwartungstreu:
$E\{\hat{R}_{u}[j]\} = (1-\frac{|j|}{N})R_u[j]$

Andere Möglichkeit:
$\hat{R}_{u}'[j] =  \frac{1}{N-|j|} \sum \limits_{k=0}^{N-|j|-1} u[k-|j|] u[k]$

Dieser Schätzer ist erwartungstreu, weist aber eine um den Faktor $N/(N-|j|)$ größere Varianz auf -> Praktisch wird ersterer verwendet

###5.2.2 Schätzung der Gewichtsfolge / Impulsantwort
Für lineare zeitdiskrete Systeme sind Ein- und Ausgangssignal mittels Faltungssumme verknüpft:

$y[k] = g * u = \sum \limits_{l=0}^{\infty} g[k-l] u[l] = \sum \limits_{l=0}^{\infty} g[l] u[k-l]$

Für Kreuzkorrelationsfolge $R_{u y}[j]$ gilt:

$R_{u y}[j] = \dots \text{(siehe Skript)} = g * R_u = \sum \limits_{l=0}^{\infty} g[l] R_u[j-l]$


Annahme: $R_{u y}[j]$ und $R_u[j]$ bekannt für j mit $-P \leq j \leq M$

=> Gleichungssystem aufstellen (siehe Skript)

Lösung mittels MkQ liefert:

$\hat{g} = \hat{R}_u^+ \hat{R}_{u y}$

Falls Eingangssignal weißes Rauschen, dann folgt

$\hat{g}[i] = \frac{1}{\hat{\sigma}^2}  \hat{R}_{u y}[i]$

\newpage

###5.2.3 Parameterschätzung für Differenzengleichungen
- ermöglicht Schätzung der Parameter ohne aktive Anregung des Systems

Ausgangspunkt Differenzengleichung:
$$ a_n y[k-n] + a_{n-1} y[k-(n-1)] + ... + y[k] = b_m u[k-m] + ... + b_0 u[k]$$

Darstellung mit Hilfe der Korrelationsfunktionen:
$$\hat{R}_{uy}[j] = \begin{pmatrix} -\hat{R}_{uy}[j-1] & \dots & -\hat{R}_{uy}[j-n] & \vline & \hat{R}_{u}[j] & \dots & \hat{R}_{u}[j-m]  \end{pmatrix} \begin{pmatrix} a_1\\ \dots \\a_n \\ \hline b_0\\ \dots \\b_n \end{pmatrix} $$

Für $j=n, n+1, ...$ ergibt sich überbestimmtes Gleichungssystem

$\rightarrow$ lösbar mittels MkQ


##5.3 Parameterschätzung aus nicht parametrischen Modellen

### Momentenmethode
Entwicklung von $G(s) = \int_{0}^{\infty} g(t) e^{-st} dt$ in Taylor-Reihe:

$$G(s) = ... = \underbrace{\int_{0}^{\infty} g(t) dt}_{M_0}  - s \underbrace{\int_{0}^{\infty} g(t) \cdot t dt}_{M_1} + \frac{s^2}{2} \underbrace{\int_{0}^{\infty} g(t) \cdot t^2 dt}_{M_2} + \dots$$


$$G(s) = \sum_{k=0}^{\infty} \frac{-1^k}{k!} M_k s^k$$

$M_k = \int_{0}^{\infty} g(t) \cdot t^k dt$ sind experimentell oder numerisch zu bestimmen.

=> Gleichsetzen von Taylor-Reihe mit $G(s) = \frac{B(s)}{A(s)}$ ermöglicht Koeffizientenvergleich

##5.4 Testsignale
###5.4.1 Pseudo-Rausch-Binär-Signale

Beim Erzeugen von Testsignalen sind binäre Signale zu bevorzugen.

Diskretes binäres Rauschsignal (DRBS):
regelloser Wechsel zwischen Werten +a und -a zu diskreten Zeitpunkten kT

Zeitdiskrete Autokorrelationsfolge

$$R_u[k] = \begin{cases}
a^2 & k=0 \\
0 & sonst
\end{cases}$$

(gleiche AKF wie diskretes weißes Rauschen mit beliebiger Amplitude)

Für endl. Meßzeit ändert sich die AKF, d.h. sie muss im Einzelfall ermittelt werden

$\rightarrow$ Übergang zu periodischen Signalen (also deterministisch), die eine ähnliche AKF besitzen (**Pseudo-Rausch-Binär-Signal PRBS**)

- Erzeugung durch (mit XORs) rückgekoppelte Schieberegister
- für Rückkopplung bestimmter Stufen erfolgt Durchlaufen aller $2^n-1$ Belegungen des Registers bevor sich eine Belegung wiederholt
- Periodenlänge: $(2^n-1)$
- Mittelwert: $\frac{N+1}{2} \cdot a - \frac{N-1}{2} \cdot a= \frac{a}{N}$
- Autokorrelationsfolge: $R_u[k] = \begin{cases}
a^2 & k=0, \pm N, \pm 2N \\
-\frac{a^2}{N} & sonst
\end{cases}$
