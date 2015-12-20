use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
    my %months = (
        "jan" => 1,
        "feb" => 2,
        "mar" => 3,
        "apr" => 4,
    );

    print $months{"apr"} . "\n";

    my %days = (
        1 => "Tomorrow",
        2 => "Yesterday",
        3 => "Friday",
        4 => "Thursday",
    );

    print $days{2} . "\n";

    my @months = keys %months;

    foreach my $month(@months) {
        my $value = $months{$month};

        print "$month: $value\n";

    }
}

main();
