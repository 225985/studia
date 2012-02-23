# Wykorzystane narzędzia

\noindent Podczas tworzenia projektu oraz przeprowadzania testów wykorzystane zostały
następujące narzędzia:

* GNU Compiler Collection wersja 4.6,
* Ruby wersja 1.9.2 (patch level 180),
* RSpec wersja 2.6.


# Uruchamianie projektu

\noindent Aby uruchomić testy dla projektu należy zainstalować interpreter Ruby'ego w
wersji 1.9.2-p180 lub nowszej, przejść do katalogu `src` oraz wykonać
następujące polecenia:

    $ ruby extconf.rb #przygotowuje plik Makefile
    $ make

Następnie należy z głównego katalogu projektu uruchomić polecenia

    $ [sudo] gem update --system #instaluje najnowszą wersję RubyGems
    $ [sudo] gem install rspec -v 2.6.0
    $ rspec spec --format documentation


# Bibliografia

1. "Intel$^{\textsuperscript{\textregistered}}$ 64 and IA-32 Architectures
   Software Developer’s Manual Volume 1: Basic Architecture"
   \small{(http://www.intel.com/products/processor/manuals/)},
2. Janusz Biernat, "Architektura Komputerów", Oficyna Wydawnicza Politechniki
   Wrocławskiej, 2005,
3. Dokumentacja GCC 4.6 \small{(http://gcc.gnu.org/onlinedocs/gcc-4.6.0/gcc/)},
4. Dokumentacja RSpec \small{(http://rspec.info/)},
5. Ruby README.EXT \small{(http://rdoc.info/stdlib/core/1.9.2/frames/)}.

