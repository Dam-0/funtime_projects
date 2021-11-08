#!/usr/bin/perl
use warnings;
use strict;

my $lowest_age = 10;
my $highest_age = 100;
my $guess = 0;

my $rand_age = int(rand($highest_age-$lowest_age)) + $lowest_age;

while( $guess != 1 ) {
    print "Input Number: ";
    chomp( my $num_guess = <STDIN>);

    if($num_guess < $rand_age) {
        print ("Age is higher. \n");
    }
    elsif($num_guess > $rand_age) {
        print ("Age is lower. \n");
    }
    elsif($num_guess == $rand_age) {
        print ("You got it. \n");
        my $guess = 1;
    }
    else {
        print ("WHOOPS \n");
    }
}
exit 0