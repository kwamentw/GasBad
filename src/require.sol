// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Error handling gas optimization tricks
 * @author Kwame 4b
 * @notice Testing your typical trick to see how much it saves us by
 */
contract Reverts{
    error accessDenied();

    /**
     * This function uses custom defined error
     * @param user address of user
     * when function doesn't revert - gas spent - 8313 wei
     * when function reverts - gas spent - 5511 wei
     */
    function firstFunc(address user)  public view {
        if (user != msg.sender){
            revert accessDenied();
        }
    }

    /**
     * This function uses require
     * @param user address of user
     * when function does not revert - gas spent - 8346 wei
     * when function reverts - gas spent - 5613 wei
     */
    function secondFunc(address user) public view{
        require(user == msg.sender,"accessDenied"); 
    }
}
