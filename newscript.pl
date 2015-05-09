use strict;
use warnings;
$|=1;

sub main {

    my $file = '/Users/Benz/Desktop/beowulf.html';
    open (INPUT, $file) or die "Ha Ha can't fint $file\n";
    
    while(my $line = <INPUT>) {
            if ($line =~ /(Sp....Danes)/) {
                print $line;
            }
        }
        close (INPUT);
}

main();
