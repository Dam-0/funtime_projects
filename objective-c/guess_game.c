#include <math.h>
#include <stdio.h>
#include <stdlib.h>


// Creates random between X and Y
int main()
{
    int max_age, min_age, age, guess_age;
    int guess;

    guess = 1;

    max_age = 100;
    min_age = 1;
    age = rand() % (max_age + 1 - min_age) + min_age;

    do
    {
        printf("\n");
        printf("Guess the age.\n");
        scanf("%d",&guess_age);

        if(guess_age>age)
            printf("Age is lower\n");
        else if(guess_age<age)
            printf("Age is higher\n");
        else if(guess_age==age) {
            printf("YOU GOT IT\n");
            guess=0;
        }
    } while (guess != 0);
};