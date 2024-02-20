# Homework 2


1. Modular arithmetic - you just need to find examples, you don't need to prove anything.
   
    a) Is it true that all odd squares are ≡ 1 (mod 8) ?

    yes

    $1^2 = 1 \equiv 1 (mod8)$
   
    $3^2 = 9 \equiv 1 (mod8)$
   
    $5^2 = 25 \equiv 1 (mod8)$
   
    $7^2 = 49 \equiv 1 (mod8)$    
    
    b) what about even squares (mod 8) ?

    no

    $0^2 = 0 \equiv 0 (mod8)$
   
    $2^2 = 4 \equiv 4 (mod8)$
   
    $4^2 = 16 \equiv 0 (mod8)$
   
    $6^2 = 36 \equiv 4 (mod8)$

2. What do you understand by
       
    a) O(n)
   
    b) O(1)
   
    c) O(log n)

    For a proof size, which of these would you want ?


    Mathematically, f(N) = O(g(N)) if it exists positive real numbers M, $N_0$ such that

    $f(N)\leq M\cdot g(N)$ for all $N\geq N_0$.

    In other words, given that f(N) is a function of the number of inputs N, O(g(N)) explains the growth of f as a function of N when N is large.

    f(n) = O(n) means that the function f would as n increases, f(n) increases linearly. f(n) = O(1) implies that f(n) is below. f(n) = O(log n) means that f grows logarithmically for large n.

    The ideal proof size would be O(1) which means that even for a large number of inputs, the proof size would also be below some threshold would never grow indefinitely.
