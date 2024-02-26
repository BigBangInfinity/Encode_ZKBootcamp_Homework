# Homework 5

using WSL, compile

```
/homework5$ scarb build
```

This generates hello_world_HelloStarknet.contract_class.json in target/dev folder

run this command with the above generated .json as input:

```
/homework5$ starkli declare target/dev/hello_world_HelloStarknet.contract_class.json --account
demo-account.json --keystore ./demo-key.json --compiler-version 2.4.0 --network
goerli-1 --watch
```

output:

```
Not declaring class as it's already declared. Class hash:
0x0350b2c2bd4ddf03c78786b572bc58eb46a787ef22797f0c47b87af15353acb1
```

use this class hash as input:

```
/homework5$ starkli deploy 0x0350b2c2bd4ddf03c78786b572bc58eb46a787ef22797f0c47b87af15353acb1 --account demo-account.json --keystore ./demo-key.json
```

output:

```
Deploying class 0x0350b2c2bd4ddf03c78786b572bc58eb46a787ef22797f0c47b87af15353acb1 with salt 0x00bc4fc9d37a1af997589d9f071a1cea219a1485d1bccf09ea1776dc82216aeb...
The contract will be deployed at address 0x012ae8c4134486cf8b7d91081471744ab5999dcc31e8d0435edb3b9028501dca
Contract deployment transaction: 0x0344dd389a6bc854650efeced4f7a167405325d8e63fa7a0da59fd7f275f57ba
Contract deployed:
```

Contract deployment on Voyager (Goerli): https://goerli.voyager.online/tx/0x344dd389a6bc854650efeced4f7a167405325d8e63fa7a0da59fd7f275f57ba

