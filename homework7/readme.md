# Homework 7

## Noir

1. Follow the [instructions](https://noir-lang.org/docs/getting_started/installation/) to install Rust and Noir ( the nargo directory is in crates/nargo)
2. Create an [example project](https://noir-lang.org/docs/getting_started/hello_noir/#create-our-first-nargo-project)
3. Follow the instruction in the documentation to create and verify a proof.

Project in https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/tree/main/homework7/hello_world

```
/hello_world$ nargo check
[hello_world] Constraint system successfully built!
```

Enter the following into `Prover.toml`:

```
x = "1"
y = "2"
```

Then:

```
hello_world$ nargo prove
```

Proof in `proofs/hello_world.proof` is generated.

Then:

```
ching@LAPTOP-POGJV0SQ:/mnt/c/Users/chine/EncodeBootcamp/ZKBootcamp/Noir/projects/hello_world$ nargo verify
```

No error message, so verification is successful.

If we enter 

```
x = "1"
y = "1"
```

in `Prover.toml` instead, then the assertion ` assert(x != y);` fails, and I get an error message:

```
error: Failed constraint
  ┌─ /mnt/c/Users/chine/EncodeBootcamp/ZKBootcamp/Noir/projects/hello_world/src/main.nr:2:12
  │
2 │     assert(x != y);
  │            ------
  │
  = Call stack:
    1. /mnt/c/Users/chine/EncodeBootcamp/ZKBootcamp/Noir/projects/hello_world/src/main.nr:2:12
```
