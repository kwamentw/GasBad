// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title BITWISE ARITHMETIC OPERATIONS
 * @author Kwame 4b
 * @notice Heard bitwise operations are more gas efficient lets test it out 
 */
contract BitwiseOperations{
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

}