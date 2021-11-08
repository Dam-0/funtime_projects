 #include <iostream>
 #include <cstdlib>
 #include <random>
 #include <ctime>
using namespace std;

 int main() {
     
    int guess = 1;
    int max_age = 100;
    int min_age = 1;
    int guess_age = 0;

    srand(time(0));
    int range = max_age - min_age + 1;
    int age = rand() % range + min_age;

    do
    {
        cout << "Guess the age: ";
        cin >> guess_age;

        if(guess_age>age)
            printf("Age is lower\n");

        else if(guess_age<age)
            printf("Age is higher\n");

        else if(guess_age==age) {
            printf("YOU GOT IT\n");
            guess=0;
        }

    } while (guess != 0);
 }
