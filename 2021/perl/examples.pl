#!/usr/bin/perl
use warnings;
use strict; # strict varible declarion, requires "my VAR"

print("Hello, World!\n");

#Code block, Has its own scope
{ 
    my $num1 = 10;
    my $num2 = 20;
    my $sum = $num1 + $num2;

    print($sum ."\n");
}


my $colour = 'red';
print "Your favorite color is "  . $colour ."\n";

my $amount = 20;
my $s = "The amount is $amount\n"; #interprets $amount as string
print($s);

#dif bases

my $base_10 = 55;
my $base_2 = 0b10011111;#0b binary
my $base_8 = 057; #0 octal
my $base_16 = 0xA5; #0x hex

print("Base 10: $base_10\n");
print("Base 2: $base_2\n");
print("Base 8: $base_8\n");
print("Base 16: $base_16\n");


my $s= q/"Are you learning Perl String today?" We asked./;
print($s ,"\n");

my $name = 'Jack';
my $s2 = qq/"Are you learning Perl String today?"$name asked./;
print($s2 ,"\n");

my $s = "This is a string\n";
print(length($s),"\n"); #String length

my $s = "Change cases of a string\n";
print("To upper case:\n");
print(uc($s),"\n");

print("To lower case:\n");
print(lc($s),"\n");

my $s = "Learning Perl is easy\n";
my $sub = "Perl";
my $p = index($s,$sub); # rindex($s,$sub);
print(qq\The substring "$sub" found at position "$p" in string "$s"\,"\n");

# extract substring
my $s = "Green is my favorite color";
my $color  = substr($s, 0, 5);      # Green
my $end    = substr($s, -5);        # color

print($end,":",$color,"\n");

# replace substring
substr($s, 0, 5, "Red"); #Red is my favorite color
print($s,"\n");