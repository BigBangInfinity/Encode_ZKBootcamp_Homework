# Homework 3

## Practice using Zokrates

1.  Use the example file to generate a proof to show that a prover knows the square root of 25.

    As in class, enter a = 5, b = 25, compute, setup and generate proof:

    ![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/822d5101-07b3-42b5-9d82-167e0d94a786)

    This is proof.json:

    ```
    {
      "scheme": "g16",
      "curve": "bn128",
      "proof": {
        "a": [
          "0x0a59d9d649ddb64a5d31b19bb82cbd505dfdbbbf61e882b70cd3776379320bfa",
          "0x25410848130235e3fba33e69e4ae4b7a44d608a7575564392f293546e637502d"
        ],
        "b": [
          [
            "0x2a198439c29dc985e873a156c50f7bf270ac5ea485d09683d1d1490ff918ac7f",
            "0x1afca99390f53c9a49874465e1fa6f376e9be1fc4f3a41caa905c2289eb6d07c"
          ],
          [
            "0x29a466bcfa0e5979888f30321d15d606185ae93dee4608d9f9e75ce89944695f",
            "0x1dc0e3d158872391d348fa851630836daecca15cb29b688cdb1e2905f9287e64"
          ]
        ],
        "c": [
          "0x0eba9934f3740a0e80a40885b7fb496f0ff3878519238a324447f13e23e6eefd",
          "0x0407f05b9ea6db6692d0bfdff159d2be788716702da17f45b8c683cfb44dae7c"
        ]
      },
      "inputs": [
        "0x0000000000000000000000000000000000000000000000000000000000000019"
      ]
    }
    ```

2.  Try to create an invalid proof
    ![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/5e86bde1-2108-48ee-9970-89d6f7edcb99)
3.  Follow the example to build a proof that you know the pre image of a hash https://zokrates.github.io/examples/sha256example.html

    Enter a = 0, b = 0,, c = 0, d = 5 

    ![image](https://github.com/BigBangInfinity/Encode_ZKBootcamp_Homework/assets/37957341/5ccc24e1-6e49-41de-bedc-32c32d1c1285)

    This is proof.json:

    ```

    {
    "scheme": "g16",
    "curve": "bn128",
    "proof": {
      "a": [
        "0x23d5eaf72ba41e364277a895e96e69a659a1682edddf51aa6d92a9e6e89c8edf",
        "0x004506a4b9548f7edaa386558f15355fd4ba05d57f9b3ffd28e32f0e333d559c"
      ],
      "b": [
        [
          "0x1623d90f80230631650d423f094252d41ddd6823289d3182a7e646123d6a91be",
          "0x232af954645bae2e43b2a238d6179731c0cde793f5c72b17e4e00407a6ddb7ec"
        ],
        [
          "0x10987a842297387276e93c16f57997f6cd152f1a698e702aea118a1d66d7d77b",
          "0x269feebc7a61f43822893238903bbbb4fa25457ef59cd72ee06e28acfb4a712d"
        ]
      ],
      "c": [
        "0x15e556ec720e0452a685f98a8d45bf12abee75baa9f02078f5362a2b44fb42f6",
        "0x07eaf1e3dd108f7bb67161c326f32a0e6c1ac19809b2585405276adc2e87e144"
      ]
    },
    "inputs": [
      "0x00000000000000000000000000000000c6481e22c5ff4164af680b8cfaa5e8ed",
      "0x000000000000000000000000000000003120eeff89c4f307c4a6faaae059ce10"
    ]
    }
    ```
