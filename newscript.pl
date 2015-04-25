use strict;
use warnings;
$|=1;

sub main {

    my $file = '/Users/Benz/Desktop/beowulf.html';
    open (INPUT, $file) or die "Ha Ha can't fint $file\n";
    
    my $output = '>output.txt';
    open (OUTPUT, $output) or die "just can\'t find $output\n";
    
    while(my $line =<INPUT>) {


            if ($line =~ /Spear-Danes/) {

            $line =~ s/Days/DAYS/ig;
                print OUTPUT $line;
                
            }
        }
        close (INPUT);
    close (OUTPUT);
    close (OUTPUT);
}

main();

