#include <stdio.h>
int main(){
    unsigned long long a = 0;
    unsigned long long b = 1;
    unsigned long long c = 0;
    int count = 0;
    while (count <= 100){
        c = a + b;
        b = a;
        a = c;
        count++;
        printf("%llu #%d\n", c, count);
    }
}