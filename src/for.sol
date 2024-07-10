//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

/**
 * @title For loop gas optimizations
 * @author Kwame 4b
 * @notice Testing to see whether popular gas tricks really work
 */
contract ForGas {
    // dynamic array to be used in test
    uint256[] public collection;
    // length of the array;
    uint256 public collectionLength = 20;

    /**
     * this function uses array length caching and ++i instead of i++ gas optimisation
     *  gas spent - 479245 
     */
    function firstFunc() public {
        uint256 arrayLength = collectionLength;
        for (uint256 i=0; i<arrayLength; ++i){
            collection.push(i+11);
        }
    }

   /**
    * This function uses arraylength caching, unchecked math operation, ++i gas optimisation
    *  gas spent - 479311
    */
    function secondFunc() public{
        uint256 arrayLength = collectionLength;
        for(uint256 i=0; i<arrayLength;){
            collection.push(i+11);
            unchecked {
                ++i;
            }
        }
    }

    /**
     * This is what a typical for loop, "they advise against" looks like
     * gas spent with ++i - 481350
     * gas spent with i++ - 481350
     * safe to say No difference
     */
    function thirdFunc() public {
        for(uint256 i=0; i<collectionLength; i++/**++i */){
            collection.push(i+11);
        }
    }
}