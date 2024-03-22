# ZK Diseasechecker ZoKrates for Pharmacy

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

Create the folder `Pharmacy_v2`

Place `pharmacy.zok` inside with the following code:

```
def main(private field secret, field address, private field[5] arr, field target)  {
    assert(secret == address);
    bool mut found = false;
    for u32 i in 0..5 {
        found = if (arr[i] == target) {true} else {found};
    }
    assert(found);
}

```

code checks if `target` (number representing some medical condition) is contained in an array `private field[5] arr`. The array `private field[5] arr` is the whole medical record.

For example `1234` can represent "Asthma" and `5678` can represent "Diabetic"

`secret` and `address` are the wallet address for which the proof is created. This assertion makes sure that only this wallet address can use this proof to purchase the medicine. The proof would be false for any other wallet address. Note that a decimal representation of the address (which is in hex) is required.

In our example, the wallet address for which the proof is created is `0x974bfc05c4b51d4b9d84131a9a870eeccfb77121` which is `863752116543225290167644995281522894808962003233` in decimal. ZoKrates does not understand hex.

run these steps:

```
# compile
zokrates compile -i pharmacy.zok
# perform the setup phase
zokrates setup
# execute the program
zokrates compute-witness -a zokrates compute-witness -a 863752116543225290167644995281522894808962003233 863752116543225290167644995281522894808962003233 22 2312 1234 4444 3333 1234
# generate a proof of computation
zokrates generate-proof
# export a solidity verifier
zokrates export-verifier
```

In this case, the second secret `private field[5] arr` is `22 2312 1234 4444 3333` (representing the whole medical record of medical conditions), the last number `1234` is the input we want to check in the array (i.e. we want to check if Asthma is contained in the medical record), a verifier contract `verifier.sol` is generated.

If we run

`zokrates compute-witness -a 22 2312 1234 4444 3333 5678`, i.e. we check if "Diabetic" is in the medical record, this would fail.
