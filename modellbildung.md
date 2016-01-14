#Zusammenfassung Modellbildung und Systemidentifikation

##MkQ für Statische Systeme
### Parameterlineare Modelle
Prinzip: Kostenfunktion e^T*e definieren und minimieren (Variante: Gewichtete Kostenfunktion)
mit e = Messwert - Modell
y=phi * p
Mit Ableitung ergibt sich Lösung :

$p = (phi^T * phi)^-1 * phi * y = phi^+ * y$

Singulärwertzerlegung (SVD) kann für einfache Berechnung von phi^+ genutzt werden:

$\phi = U \cdot \Sigma \cdot V^T  \rightarrow \phi^+ = V \cdot \Sigma^T  \cdot U^T$

### ParameterNICHTlineare Modelle

## MkQ für Dynamische Systeme
~~~~ {.haskell}
fibs = 1 : 1 : zipWith (+) (tail fibs) fibs
~~~~

Term 1
  ~ Definition 1
