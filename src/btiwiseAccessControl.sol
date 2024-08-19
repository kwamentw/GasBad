// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
 * @title Bitwise Access Controls
 * @author Kwame4b
 * @notice this id faster and more efficient than the typical, i have not researched its pitfalls. i only know it works well
 */
contract BitwiseAccessControls{
    mapping(address => bytes32) public _addressRoles;

    /**
     * Bitwise operation to set role to an address
     * @param user address to receive role
     * @param role role to be received
     */
    function _setRole(address user, uint8 role) public  {
    uint256 roles = uint256(_addressRoles[user]);
    _addressRoles[user] = bytes32(roles | (1 << role));
    }

    /**
     * Bitwise operation to check whether user has role
     * @param user user to be checked whether he has role or not
     * @param role role to be checked against user
     */
    function _hasRole(address user, uint8 role) public view returns(bool) {
    uint256 roles = uint256(_addressRoles[user]);
    return (roles & (1 << role)) > 0;
    }
}