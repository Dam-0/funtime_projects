#!/usr/bin/perl
use warnings;
use strict;

my $lowest_age = 10;
my $highest_age = 100;
my $guess = 1;

my $rand_age = int(rand($highest_age-$lowest_age)) + $lowest_age;
print ($rand_age, "\n");
print ($guess, "\n"):

while( $guess != 1 ) {
    print "Input Number: ";
    chomp( my $num_guess = <STDIN>);

    if($num_guess < $rand_age) {
        print ("q1 \n");
    }
    elsif($num_guess > $rand_age) {
        print ("q2 \n");
    }
    elsif($num_guess == $rand_age) {
        print ("q3 \n");
        my $guess = 0;
    }
    else {
        print ("WHOOPS \n");
    }

}