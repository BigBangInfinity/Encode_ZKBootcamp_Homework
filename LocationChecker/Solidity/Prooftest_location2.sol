// SPDX-License-Identifier: MIT
// latitude = 51, longitude = 1
pragma solidity ^0.8.0;

interface IVerifier {
    struct G1Point {
        uint X;
        uint Y;
    }
    struct G2Point {
        uint[2] X;
        uint[2] Y;
    }
    struct Proof {
        G1Point a;
        G2Point b;
        G1Point c;
    }
    function verifyTx(Proof memory proof) external view returns (bool r);
}

contract ProofChecker {
    IVerifier private verifier;

    constructor(address _verifierAddress) {
        verifier = IVerifier(_verifierAddress);
    }

    function checkProof() public view returns (bool) {
        // Define the proof according to the provided values
        IVerifier.Proof memory proof = IVerifier.Proof({
            a: IVerifier.G1Point(
                0x1d8e142b5ee721e7a349ba304a42d52393e916b17b4f4d54904f2897b9692729,
                0x28b3997e74346d6e5b214023487ca5ec9ba430280352eb2b081ce5324c09e8d6
            ),
            b: IVerifier.G2Point(
                [0x0b14f88bdb2cb2103769f2b68498f54a077b77812a206593bd80748c3ffa83fa, 0x1757e7711ff3128494d6c52f827cc3c52955e0e095bb6fb22d0f30fe6ff495cd],
                [0x2f79178f30f8aad3a07436bde7b47375317562f4ed2dd851d1747abe13d5213a, 0x2b6d1e4873e1ae45bfd9af96ed1e496d1c20f538760630b6bdf9c86c0d2a5ab0]
            ),
            c: IVerifier.G1Point(
                0x2a074df52c813567d06cb105d0de5a803a008af1f1511650519dc893e23d16a6,
                0x0743cf1b0627d086a5ca483e1883b09324b2f999acd05b464af09f4c12b24a94
            )
        });

        // Attempt to verify the proof
        bool verified = verifier.verifyTx(proof);
        return verified;
    }
}
