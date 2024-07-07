// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {GasBad} from "../src/return.sol";
import {Reverts} from "../src/require.sol";
import {ForGas} from "../src/for.sol";

contract returnTest is Test {
    GasBad gasbad;
    Reverts rev;
    ForGas forResult;

    function setUp() public {
        gasbad = new GasBad();
        rev = new Reverts();
        forResult = new ForGas();
    }

    function test_gas_firstFunc() public {
        vm.prank(address(44));
        gasbad.firstFunc(23,address(44));
    }

    function test_gas_secFunc() public {
        vm.prank(address(44));
        gasbad.secondFunc(23,address(44));
    }

    function test_rev_firstFunc() public {
        vm.prank(address(45));
        rev.firstFunc(address(45));
    }

    function test_rev_secFunc() public {
        vm.prank(address(45));
        rev.secondFunc(address(45));
    }

    function test_for_firstFunc() public{
        forResult.firstFunc();
    }

    function test_for_secFunc() public {
        forResult.secondFunc();
    }

}