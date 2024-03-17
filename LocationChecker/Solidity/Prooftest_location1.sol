// SPDX-License-Identifier: MIT
// latitude = 53, longitude = 3
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
                0x1626db6c8466ddab9de279dbd04ba1fd71f1bff9759da07e3e1498e46a127c0b,
                0x036b602303b384cff427af386a0af3b4a2907e99fd64f57dd6e992a02c22139e
            ),
            b: IVerifier.G2Point(
                [0x1fe260e0c981626027aa4c6e6e3a46d189d71b68aaaa91ae1b9cd0b510320eb7, 0x074cf65cd17cefa57b376f12f2682e683348bf3f983574008e3d1afc3b679b15],
                [0x15532d1fab7312e7113791aa4faccab3fac049f9b2f309b294f040c0aaf7bcca, 0x27b375bfe62f936ba07a854fbaf70ed5dfe7ed0ddba5a82ffa901ec6a814fa70]
            ),
            c: IVerifier.G1Point(
                0x1368f32b8379be72b340a99c586ce99d17ca731ca10f805c51c8d51389dae586,
                0x0d9d0e9af270862f3561725197c113bf2fffdbed067ce99948ed940ac40ce26a
            )
        });

        // Attempt to verify the proof
        bool verified = verifier.verifyTx(proof);
        return verified;
    }
}
