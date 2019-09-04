#!/usr/bin/perl
use strict;

foreach(`find ./ -type f`){
 chomp();
 my $c = "dos2unix $_";
 print "$c\n";
 `$c`;
 my $c = "mac2unix $_";
 print "$c\n";
 `$c`;
}
