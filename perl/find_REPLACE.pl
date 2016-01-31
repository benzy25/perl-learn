use strict;
use warnings;

$|=1;

sub main {

print "Search For: ";
my $search= <STDIN>; 
chomp $search; 
exit 0 if ($search eq ""); 

print "Replace With: ";
my $replace= <STDIN>; 
chomp $replace; 
exit 0 if ($replace eq ""); 

print "Path To File: ";
my $file= <STDIN>; 
chomp $file; 
exit 0 if ($file eq ""); 


perl -pi -w -e 's/\b$search\b/$replace/g' $file 

}

main();

