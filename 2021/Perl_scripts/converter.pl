#!/usr/bin/perl
use warnings;
use strict;


print "Input Number: ";
my $number = <STDIN>;
chomp $number;
 

print "Your number in binary is: ";
printf "%b\n", $number;

print "Your number in octal is: ";
printf "%o\n", $number;

print "Your number in deci is: ";
printf "%d\n", $number;

print "Your number in hex is: ";
printf "%x\n", $number;