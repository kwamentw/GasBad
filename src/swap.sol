// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Swap contract
 * @author Kwame4b
 * @notice A swap contract comparing two techniques to check for one that spends less gas
 */
contract Swap{

    // first variable to swap
    uint256 varI = 45;
    // second variable to swap
    uint256 varII =104;

    /**
     * Typical swap function with a temp variable 
     * @return varI that has been swapped with varII
     * @return varII that has been swapped with varI
     */
    function swap_One() external returns(uint256,uint256){
        uint256 temp;
        temp = varI;
        varI = varII;
        varII=temp;

        return(varI,varII);
    }

    /**
     * Gas optimised swap function in a single line
     * @return varI that has been swapped with varII
     * @return varII that has been swapped with varI
     */
    function swap_Two() external returns(uint256,uint256){
        (varI,varII) = (varII,varI);

        return (varI,varII);
    } 
}