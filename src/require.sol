// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Error handling gas optimization tricks
 * @author Kwame 4b
 * @notice Testing your typical trick to see how much it saves us by
 */
contract Reverts{
    error accessDenied();
    // no revert - 8313 wei
    // revert - 5511 wei
    function firstFunc(address user)  public view {
        if (user != msg.sender){
            revert accessDenied();
        }
    }

    // no revert - 8346 wei
    // revert - 5613 wei
    function secondFunc(address user) public view{
        require(user == msg.sender,"accessDenied"); 
    }
}
