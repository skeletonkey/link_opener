#!/usr/bin/perl -I .

use strict;
use warnings;

use LinkOpener;

my $link = $ARGV[0];

LinkOpener::update_link_count($link);