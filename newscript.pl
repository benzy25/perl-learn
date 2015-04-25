use strict;
use warnings;
$|=1;

sub main {

    my $file ='/Users/Benz/Desktop/beowulf.html';

open(INPUT, $file) or die "No Way\n"; 

while(my $line = <INPUT>) {
if($line =~ /Spear-Danes/) {
print $line;
}
}

close (INPUT);

}

main();

