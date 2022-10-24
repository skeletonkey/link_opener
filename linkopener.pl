#!/usr/bin/perl -I .

use strict;
use warnings;

use LinkOpener;

# https://www.alfredapp.com/help/workflows/inputs/script-filter/json/

my $find = $ARGV[0];
my %repos;

find_link($find);

sub find_link {
    my $tmpl = '"title":"%s","subtitle":"%s","arg":"%s"';

    %repos = LinkOpener::get_repos();

    my @keys = sort( sort_repos grep {$repos{$_}{name} =~ /$find/i} keys %repos);
    if (@keys) {
        print '{"items":[{' . join('},{', map({ sprintf($tmpl, $repos{$_}{name},$repos{$_}{link},$repos{$_}{link}) } @keys)) . '}]}';
    }
    else {
        print '{"items":[{"title":"No links found","subtitle":"Please try a different search"}]}';
    }
}

sub sort_repos {
    if ($repos{$a}{count} == $repos{$b}{count}) {
        return $repos{$a}{name} cmp $repos{$b}{name};
    }
    else {
        return $repos{$b}{count} <=> $repos{$a}{count};
    }
}