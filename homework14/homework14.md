# Homework 14

## Secret Sharing

Try out Shamir secret sharing

1. Create a polynomial with the secret being the constant term $a_0$ , the other a values ($a_1, \ldots, a4) can be chosen at random. The polynomial will be of the form

```math
y(x) = a_4x^4 + a_3x^3+a_2x^2+a_1x+a_0
```

Example:

```math
y(x) = 14x^4 + 78x^3-257x^2+7511x+1337
```

2. Calculate the y values for five x values by evaluating the polynomial, these are the shares.

Python code

![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/ac44a692-c3a2-4c44-8a33-05eea553c622)
  
3. Reconstruct the polynomial using those shares and an online interpolation calculator such as https://planetcalc.com/8680

![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/ac52230d-49da-477d-913b-6250ea9a0895)
