#!/usr/bin/perl
use strict;

my $files = `ssh everett\@microb120.med.upenn.edu "find /media/sequencing/Illumina/19* -maxdepth 2 -name SampleSheet.csv"`;

foreach (split(/[\n\r]/, $files)){
  my $r = `ssh everett\@microb120.med.upenn.edu "cat $_ | strings | grep -A 10000 '\\[metaData\\]' | grep -v '\\[metaData\\]'"`;
  if ($r){
     my @p = split /\//;
     my $file = 'data-' . $p[@p-2] . "-sampleInfo.csv";
     next if (-e $file);
     open  F, ">$file";
     print F $r;
     close F;
     print stderr "Created meta data file for $p[@p-2]\n";
  }
}
