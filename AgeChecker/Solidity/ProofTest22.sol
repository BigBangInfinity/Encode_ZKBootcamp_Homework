// SPDX-License-Identifier: MIT
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

contract ProofVerifier {
    IVerifier public verifier;

    constructor(address verifierAddress) {
        verifier = IVerifier(verifierAddress);
    }

    function verifyProof() public view returns (bool) {
        IVerifier.G1Point memory a = IVerifier.G1Point(
            0x29d1b777e0cbc563350ed0d26f2ddbd711298a5ee404526f2753438317e670c9,
            0x0b6c43dc0e03465567c04daf5869666e29624e69fbcd38e5c9fd60f1a241886e
        );
        IVerifier.G2Point memory b = IVerifier.G2Point(
            [0x202d69ece6f11f19df84efd6c1167518b27e7ca675b27f5f064a9654b6ad4104, 0x2d83f87e843d5d306fe3076debc6895785a436e85b5ce908a0f1c0e0bf0a97f6],
            [0x28ca78fdf33bcd2515794dbe160e0e9b63786d0bb44294d4b08fd75989ed478a, 0x2bb936c5cc7edb09fb1fe7d70d9bb666a2165954ad41965b223956e9ba593e75]
        );
        IVerifier.G1Point memory c = IVerifier.G1Point(
            0x2052e099e305f54476a084e65b84146604802e62d81d8f6df530822d155c0b44,
            0x2d37f98e80c8c88a56fae4139416dec0099ce21e9ca9ec63baa5dbd8ffbb4fbd
        );

        IVerifier.Proof memory proof = IVerifier.Proof(a, b, c);

        return verifier.verifyTx(proof);
    }
}
