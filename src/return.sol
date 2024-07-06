// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GasBad {
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
    function secondFunc(uint256 a, address user) public view returns(uint256 result,address sender){
        if (msg.sender == user){
            sender = user;
            result = a + type(uint16).max;
        }else {
            revert("No fella");
        }  
    }
}
