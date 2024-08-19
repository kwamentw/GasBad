// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Error handling gas optimization tricks
 * @author Kwame 4b
 * @notice Testing your typical optimisations to see how much gas it saves us by
 */
contract Reverts{
    error accessDenied();

    /**
     * This function uses custom defined error
     * @param user address of user
     * when function doesn't revert - gas spent - 8390 wei
     * when function reverts - gas spent - 5588 wei
     */
    function firstFunc(address user)  public view {
        if (user != msg.sender){
            revert accessDenied();
        }
    }

    /**
     * This function uses require
     * @param user address of user
     * when function does not revert - gas spent - 8434 wei
     * when function reverts - gas spent - 5713 wei
     */
    function secondFunc(address user) public view{
        require(user == msg.sender,"accessDenied"); 
    }

    /**
     * Third and fourth function demonstrates that;
     * longer revert strings in require checks consume more gas
     * in custom reverts it doesn't happen
     */

    /**
     * This is the require check with the short error string
     * @param admin admin address 
     * Gas spent - 8488
     * Gas spent with revert message - 5647
     */
    function thirdFunc(address admin) external view{
        require(admin == msg.sender,"notAdmin!");
    }

    /**
     * The require check with the longer error string
     * @param admin admin address
     * Gas spent - 8619
     * Gas spent with revert message - 5778
     */
    function fourthFunc(address admin) external view{
        require(admin == msg.sender,"He is not the Admin");
    }

    /**
     * NEXT SECTION - Fifth and sixth function
     * use multiple require statements instead of  interconnected &&s
     */

    /**
     * function with the interconnected &&'s in the require statement
     * @param value value to test
     * Gas spent - 5973
     * when it reverts with no error message, Gas spent - 5525
     * when it reverts with an error string(as stated), Gas spent - 5675
     */
    function fifthFunc(uint8 value) external pure returns(uint8){
        require(value < type(uint8).max && value % 2 == 0 && ((value +1)%2) != 0 && value > 0, "OddNumber/Overflow");
        return value;
    }

    /**
     * Function with repetitive require statements and no &&s 
     * @param value value to test
     * Gas spent - 5915
     * when it reverts with no error message, Gas spent - 5443
     * when it reverts with an error string(as stated), Gas spent - 5593
     */
    function sixthFunc(uint8 value) external pure returns(uint8){
        require(value < type(uint8).max, "OddNumber/Overflow");
        require(value % 2 == 0, "OddNumber/Overflow");
        require(((value+1)%2) != 0, "OddNumber/Overflow");
        require(value>0, "OddNumber/Overflow");

        return value;
    }
}
