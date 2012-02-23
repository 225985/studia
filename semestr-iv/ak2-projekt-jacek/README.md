# Requirements for building extension

* Ruby 1.9.2 (patch level 180)
* gcc >= 4.2
* rubygems >= 1.8.3 (for running tests)
* rspec >= 2.5.0 (for running tests)

# How to build

Change working directory to `src`, then run following commands

    ruby extconf.rb
    make

Built extension should be named `rtest.so` for Linux and `rtest.bundle` for Mac
OS X. You can omit `sed` command when you're using Mac OS X (tested on OSX
 10.6.5), cause optimizer breaks stuff only on Linux.

# How to run tests

First thing to do is updating rubygems (latest versions are sometimes buggy).

    [sudo] gem update --system

Then install RSpec testing framework.

    [sudo] gem install rspec

After that tests can be run by issuing following command from the main project
directory.

    rspec spec

# Building documentation

Building documentation requires installed `pandoc` and `pdflatex`. To build the
PDF run `rake` in `doc` directory.

# Credits

* Jacek Wieczorek
* Mateusz Lenik

