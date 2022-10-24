#!/usr/bin/perl -I .

use strict;
use warnings;

use LinkOpener;

# https://www.alfredapp.com/help/workflows/inputs/script-filter/json/

my $find = $ARGV[0];
my %links;

find_link($find);

sub find_link {
    my $tmpl = '"title":"%s","subtitle":"%s","arg":"%s"';

    %links = LinkOpener::get_links();

    my @keys = sort( sort_links grep {$links{$_}{name} =~ /$find/i} keys %links);
    if (@keys) {
        print '{"items":[{' . join('},{', map({ sprintf($tmpl, $links{$_}{name},$links{$_}{link},$links{$_}{link}) } @keys)) . '}]}';
    }
    else {
        print '{"items":[{"title":"No links found","subtitle":"Please try a different search"}]}';
    }
}

sub sort_links {
    if ($links{$a}{count} == $links{$b}{count}) {
        return $links{$a}{name} cmp $links{$b}{name};
    }
    else {
        return $links{$b}{count} <=> $links{$a}{count};
    }
}