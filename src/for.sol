//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

/**
 * @title For loop gas optimizations
 * @author Kwame 4b
 * @notice Testing to see whether popular gas tricks really work
 */
contract ForGas {
    uint256[] public collection;
    uint256 public collectionLength = 20;

    function firstFunc() public {
        uint256 arrayLength = collectionLength;
        for (uint256 i=0; i<arrayLength; ++i){
            collection.push(i+11);
        }
    }

    function secondFunc() public{
        uint256 arrayLength = collectionLength;
        for(uint256 i=0; i<arrayLength;){
            collection.push(i+11);
            unchecked {
                ++i;
            }
        }
    }
}