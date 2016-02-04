#5. Identifikation nichtparametrischer Modelle

##5.1 Frequenzgang mit period. Anregung

### Variante 1: Anregung mit harmon. Eingangssignal (Sinus)

* Nach Einschwingen: Amplitude + Phase messen
* Wiederholung für versch. Frequenzen

Problem: reine Sinusschwingungen schwierig zu erzeugen

### Variante 2: Anregung mit Trapez- oder Rechtecksignal

* Beginn bei hohen Frequenzen
* Bei kleineren Anregungsfrequenzen: Berücksichtigung der höheren harmonischen notwendig
* Aus vorherigen Messungen ist Übertragungsverhalten für hohe Frequenzen bekannt -> Signalanteile können subtrahiert werden; somit wird Grundschwingung isoliert

Nachteil: zeitaufwendig, da warten auf Einschwingen

Ausweg: Signale mit mehreren Frequenzanteilen

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

Problem: Messung nur über endlichen Zeithorizont => Schätzung

Schätzung der Autokorrelationsfolge:
$\hat{R}_{u}[j] =  \lim\limits_{N \to \infty} \frac{1}{N} \sum \limits_{k=0}^{N-|j|-1} u[k-|j|] u[k]$

Bemerkung: Schätzung $\hat{R}_{u}[j]$ ist nicht erwartungstreu:
$E\{\hat{R}_{u}[j]\} = (1-\frac{|j|}{N})R_u[j]$

Andere Möglichkeit:
$\hat{R}_{u}'[j] =  \lim\limits_{N \to \infty} \frac{1}{N-|j|} \sum \limits_{k=0}^{N-|j|-1} u[k-|j|] u[k]$

Dieser Schätzer ist erwartungstreu, weist aber eine um den Faktor $N/(N-|j|)$ größere Varianz auf -> Praktisch wird ersterer verwendet

##5.2.2 Schätzung der Gewichtsfolge
Für lineare zeitdiskrete Systeme sind Ein- und Ausgangssignal mittels Faltungssumme verknüpft:

$y[k] = g * u = \sum \limits_{l=0}^{\infty} g[k-l] u[l] = \sum \limits_{l=0}^{\infty} g[l] u[k-l]$

Für Kreuzkorrelationsfolge $R_{u y}[j]$ gilt:

$R_{u y}[j] = \dots \text{(siehe Skript)} = g * R_u = \sum \limits_{l=0}^{\infty} g[l] R_u[j-l]$


Annahme: $R_{u y}[j]$ und $R_u[j]$ bekannt für j mit $-P \leq j \leq M$

=> Gleichungssystem aufstellen (siehe Skript)

Lösung mittels MkQ liefert:

$\hat{g} = \hat{R}_u^+ \hat{R}_{u y}$

Falls Eingangssignal weißes Rauschen mit Autokorrelationsfunktion

...

Dann folgt:

$\hat{R}_{u y} = \hat{\sigma}^2 g[i]$

=> Schätzung für Gewichtsfolge: $\hat{g}[i] = \frac{1}{\hat{\sigma}^2}  \hat{R}_{u y}$

##Parameterschätzung für Differenzengleichungen
