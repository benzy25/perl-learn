use strict;
use warnings;

$|=1;

sub main {

my @rows = ();
my @transposed = ();

print "Path to File: ";
my $userword = <STDIN>; # I moved chomp to a new line to make it more readable
chomp $userword; # Get rid of newline character at the end
exit 0 if ($userword eq ""); # If empty string, exit.

open F1, $userword;

while(<F1>) {
    chomp;
    push @rows, [ split /,/ ];
}
#print @rows;

for my $row (@rows) {
  for my $column (0 .. $#{$row}) {
    push(@{$transposed[$column]}, $row->[$column]);
  }
}

for my $new_row (@transposed) {
  for my $new_col (@{$new_row}) {
      print $new_col, ",";
  }
  print "\n";
}

}

main();