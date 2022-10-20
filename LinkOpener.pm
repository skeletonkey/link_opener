package LinkOpener;

my $repo_data = '.linkopener.dat';

sub get_repos {
    my %repos = ();
    open(my $fh, '<', $repo_data) || die("Unable to open file ($repo_data) for read: $!\n");
    while (my $line = <$fh>) {
        chomp($line);
        my ($link, $alias, $count) = split(/\|/, $line);
        $repos{$link} = {
            link => $link,
            name => get_name($link, $alias),
            count => $count || 0,
        }
    }
    close($fh);

    return %repos;
}

sub save_data {
    my %data = @_;
    open(my $fh, '>', $repo_data) || die("Unable to open file ($repo_data) for write: $!\n");
    foreach my $name (keys %data) {
        print $fh join("|", $data{$name}{link}, $data{$name}{name}, $data{$name}{count}) . "\n";
    }
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
    my %repos = get_repos();

    return unless exists $repos{$link};
    $repos{$link}{count}++;

    save_data(%repos);
}

1;