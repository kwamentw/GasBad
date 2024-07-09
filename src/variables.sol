// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Variable initialization gas optimization test tricks
 * @author Kwame 4b
 * @notice This is a test to see whether if all the popular tricks actually save gas
 */
contract VarGas{
    uint256 s_varOne;
    uint256 s_varTwo;

    constructor(){
        s_varTwo = type(uint8).max;
    }

    function firstFunc() public returns(uint256){
        s_varOne = thirdFunc();
        return s_varOne;
    }

    function secondFunc() public pure returns(uint256){
        uint256 varCache = thirdFunc();
        return varCache;
    }

    function thirdFunc() public pure returns(uint256){
        return type(uint8).max;
    }

    // caching a storage variable has no gas benefits 

    function fourthFunc() public view returns(uint256){
        uint256 cacheVar = s_varTwo;
        cacheVar += type(uint16).max;
        return cacheVar;
    }

    function fifthFunc() public returns(uint256){
        s_varTwo += type(uint16).max;
        return s_varTwo;
    }


}