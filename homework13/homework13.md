# Homework 13
## Circom

Complete the circom exercises in the [repo](https://github.com/ExtropyIO/ZeroKnowledgeBootcamp/tree/main/circom), following the instructions in the README.md files.
You can use the repl tool [zkREPL](https://zkrepl.dev/)

1. Using this code in the [zkREPL](https://zkrepl.dev/), complete the IsZero template. It should output 1 if input is 0 and output 0 if input is not 0.

This is equivalent to the two contraints:

```
input * output = 0
output * output = output
```

Rewritten as R1CS:

```
y = 0
y = input * output
output = output * output
```

Circom code, input = 2

![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/9348f59e-a81d-405b-9611-3c2d5e02261c)

Circom code, input = 0

![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/5aecc6f4-eb8f-49fb-87bb-9c435c5d3e9c)

2. Using this code in the [zkREPL](https://zkrepl.dev/), complete both constraints and add some appropriate inputs in the input section. Test that it creates a proof, and show that an incorrect proof fails.

   ![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/762a5e2e-1c55-4eae-99b7-17c40ef3bafd)

Test wrong assertion:

![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/bbec3020-fa17-4153-a1f0-48e5777253a2)

## Stark Theory

1. Imagine you get the following trace
   
0,2,4,6,8,10,12

from your program (which simply adds 2 to the previous value.)

Write out the constraints for this trace, in terms of i, j

$A_{0,1} = 0$

$\forall1\leq i\leq 5: A_{i, 1} - A_{i-1, 1} - 2 = 0$

$A_{6,1} = 12$


2 . Polynomial practice

for

$p(x) = x^3 - 5x^2-4x+20$

a) find an integer root a , i.e. p(a) = 0 (clue < 7)

$p(2) = 2^3 - 5*2^2 - 4*2 + 20 = 8 - 20 - 8 + 20 = 0$, i.e. 2 is a root.

b) write this in terms of a lower degree polynomial q(x)

such as $p(x) = (x − a)q(x)$
What are the degrees of $p(x)$ and $q(x)$ ?
Note we are doing this over the real numbers, for zkps we would use a finite field

$p(x) = (x^2 - 3x + 10)\cdot (x-2)$

Degree of $p(x)$ is 3, degree of $q(x)$ is 2.
