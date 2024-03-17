# ZK Locationchecker with ZoKrates

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

Create the folder `Locationchecker`

Place `locationchecker.zok` inside with the following code:

```
def main(private field latitude, private field longitude) {
	assert(latitude <= 55 && latitude >= 50 && longitude <= 5);
	return;
}
```

run these steps:

```
# compile
zokrates compile -i locationchecker.zok
# perform the setup phase
zokrates setup
# execute the program
zokrates compute-witness -a 53 3
# generate a proof of computation
zokrates generate-proof
# export a solidity verifier
zokrates export-verifier
```

In this case, the secret is the pair `53 3` (i.e., `latitude = 53, longitude = 3`), a verifier contract `verifier.sol` is generated, and the proof is generated in the `proof.json` file (which is renamed to `proof_53_3.json`)

Generate another proof with the secret `51 1`, based on the same proving and verifier key, so it works with the same verifier contract. To replicate this step with the same proving key, copy the folder `locationchecker` which contains proving and verifier key, skip command `zokrates setup` which normally would create the proving and verifier key. Run

```
zokrates compute-witness -a 51 1
zokrates generate-proof
```

This generates another proof `proof.json` which renamed to `proof_51_1.json`.

Next step is to verify the proofs onchain.

Deploy `verifier.sol` on Ethereum Sepolia: `0xFF1b1A2de56453cA5132d786A1c6cD3B0DFE271d`

Also deploy the contracts in the `Solidity` folder: `Prooftest_location1.sol` and `Prooftest_location2.sol` with the verifier contract address `0xFF1b1A2de56453cA5132d786A1c6cD3B0DFE271d` as constructor. The numbers `a`, `b` and `c` are exactly the outputs from the `proof_53_3.json` and `proof_51_1.json` files.

`Prooftest_location1.sol` deployed on Ethereum Sepolia: `0xb157DB0aE0299720bda923C21B9b7D3851A4C864`

`Prooftest_location2.sol` deployed on Ethereum Sepolia: `0xCC7f9b5BdF0C6976A924a404b1503de96fE4bfA2`

Calling the `verifyProof` function in `Prooftest_location1.sol` and `Prooftest_location2.sol` would call the `verifyTx` function of `verifier.sol` which returns `True`.
