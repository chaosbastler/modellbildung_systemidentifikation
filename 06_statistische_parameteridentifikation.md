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

Für parameterlineare Systeme der Form $y_i = \Phi(u_i) \cdot a + \epsilon_i$
mit normalverteiltem, mittelwertfreiem Fehler $\epsilon_i$ mit Standardabweichung $\sigma_\epsilon$
berechnet sich die Wahrscheinlichkeit des Auftretens der Folge $\epsilon_1, \epsilon_2, ..., \epsilon_N$ zu:

$$P(\epsilon) = \frac{1}{\sqrt{2 \pi \sigma_{\epsilon}^2} } exp(-\frac{\epsilon^T \epsilon}{2 \sigma_{\epsilon}^2})$$

Es wird nun die Wahrscheinlichkeit des Auftretens der Abweichung $\epsilon = y - \Phi u$ maximiert.

Log-Likelihood-Funktion:

$$\ln L = \ln [\frac{1}{(2 \pi \sigma_{\epsilon}^2)^{N/2}} \cdot \exp(- \frac{(y-\Phi a)^T (y-\Phi a)}{2 \sigma_\epsilon^2}) ]$$

$$\ln L =  - \frac{N}{2} \ln(2 \pi \sigma_{\epsilon}^2) -  \frac{1}{2 \sigma_\epsilon^2} (y-\Phi a)^T (y-\Phi a)$$

Ableiten liefert:

$$\frac{\partial \ln L}{\partial a} = \frac{1}{\sigma_\epsilon^2} (y-\Phi a)^T \Phi \overset{!}{=} 0$$



Gleichung auflösen:
$$y^T \Phi = a^T \Phi^T \Phi$$
$$\Phi^T y = \Phi^T \Phi a$$
$$\hat{a} = (\Phi^T \Phi)^{-1} \Phi^T y$$

MLE liefert also für normalverteilte Fehler den gleichen Schätzer wie MkQ!

###6.1.3 Maximum-Likelihood-Schätzer für dynamische Systeme

- MkQ: ARX-Modell
- ML: ARX-MAX-Modell? (Allgemeiner)

###6.2 Bayes-Methode
-> auch Prozessparameter a als stoch. Größe modelliert

Bayes-Methode <-> MLE <-> MkQ

<--------------   Allgemeiner

---------------> weniger Rechenaufwand
