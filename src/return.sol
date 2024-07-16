// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title return type gas optimisation tricks
 * @author Kwame 4B
 * @notice testing our various return styles to see which is gas efficient
 */
contract GasBad {
    /**
     * uninitialized return variables(GAS GOOD)
     * @param a first param
     * @param user second param
     * @return result of a + uint16 max
     * @return sender if msg.sender is equal to user
     * @dev gas spent - 8628 wei
     */
    function firstFunc(uint256 a, address user) public view returns(uint256, address){
        address sender;
        uint256 result;
        if(msg.sender == user){
             sender = user;
             result = a + type(uint16).max;
        }else{
            revert("No fella");
        }
        return (result,sender);
    }

    /**
     * initialised return variables in function declaration(GAS BAD)
     * @param a first param
     * @param user second param
     * @return result of a uint16 max
     * @return sender if msg.sender is equal to user
     * @dev gas spent - 8685 wei meaning previous function gas better
     */
    function secondFunc(uint256 a, address user) public view returns(uint256 result,address sender){
        if (msg.sender == user){
            sender = user;
            result = a + type(uint16).max;
        }else {
            revert("No fella");
        }  
    }
}
