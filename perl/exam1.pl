use strict;
use warnings;

$|=1;

sub main{
    my @emails = (
        'benz_rob@yahoo.com',
        'bears@gmail.com',
        '@yoo.com',
        'phillyblunt',
        'johnsmith@yahoo.com',
        'johnsmith@87686com',
    );

    for my $email(@emails) {
        if ($email =~ /\w+\@\w+\.\w+/) {
            print "Valid: $email\n";
        } else {
          print "Invalid: $email\n";
        }
    }
}
main();
