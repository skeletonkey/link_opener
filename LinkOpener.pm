package LinkOpener;

my $link_data = '.linkopener.txt';
my $sep = '|';

sub get_links {
    my %links = ();
    open(my $fh, '<', $link_data) || die("Unable to open file ($link_data) for read: $!\n");
    while (my $line = <$fh>) {
        chomp($line);
        my ($link, $alias, $count) = split(/\|/, $line);
        $links{$link} = {
            link => $link,
            name => get_name($link, $alias),
            count => $count || 0,
        }
    }
    close($fh);

    return %links;
}

sub save_data {
    my %data = @_;
    open(my $fh, '>', $link_data) || die("Unable to open file ($link_data) for write: $!\n");
    foreach my $name (keys %data) {
        print $fh join($sep, $data{$name}{link}, $data{$name}{name}, $data{$name}{count}) . "\n";
    }
    close($fh);
}

sub add_url {
    my ($url, $name) = @_;
    $name ||= '';
    open(my $fh, '>>', $link_data) || die("Unable to open file ($link_data) for append: $!\n");
    print $fh join($sep, $url, $name) . "\n";
    close($fh);
}

sub get_name {
    my ($link, $alias) = @_;

    return $alias if $alias;

    my @parts = split(/\//, $link);
    return $parts[-1];
}

sub update_link_count {
    my $link = shift;

    my $name = get_name($link);
    my %links = get_links();

    return unless exists $links{$link};
    $links{$link}{count}++;

    save_data(%links);
}

1;