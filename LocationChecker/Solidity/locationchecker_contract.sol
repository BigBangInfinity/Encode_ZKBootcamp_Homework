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

contract ProofChecker {
    IVerifier public verifier;
    string[] public strings;
    uint256[] public timestamps;    

    constructor(address _verifierAddress) {
        verifier = IVerifier(_verifierAddress);
    }

    function checkProof(IVerifier.Proof memory proof) public view returns (bool) {
        return verifier.verifyTx(proof);
    }

    function writeString(string memory _string, IVerifier.Proof memory proof) public {
        require(verifier.verifyTx(proof));
        strings.push(_string);
        timestamps.push(block.timestamp); // Record the current block's timestamp
    }    

}
