// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Variable initialization gas optimization test tricks
 * @author Kwame 4b
 * @notice This is a test to see whether if all the popular tricks actually save gas
 */
contract VarGas{

    // storage variables used for test
    uint256 s_varOne;
    uint256 s_varTwo;

    // public variables
    uint256 public s_varThree = type(uint8).max;
    uint256 internal s_varFour = type(uint8).max;

    constructor(){
        s_varTwo = type(uint8).max;
    }

    /**
     * Normal variable initialisation
     * With storage variables
     * gas spent - 27470
     */
    function firstFunc() public returns(uint256){
        s_varOne = thirdFunc();
        return s_varOne;
    }

    // Between firstFunc & secondFunc this code style is used alot so i just wanted to see the gas difference

    /**
     * Variable initialisation
     * with cache variables
     * gas spent - 5420
     */
    function secondFunc() public pure returns(uint256){
        uint256 varCache = thirdFunc();
        return varCache;
    }

    /**
     * Returns the value straight with no BS
     * gas spent - 5435
     */
    function thirdFunc() public pure returns(uint256){
        return type(uint8).max;
    }

    // Section to demonstrate caching a storage variable has no gas benefits 

    /**
     * Initialisation of storage variable to memory/cache variable
     * add uint16 max to the cache and return
     * gas spent - 7670
     * when you add line 59 incase you want a persistent state gas spent is 10790
     *  - killing the purpose of caching the var
     *  - so use `fifthFunc` to save 210
     */
    function fourthFunc() public view returns(uint256){
        uint256 cacheVar = s_varTwo;
        cacheVar += type(uint16).max;
        // s_varTwo += cacheVar;
        return cacheVar;
    }

    /**
     * Adding straight to the storage var and returning
     * gas spent - 10580
     */
    function fifthFunc() public returns(uint256){
        s_varTwo += type(uint16).max;
        return s_varTwo;
    }

    /**
     * returning a public storage variable
     * gas spent - 7558
     */
    function sixFunc() public view returns(uint256){
        return s_varThree;
    }

    /**
     * Returns a private/internal variable
     * gas spent - 7580
     */
    function sevnFunc() public view returns(uint256){
        return s_varFour;
    }


}