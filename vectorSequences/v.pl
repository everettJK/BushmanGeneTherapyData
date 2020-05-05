#!/usr/bin/perl
use strict;

my $v = `cat v`;
$v =~ s/[^A^T^C^G]//g;
print $v;
