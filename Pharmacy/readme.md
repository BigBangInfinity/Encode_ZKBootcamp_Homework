# ZK Diseasechecker ZoKrates

Follow these steps in https://zokrates.github.io/gettingstarted.html

```
git clone https://github.com/ZoKrates/ZoKrates
cd ZoKrates
export ZOKRATES_STDLIB=$PWD/zokrates_stdlib/stdlib
cargo build -p zokrates_cli --release
cd target/release
```

To be able to run zokrates, I had to add the following paths into the startup script:

open file with `nano ~/.bashrc`

Then add 

```
export ZOKRATES_STDLIB=/mnt/c/Users/chine/EncodeBootcamp/ZKBootcamp/Zokrates/zokrates/zokrates_stdlib/stdlib
export PATH=$PATH:/mnt/c/Users/chine/EncodeBootcamp/ZKBootcamp/Zokrates/zokrates/target/release
```

then run 

`source ~/.bashrc`

Create the folder `Pharmacy`

Place `pharmacy.zok` inside with the following code:

```
def main(private field[5] arr, field target)  {
    bool mut found = false;
    for u32 i in 0..5 {
        found = if (arr[i] == target) {true} else {found};
    }
    assert(found);
}

```

code checks if `target` (number representing some medical condition) is contained in an array. The array is the whole medical record.

For example `1234` can represent "Asthma" and `5678` can represent "Diabetic"

run these steps:

```
# compile
zokrates compile -i pharmacy.zok
# perform the setup phase
zokrates setup
# execute the program
zokrates compute-witness -a 22 2312 1234 4444 3333 1234
# generate a proof of computation
zokrates generate-proof
# export a solidity verifier
zokrates export-verifier
```

In this case, the secret is `22 2312 1234 4444 3333` (representing the whole medical record of medical conditions), the last number `1234` is the input we want to check in the array (i.e. we want to check if Asthma is contained in the medical record), a verifier contract `verifier.sol` is generated.

If we run

`zokrates compute-witness -a 22 2312 1234 4444 3333 5678`, i.e. we check if "Diabetic" is in the medical record, this would fail.
