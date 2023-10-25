#include <stdio.h>

extern int ditui1();

int main() {
    int n, result;
    printf("Enter the value of n: ");
    scanf("%d", &n);

    result = ditui1(n);

    printf("F(%d) = %d\n", n, result);

    return 0;
}
// compile with:
// nasm -f elf32 -g -o ditui1.o ditui1.asm;gcc -g -m32 -o fib main.c ditui1.o

// run with:
// ./fib

// debug with:
// gdb fib
// (gdb) break ditui1.asm:27
// (gdb) run
// (gdb) info registers
// (gdb) stepi