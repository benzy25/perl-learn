#!/usr/bin/perl -w

# adds items to repair parts list

use strict;

use warnings;
use Spreadsheet::ParseExcel;
use Data::Dumper;
use DBI;

our %man = (
   'Hill-Rom' => '2',
   'Stryker' => '5',
   'Burke' => '6',
   'Transfer' => '7',   #really "Transfer Master"
   'Graham Field' => '8',
   'Midmark' => '17',
   'Laerdal' => '22',
   'Baxter' => '29',
   'B. Braun' => '30',
   'Alaris' => '33',
   'Hospira' => '34',
   'Sabratek' => '35',
   'Sigma' => '36',
   'Fresenius' => '37',
   'Althin' => '38',
   'Cobe' => '39',
   'Nasco' => '39',
   'Winco' => '42',
   'Drive' => '68',
   'Amico' => '71',
   'Medfusion' => '81',
   'Welch Allyn' => '88',
   'Brewer' => '46',
   'Lumex' => '43',
   'Medline' => '45',
   'Smiths Medical Asd Inc' => '49',
   'Physio-Control' => '56',
   'Zoll' => '57',
   'Physio-Control LifePak' => '58',
   'Novum Medical' => '60',
   'DiaMedical' => '62',
   'Akin' => '63',
   'Philips' => '72',
   'Detecto' => '74',
   'Health o meter' => '75',
   'Air-Shields' => '76',
   'Blickman Inc.' => '77',
   'GE' => '78',
   'Pedigo' => '79',
   'Ohmeda' => '84',
   'Bristoline' => '92',
   'Nikon' => '93',
   'Puritan Bennett' => '103',
   'Siemens' => '104',
   'Grafco' => '104',
   'Lorell' => '105',
   'Everest & Jennings' => '110',
   'Wallcur' => '111',
   'Invacare' => '113',
   'Ferno' => '114',
   'Pedigo' => '115',
   'John Bunn' => '116',
   'Appleton' => '118',
   'Covidien' => '119',
   'Clinton Industries' => '122',
   'Waterloo Healthcare' => '123',
   'Dynarex' => '121',
   'ADC' => '124',
   'LW Scientific' => '125',
   'Reconditioned' => '126',
   'New' => '127',
   'Kendall' => '129',
   'American Diagnostic Corporation' => '130',
   'Bird' => '131',
   'Moore Medical' => '132',
   'Plasti-Products' => '133',
   'Innovative Healthcare Corporation' => '134',
   'Drager' => '135',
   'Gaumard' => '136',
   'Simulaids' => '137',
   'VATA Inc' => '138',
   'Kyoto Kagaku Co., LTD' => '139',
   'Limbs & Things' => '140',
   'Laedal' => '141',
   'American 3B Scientific' => '142',
   'Hausted' => '143',
   'UMF' => '144',
   'Lecat' => '145',
   'SimLeggings+' => '150',
   'Hudson RCI' => '151',
   'Gumbo' => '152',
   'MST' => '153',
   'Spencer' => '154',
   'Rescue Simulation Products' => '156',
   'Transmotion' => '155'
   );

#deal with xcel unicode
binmode(STDOUT, ":utf8");
my $oExcel = new Spreadsheet::ParseExcel;
my $oBook = $oExcel->Parse($ARGV[0]);
if( !defined $oBook ){
    die $oExcel->error();
}

#ignore any other sheets use only the first
my $worksheet = $oBook->worksheet(0);
my ( $row_min, $row_max ) = $worksheet->row_range();
my ( $col_min, $col_max ) = $worksheet->col_range();
print STDERR "row: $row_min $row_max\n";
print STDERR "col: $col_min $col_max\n";

#get id for manufacture from user
print STDERR "category (mattress 1): ";
my $catid = <STDIN>;
print STDERR "subcat: ";
my $subcat = <STDIN>;

print STDERR "table: ";
my $table = <STDIN>;

print STDERR "dia_cat table $table and catid is $catid\n";
chomp($catid);

my @keys = qw(cat subcat manufacture name mmid tab0 drop0 image image_full image_thumb image_alt seo_title seo_description seo_keywords);
for my $row ( 2 .. $row_max){
   #there must always be a value in the first column
   unless($worksheet->get_cell($row, 0)->value()){
      print STDERR "Ended on Row $row\n";
      exit 0;
   }
   my @db = ();
   for my $col ($col_min .. ($#keys) ){
      my $cell = $worksheet->get_cell($row, $col);
      unless($cell){
         push @db, '';
         next;
   }
      my $data = $cell->value();
      push @db, $data;
   }

   #push cat id on front of array
   chomp($catid, $subcat);
   $db[0] = $catid;
   $db[1] = $subcat;

#make color lists comment out if not needed
   $db[7] = MakeColorList($db[7]);


   #match the man name to the man id
   unless(/$db[2]/ ~~ %man ){
      #print STDERR Dumper(%man);
      print STDERR "$row\n";
      die("Manufacture doesn't exist in lookup table: $db[2] \t\t $db[1]");
   }
   $db[2] = $man{$db[2]};

   #quote for db
   for my $x (0..$#db){
      #strip that the word 'images/' is not in the image path
      $db[$x] =~ s/..\/images\///;
      $db[$x] =~ s/images\///;
      $db[$x] =~ s/\x{2022}(.+)/<li>$1<\/li>/g;  #replace xls bullets with html
      $db[$x] = DBD::_::db->quote($db[$x]);
   }
      #create SQL
   my $sql = "INSERT INTO $table ";
   $sql.= "(".join(',', @keys).")";
   $sql.= " VALUES ";
   $sql.= "(".join(',', @db).")";
   print "$sql;\n";
   #print "$#keys $#db\n";
}

sub MakeColorList{
   my @cl = split(/,/, $_[0]);

   #strip leading zeros  01 -> 1
   foreach my $ci (0..$#cl){
      $cl[$ci] =~ s/^0+//;
   }
   return join(',', @cl);
}
