// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title BITWISE ARITHMETIC OPERATIONS
 * @author Kwame 4b
 * @notice Heard bitwise operations are more gas efficient lets test it out 
 */
contract bitwiseOperations{
    /**
     * Bitwise operation to replace division
     * looks like >> 1 = 2^1 and >> 4 = 2^2
     * @param victim number to slash
     */
    function bitwiseDivision(uint256 victim) public pure returns (uint256){
        // uint256 result = victim >> 1
        uint256 result = victim >> 2;
        return result;
    }

    /**
     * normal division to compare the two
     * @param victim number to slash
     */
    function normalDivision(uint256 victim) public pure returns(uint256){
        // uint256 result = victim / 2
        uint256 result = victim/4;
        return result;
    }
}