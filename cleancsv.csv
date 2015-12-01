use strict;
use warnings;

use  Data::Dumper;

$|=1;

sub main{
    #Define file
    my $input = "values.csv";
    
    unless (open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }
    #headers comment out if not needed
    <INPUT>;
    
    #bein looping through file 
    while(my $line = <INPUT>) {
        chomp $line; 
        print "'$line'\n";

    my @values = split /\s*,\s*/, $line;  
   
    #   print join '|', @values;
   
        print Dumper(@values); 
        print "\n"; 
    }

    close INPUT;

}

main();
