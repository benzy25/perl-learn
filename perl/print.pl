use strict;
use warnings;
$|=1;

sub main {

    my $file = '/Users/jeffreyambrose/Desktop/email-contest/allhospital.txt';
    open (INPUT, $file) or die "Ha Ha can't find $file\n";
    
    while(my $line =<INPUT>) {

            if ($line =~ /Hospital/) {

                print $line;
                
            } elsif ($line =~ /Health/){
                
                print $line;
            }    elsif ($line =~ /Medical/){
                
                print $line;
            }
        }
        close (INPUT);
}

main();

