# Testowanie typu zmiennoprzecinkowego

Testy zostały przeprowadzone przy pomocy frameworka RSpec napisanego w Rubym.
Aby umożliwić uruchomienie odpowiednich funkcji w C z poziomu tego języka,
napisany został moduł, który znajduje się w pliku `rtest.c`.
Dodana zostaje klasa `RTest`, która pozwala na tworzenie zmiennych, dostęp do
ich poszczególnych części (licznika, mianownika, itp.), operacje arytmetyczne,
porównywanie oraz konwersje do typów wbudowanych w język Ruby.
Konstruktor może tworzyć instancje klasy `RTest` i inicjalizuje je poszczególne
części liczby lub konwertując liczbę zmiennoprzecinkową.

Kod testów został napisany podobnie jak na poniższym przykładzie.

    describe "Rational" do
      it "should ..." do
        ...
      end

      describe "feature ..." do
        it "should ..." do
          ...
        end
      end

      ...

    end

Czyni to testy bardzo przejrzystymi, a dodatkowo poszczególne bloki
pozwalają tworzyć opisy zachowania kodu w języku angielskim, czego dobrym
przykładem jest opis: "Rational big values division should return correct value
within delta".

Testy mają na celu sprawdzić podstawowe operacje na liczbach w formacie rational
i jednocześnie porównać dokładność wyników z formatem zmiennoprzecinkowym
IEEE754. Obejmują one zakres działań na małych, średnich i dużych liczbach, a
także obsługę sytuacji nietypowych np. $\infty$ lub $-\infty$.

Wyniki testów wyglądają jak na listingu poniżej.

    Rational
      should create new object
      should return +infinity
      should return -infinity
      should return proper value
      should be comparable
      small values
        addition
          should return positive in result of addition of positive numbers
          should return zero in result of addition of opposite numbers
          should return negative in result of addition of negative numbers
        subtraction
          should return 0 when substracting equal positive values
          should return negative value when subtracting positive number from
              negative number
          should return positive value when subtracting negative number from
              positive number
          should return 0 when substracting equal negative values
        multiplication
          should return positive in result of multiplying positive values
          should return negative in result of multiplying values with opposite
              signs
          should return positive in result of multiplying negative values
        division
          should return positive when dividing two positive numbers
          should return negative when dividing two numbers with opposite
              signs
          should return positive when dividing two negative numbers
      average values
        addition
          should return positive in result of addition of positive numbers
          should return appropriate value when adding positive number to
              negative number
          should return appropriate value when adding negative number to
              positive number
          should return negative in result of addition of negative numbers
        subtraction
          should return appropriate value when subtracting positive numbers
          should return appropriate value when subtracting positive number
              from negative number
          should return appropriate value when subtracting negative number
              from positive number
          should return appropriate value when subtracting negative numbers
        multiplication
          should return appropriate value when multiplying two positive
              numbers
          should return appropriate value when multiplying positive number by
              negative number
          should return appropriate value when multiplying negative number by
              positive numbers
          should return appropriate value when multiplying two negative
              numbers
        division
          should return appropriate value when dividing two positive numbers
          should return appropriate value when dividing negative number by
              positive number
          should return appropriate value when dividing positive number by
              negative number
          should return appropriate value when dividing two negative numbers
      big values
        addition
          should return correct value within delta
        subtraction
          should return correct value within delta
        multiplication
          should return correct value within delta (FAILED - 1)
        division
          should return correct value within delta (FAILED - 2)

    Failures:

    1) Rational big values multiplication should return correct value within delta
       Failure/Error: (a*b).to_f.should be_within(@delta).of 21474836.0 * 1.0*i
         expected Infinity to be within 1/100000000 of 21474836000.0
       # ./spec/rational_spec.rb:283:in `block (5 levels) in <top (required)>'
       # ./spec/rational_spec.rb:281:in `step'
       # ./spec/rational_spec.rb:281:in `block (4 levels) in <top (required)>'

    2) Rational big values division should return correct value within delta
       Failure/Error: (a/b).to_f.should be_within(@delta).of 21474836.0 / 1.0*i
         expected 21474.836 to be within 1/100000000 of 21474836000.0
       # ./spec/rational_spec.rb:293:in `block (5 levels) in <top (required)>'
       # ./spec/rational_spec.rb:291:in `step'
       # ./spec/rational_spec.rb:291:in `block (4 levels) in <top (required)>'

    Finished in 4.42 seconds
    38 examples, 2 failures

Testy dla średnich wartości zostają zakończone poprawnie dla dokładności nie
większej niż $10^{-12}$, natomiast testy dla średnich liczb zostały
przeprowadzone z dokładnością $10^{-8}$. Pomimo zmniejszenia dokładności
porównywania wyników, niektóre z testów nie zakończyły się sukcesem.

