// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Conditional IF vs Nested IF
 * @author Kwame 4b
 * @notice Checking the most gas spent between conditional if and nested if.
 */
contract EEEFF {
    
    /**
     * Conditonal IF
     * @param number input we are validating
     * Gas spent - 5839 [same value when for function returning both true & false]
     */
    function conditionalIf(uint8 number) public pure returns(bool){
        if(number>0 && number<type(uint8).max && (number%2) ==1){
            return true;
        }
        return false;
    }

    /**
     * Nested IF
     * @param number input we are validating
     * Gas spent - 5696 [when function returns true]
     * Gas spent - 5697 [when function returns false]
     */
    function nestedIf(uint8 number) public pure returns(bool){
        if (number>0){
            if(number<type(uint8).max){
                if(number%2 == 1){
                    return true;
                }
            }
        }
        return false;
    }
}