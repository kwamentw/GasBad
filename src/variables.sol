// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Variable initialization gas optimization tricks
 * @author Kwame 4b
 * @notice This is a check to see whether if all the popular var optimisations actually save gas
 */
contract VarGas{

    // storage variables used for test
    uint256 s_varOne;
    uint256 s_varTwo;

    // public variables
    uint256 public s_varThree = type(uint8).max;
    uint256 internal s_varFour = type(uint8).max;

    //mapping
    mapping (address user => uint256 num) favNumber;

    constructor(){
        s_varTwo = type(uint8).max;
        favNumber[msg.sender]=44;
        favNumber[address(41)]=44;
        favNumber[address(42)]=44;
    }

    /**
     * Normal variable initialisation
     * With storage variables
     * gas spent - 27571
     */
    function firstFunc() public returns(uint256){
        s_varOne = thirdFunc();
        return s_varOne;
    }

    // Between firstFunc & secondFunc this code style is used alot so i just wanted to see the gas difference

    /**
     * Variable initialisation
     * with cache variables
     * gas spent - 5488
     */
    function secondFunc() public pure returns(uint256){
        uint256 varCache = thirdFunc();
        return varCache;
    }

    /**
     * Returns the value straight with no BS
     * gas spent - 5481
     */
    function thirdFunc() public pure returns(uint256){
        return type(uint8).max;
    }

    // Section to demonstrate caching a storage variable has no gas benefits 

    /**
     * Initialisation of storage variable to memory/cache variable
     * add uint16 max to the cache and return
     * gas spent - 7726
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
     * gas spent - 10671
     */
    function fifthFunc() public returns(uint256){
        s_varTwo += type(uint16).max;
        return s_varTwo;
    }

    /**
     * returning a public storage variable
     * gas spent - 7603
     */
    function sixFunc() public view returns(uint256){
        return s_varThree;
    }

    /**
     * Returns a private/internal variable
     * gas spent - 7602
     */
    function sevnFunc() public view returns(uint256){
        return s_varFour;
    }

    /**
     * check whether initialising mappns to cache variables will save us data
     * gas spent -7523
     */
    function eighthFunc() public view returns(uint256){
        uint256 cacheVar = favNumber[address(42)];
        return cacheVar;
    }

    /**
     * can this OG way be better than caching
     * gas spent -7500
     */
    function ninethFunc() public view returns(uint256){
        return favNumber[address(42)];
    }

    /**
     * checking to see gas different between this and unchecked wrap
     * gas spent: 7730
     */
    function tenthFunc() public view returns(uint256){
    uint256 result = favNumber[msg.sender] + type(uint16).max;
    return result;
    }

    /**
     * wrapping the calculation on an unchecked block to see whether there will be gas diff
     * gas spent: 7721
     */
    function eleventhFunc() public view returns(uint256){
        unchecked{
            uint256 result = favNumber[msg.sender] + type(uint16).max;

            return result;
        }
    }

//============ totally unrelated (about casting errors)==========//

    // this shit overflows because the a value is cast implicitly to uint24 because 167... is of type uint24 so the addition overflows before initialisation to output// only getaway is if a has a bigger type then 167.. will be cast to that type 
    function hiddenOverflow(uint8 a) public view returns(uint256 output){
        output = 16777210 + a;
    }

    // this will revert because a+b exceeds uint16 max
    function hiddenOverflow2(uint8 a, uint16 b) public view returns(uint256 output){
        output = a+b;
    }

    //this will revert uint8max + type(1days) will overflow
    function hiddenOverflow3(uint8 a) public view returns(uint256 output){
        output = 1 days * a;
    }
//===============================================================//
}