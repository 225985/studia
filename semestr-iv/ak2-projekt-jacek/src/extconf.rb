#!/usr/bin/env ruby

require 'mkmf'

RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

$CFLAGS << " -Wall -Wextra -Wconversion -Wmissing-prototypes -Wmissing-declarations -Wshadow -Wcast-align -Wwrite-strings -Wnested-externs -Winline -pedantic -std=gnu99"

dir_config '.'
create_makefile 'rtest'
