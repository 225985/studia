#!/usr/bin/env ruby
# W zadanym pliku regularnym dokonać formatowania tekstu tak,
# aby wszystkie linie były jak najbardziej wykorzystane
# (odpowiednie łamanie linii).
# Ilość znaków w linii podać jako parametr - w każdej linii ma sie znaleźć
# max $2 znaków (chyba ze istnieje pojedyncze słowo
# dłuższe niż $2 - nie wolno dzielić wyrazów).

if ARGV.size < 2
  puts "Usage: $0 FILE N"
  exit 1
end

n = ARGV[1].to_i
input = File.read(ARGV.first).split(" ")

output = []
s = ""

until input.empty?
  a = input.shift
  if (s + a).size < n
    s += a + " "
  else
    output << s
    s = a
  end
end

output << s

puts output

# test
#  lab9 λ ./zad1.rb data.txt 100
# Ruby is a dynamic, reflective, general-purpose object-oriented programming language that combines
# syntaxinspired by Perl with Smalltalk-like features. It was also influenced by Eiffel and Lisp.
# Rubywas first designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan. Ruby
# supportsmultiple programming paradigms, including functional, object oriented, imperative and
# reflective.It also has a dynamic type system and automatic memory management; it is therefore
# similarin varying respects to Smalltalk, Python, Perl, Lisp, Dylan, Pike, and CLU. The standard
# 1.8.7implementation is written in C, as a single-pass interpreted language. The language
# specificationsfor Ruby was developed by the Open Standards Promotion Center of the
# Information-TechnologyPromotion Agency (a Japanese government agency) for submission to the
# JapaneseIndustrial Standards Committee and then to the International Organization for
# Standardization.It was accepted as a Japanese Industrial Standard (JIS X 3017) in 2011[8] and an
# internationalstandard (ISO/IEC 30170) in 2012.[9] As of 2010, there are a number of complete or
# upcomingalternative implementations of Ruby, including YARV, JRuby, Rubinius, IronRuby, MacRuby,
# andHotRuby. Each takes a different approach, with IronRuby, JRuby, MacRuby and Rubinius providing
# just-in-timecompilation and MacRuby also providing ahead-of-time compilation. The official 1.9
# branchuses YARV, as will 2.0 (development), and will eventually supersede the slower Ruby MRI.
#
#
#  lab9 λ ./zad1.rb data.txt 4
# Ruby
# isa
# dynamic,
# reflective,
# general-purpose
# object-oriented
# programming
# language
# that
# combines
# syntax
# inspired
# by
# Perl
# with
# Smalltalk-like
# features.
# It
# was
# also
# influenced
# by
# Eiffel
# and
# Lisp.
# Ruby
# was
# first
# designed
# and
# developed
# in
# the
# mid-1990s
# by
# Yukihiro
# "Matz"
# Matsumoto
# in
# Japan.
# Ruby
# supports
# multiple
# programming
# paradigms,
# including
# functional,
# object
# oriented,
# imperative
# and
# reflective.
# It
# also
# has
# a
# dynamic
# type
# system
# and
# automatic
# memory
# management;
# it
# is
# therefore
# similar
# in
# varying
# respects
# to
# Smalltalk,
# Python,
# Perl,
# Lisp,
# Dylan,
# Pike,
# and
# CLU.
# The
# standard
# 1.8.7
# implementation
# is
# written
# in
# C,
# asa
# single-pass
# interpreted
# language.
# The
# language
# specifications
# for
# Ruby
# was
# developed
# by
# the
# Open
# Standards
# Promotion
# Center
# of
# the
# Information-Technology
# Promotion
# Agency
# (a
# Japanese
# government
# agency)
# for
# submission
# to
# the
# Japanese
# Industrial
# Standards
# Committee
# and
# then
# to
# the
# International
# Organization
# for
# Standardization.
# It
# was
# accepted
# asa
# Japanese
# Industrial
# Standard
# (JIS
# X
# 3017)
# in
# 2011[8]
# and
# an
# international
# standard
# (ISO/IEC
# 30170)
# in
# 2012.[9]
# As
# of
# 2010,
# there
# are
# a
# number
# of
# complete
# or
# upcoming
# alternative
# implementations
# of
# Ruby,
# including
# YARV,
# JRuby,
# Rubinius,
# IronRuby,
# MacRuby,
# and
# HotRuby.
# Each
# takes
# a
# different
# approach,
# with
# IronRuby,
# JRuby,
# MacRuby
# and
# Rubinius
# providing
# just-in-time
# compilation
# and
# MacRuby
# also
# providing
# ahead-of-time
# compilation.
# The
# official
# 1.9
# branch
# uses
# YARV,
# as
# will
# 2.0
# (development),
# and
# will
# eventually
# supersede
# the
# slower
# Ruby
# MRI.
