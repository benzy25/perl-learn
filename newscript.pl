use strict;
use warnings;
$|=1;

sub main {

    # * = zero or more of the preceding character ex d* as many as possible
    # + one or more of the preceding characters as many as possible
    # *? zero of more of the preceding character, as few as possible
    # +? one or more of the preceding as few as pssible

   my $text = 'DE19742';

if($text =~ (DE/d{5})/) {

print "Found: '$1'/n";

}

}

main();
