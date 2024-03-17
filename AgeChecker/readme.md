# ZK Agechecker with ZoKrates

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

Create the folder `Agechecker`

Place `agechecker.zok` inside with the following code:

```
def main(private field age) {
	assert(age >= 18);
	return;
}
```

run these steps:

```
# compile
zokrates compile -i agechecker.zok
# perform the setup phase
zokrates setup
# execute the program
zokrates compute-witness -a 22
# generate a proof of computation
zokrates generate-proof
# export a solidity verifier
zokrates export-verifier
```

In this case, the secret is `22`, a verifier contract `verifier.sol` is generated, and the proof is generated in the `proof.json` file (which is renamed to `proof22.json`)

Generate another proof with the secret `37`, based on the same proving and verifier key, so it works with the same verifier contract. To replicate this step with the same proving key, copy the folder `agechecker` which contains proving and verifier key, skip command `zokrates setup` which normally would create the proving and verifier key. Run

```
zokrates compute-witness -a 37
zokrates generate-proof
```

This generates another proof `proof.json` which renamed to `proof37.json`.

Next step is to verify the proofs onchain.

Deploy `verifier.sol` on Ethereum Sepolia: `0x9792E56E3ca02AB953a6c592E4548c0De36e4f8d`

Also deploy the contracts in the `Solidity` folder: `ProofTest22.sol` and `ProofTest37.sol` with the verifier contract address `0x9792E56E3ca02AB953a6c592E4548c0De36e4f8d` as constructor. The numbers `a`, `b` and `c` are exactly the outputs from the `proof22.json` and `proof37.json` files.

`ProofTest22.sol` deployed on Ethereum Sepolia: `0x5B7C9ab0Da206F1d070E63bFF978C9882d642975`

`ProofTest37.sol` deployed on Ethereum Sepolia: `0xa3A6af9760FDFcB8e61C16C7D1512Dc9DBfF6732`

Calling the `verifyProof` function in `ProofTest22.sol` and `ProofTest37.sol` would call the `verifyTx` function of `verifier.sol` which returns `True`.
