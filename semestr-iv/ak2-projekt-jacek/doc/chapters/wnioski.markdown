# Wnioski

Format zmiennoprzecinkowy rational jest nietypowym rozwiązaniem. Operacje na
ułamkach prostych, intuicyjne dla każdego człowieka, po zaimplementowaniu
algorytmów przestają być wygodne. Stosunkowo łatwe mnożenie i dzielenie nie
rekompensuje trudności związanych z dodawaniem i odejmowaniem. W porównaniu do
algorytmów wykorzystywanych w standardzie IEEE754 są nieefektywne i niewygodne.
Kolejną wadą nowego typu zmiennoprzecinkowego jest zakres liczb, które można
w nim zapisać. Maksymalna wartość, jaką możemy zapisać na 31 bitach licznika
bądź mianownika to $2147483647$, jest nieporównywalnie mniejsza od zakresu
formatu zmiennoprzecinkowego podwójnej precyzji zapisanego na takiej samej
liczbie bajtów jak typ `rational`. Następną niedogodnością napotkaną podczas
użytkowania nowego formatu jest szybka utrata precyzji. Optymalny zakres
licznika i mianownika, dla których `rational` nie traci precyzji w porównaniu
do typu `double` lub `float` ograniczony jest do około $15$-$16$ bitów. De facto
ta sama wartość liczby może być zapisana na bardzo wiele sposobów, co powoduje,
że liczba użytecznych wartości drastycznie spada. Dodatkowo najwięcej
powtarzających się wartości znajduje się w okolicy liczby $0$.
Powyżej, szczególnie dla operacji mnożenia, dzielenia następuje szybkie
przekroczenie założonych granic. Pociąga to za sobą proces normalizacji,
który w przypadku, gdy licznik jest dużo większy niż mianownik najczęściej
prowadzi do zwrócenia nieskończoności, a w sytuacji licznik jest dużo mniejszy
niż mianownik -- $0$. Gdy utrata precyzji jest zbyt duża, zwracany jest `NaN`.
Wśród wielu wad typu rational, udało nam się zaobserwować jedną istotną zaletę.
Format ten umożliwia zapisanie liczb, których nie da się zapisać w systemie
dwójkowym bez utraty dokładności. Przykładem takiej liczy jest $\frac{1}{10}$.
Ponadto, jeśli rozmiar poszczególnych części liczby nie byłby ograniczony, to w
takim formacie istniałaby możliwość zapisania dowolnej wartości, lecz to
rozwiązanie wprowadza dodatkowe trudności podczas implementacji i prowadzi do
bardzo dużego spadku wydajności obliczeń, które nawet w przedstawionej wersji
są dość złożone.

