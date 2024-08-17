// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title BITWISE ARITHMETIC OPERATIONS
 * @author Kwame 4b
 * @notice Heard bitwise operations are more gas efficient lets test it out 
 */
contract BitwiseOperations{

    // mapping(address => bytes32) public _addressRoles;
    /**
     * Bitwise operation to replace division
     * looks like >> 1 = 2^1 == /2 and >> 4 = 2^2 == /4
     * @param victim number to slash
     * Gas used - 5440
     */
    function bitwiseDivision(uint256 victim) public pure returns (uint256 result){
        // uint256 result = victim >> 1
         result = victim >> 2;
        
    }

    /**
     * Bitwise operation to replace multiplication
     * However i think its only in weird numbers like << 3 = * 8 = * 2^3 
     * @param victim The number 8 is multiplying
     * Gas used - 5462
     */
    function bitwiseMultiplication(uint256 victim) public pure returns(uint256 result){
        result = victim << 3;
    }

    /**
     * Bitwise operation to replace `victim modulo 256` == `victim & 0xff`
     * 0xff is 255
     * In bitwise modulo operations, the modulo number is the modulo number minus 1 in hexadecimal
     * That is modulo 256 == & 0xff == & 255 in decimal, again modulo 8 == & 0b111 == & 7 in decimal
     * it is done because that is the mask need for the operation and the actual number n hex wraps around to all zeros and can't be used
     * Gas used - 5496
     * @param victim number to find the modulo of
     */
    function bitwiseModulo(uint256 victim) public pure returns(uint256 results){
        results = victim & 0xff;
        // results = victim & 0xb111;
    }

    /**
     * normal division to compare the two
     * @param victim number to slash
     * Gas used - 5515
     */
    function normalDivision(uint256 victim) public pure returns(uint256 result){
        // uint256 result = victim / 2
        result = victim/4;
        
    }

    /**
     * Just normal multiplication
     * @param victim number 8 is multiplying
     * Gas spent - 5636
     */
    function normalMultiplication(uint256 victim) public pure returns(uint256 result){
        result = victim * 8;
    }

    /**
     * normal modulo operation in maths
     * Gas used - 5625
     * @param victim number to run modulo against
     */
    function normalModulo(uint256 victim) public pure returns (uint256 result){
        result = victim % 256;
        // result = victim % 8;
    }












        // POC for something
    
    // function CCIP(address contractAddress, uint64 chainSelector) public pure returns(bytes32) {
    //     return bytes32(
    //         uint256(uint160(contractAddress)) |
    //         (uint256(chainSelector) << 160)
    //     );
    // }

    //     function _setRole(address user, uint8 role, bool status) public  {
    //     uint256 roles = uint256(_addressRoles[user]);
    //     _addressRoles[user] = bytes32(roles | (1 << role));
    // }

    //     function _hasRole(address user, uint8 role) public view returns(bool) {
    //     uint256 roles = uint256(_addressRoles[user]);
    //     return (roles & (1 << role)) > 0;
    // }

}