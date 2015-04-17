use strict;
use warnings;
$|=1;

sub main{

    my @files = (
    '/Users/Benz/files/hover-effects/hover.jpg', 
    '/Users/Benz/files/hover-effects/index.html',
    '/Usrs/Benz/files/hover-effects/index.html',
);

 foreach my $file (@files) {
   if ( -f $file) {
    print "Got It I found $file\n";
}
  else {
    print "Nope\, $file isn\'t real\n";
     }
   }
}

main();

