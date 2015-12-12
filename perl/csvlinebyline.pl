use strict;
use warnings;

$|=1;

sub main{
    #Define file
    my $input = "values.csv";
    
    unless (open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }
    #Next line is for headers comment out if not needed
    <INPUT>;
    
    #bein looping through file 
    while(my $line = <INPUT>) {
        my @values = split ',', $line;  
        print $values[1] . "\n"; 
    }

    close INPUT;

}

main();
