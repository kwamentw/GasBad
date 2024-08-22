//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

/**
 * @title For loop gas optimizations
 * @author Kwame 4b
 * @notice Testing to see whether popular loop gas optimisations really work
 */
contract ForGas {
    // dynamic array to be used in test
    uint256[] public collection;
    // length of the array;
    uint256 public collectionLength = 20;

    /**
     * this function uses array length caching and ++i instead of i++ gas optimisation
     *  gas spent - 479401 
     */
    function firstFunc() public {
        uint256 arrayLength = collectionLength;
        for (uint256 i=0; i<arrayLength; ++i){
            collection.push(i+11);
        }
    }

   /**
    * This function uses arraylength caching, unchecked math operation, ++i gas optimisation
    *  gas spent - 479445
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
     * gas spent with ++i - 481328
     * gas spent with i++ - 481328
     * safe to say No difference
     */
    function thirdFunc() public {
        for(uint256 i=0; i<collectionLength; i++/**++i */){
            collection.push(i+11);
        }
    }

    /**
     * The next section advises against using smaller data types like uint8
     * if your reason is to save gas 
     * instead use uint256 cos it cost less
     */

    //////////////////////////////////////////////////////////////////////////

    /**
     * Function using uint8 as a loop var
     * Gas Spent - 13087
     */
    function fourFunc() public returns(uint8) {
        uint8 beans = 50;
        uint8 rice;

        for(uint8 i=0; i<beans; i++){
            // for every rice add 2 beans
            rice += 2;
        }
        return rice;
    }

    /**
     * For loop using our normal uint256
     * from the test we will see that using uint256 is more gas savvy
     * Gas spent - 12427
     */
    function fifthFunc() public returns(uint256){
        uint256 beans = 50;
        uint8 rice;

        for(uint256 i=0; i<beans; i++){
            rice += 2;
        }
        return rice;
    }
}