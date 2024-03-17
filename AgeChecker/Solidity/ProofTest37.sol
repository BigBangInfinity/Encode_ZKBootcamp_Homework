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
            0x02e76dcd5ec3cbf9780c20d9f9be64d0a9d35e429a55d5fbe9302559ded9e8b6,
            0x0dd11e78692428707b8d072ada0aa65ab2dc754569c317193f50811931a7eebf
        );
        IVerifier.G2Point memory b = IVerifier.G2Point(
            [0x0c70b53e4281fde18b1c27974831661c46c806c680e92a1a6f998c082639f7c9, 0x28a8f21b438afe1cba492dca42302983732e9ca88339cf935e8ba1bd2eeca4a2],
            [0x28b62eebd22bc19f7ddea7a11be1d80ed15caa97c30c54c3d4a3cbc4712c3a3e, 0x12c4fdb3b3e8278285500485e2f77fccf961272cbfe38144b2d6427eb9ff3e4e]
        );
        IVerifier.G1Point memory c = IVerifier.G1Point(
            0x157179e8596fef5efcebe7e11d9b179f7eafea6e7b27af1f8c70f5cabb3c7963,
            0x0ccfbcc8346c997d1d75de66f3c0bdfc5c6273d3fb21cf8ae3d6ace2ee61afae
        );

        IVerifier.Proof memory proof = IVerifier.Proof(a, b, c);

        return verifier.verifyTx(proof);
    }
}
