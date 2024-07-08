// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

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
        return cacheVar;
    }

    function fifthFunc() public view returns(uint256){
        return s_varTwo;
    }


}