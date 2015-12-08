use strict;
use warnings;

$|=1;

sub main{
    my $text = "The Code is for this device is GP8765.";
   
    if ($text =~ /(\w\w\d{4})/) {
        print "The code is: $1  \n";
    } else {
        print "Not Found \n";
    }
}
main();
