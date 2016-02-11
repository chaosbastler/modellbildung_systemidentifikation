\newpage
#6. Statistische Parameteridentifikation
##6.1 Maximum-Likelihood-Methode
###6.1.1 Grundgedanke
**bisher:** keine Annahme für Verteilungsfunktion der betrachteten Fehlersignale

**jetzt:** stochastische (meist normalverteilte) Fehlersignale mit bekannter Verteilung

Sei X eine Zufallsvariable mit Wahrscheinlichkeitsdichte $p(x,a)$ abhängig von Parameter a.
Wahrscheinlichkeit für Auftreten der Stichprobe $x_1, ... , x_N$:

$$L(a) = P(x_1,a) \cdot P(x_2,a) \cdot ... \cdot P(x_N,a)$$

Diese Funktion wird als **Likelihood-Funktion** bezeichnet.

**Maximum-Likelihood-Schätzung:** $\hat{a} = \text{arg} \underset{a}{\text{max}} L$

Einfacher zu analysieren: **Log-Likelihood-Funktion**

$$\ln(L(a)) = \ln(P(x_1,a)) + \ln(P(x_2,a)) + ... + \ln(P(x_N,a))$$

Ableitung liefert notwendige Bedingung für Maximum:

$$\frac{\partial(L)}{\partial{a}} = \sum\limits_{i=1}^N \frac{\partial \ln{p(x_i,a)}}{\partial{a}} \overset{!}{=} 0$$

###6.1.2 Maximum-Likelihood-Schätzer für statische Systeme
* statischer Prozess mit Eingang u, Ausgang y
* Likelihood-Funktion als bedingte Wahrscheinlichkeit p(y|u,a)

TODO
