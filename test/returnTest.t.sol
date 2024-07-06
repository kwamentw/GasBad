// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {GasBad} from "../src/return.sol";

contract returnTest is Test {
    GasBad gasbad;
    function setUp() public {
        gasbad = new GasBad();
    }

    function test_gas_firstFunc() public {
        vm.prank(address(44));
        gasbad.firstFunc(23,address(44));
    }

    function test_gas_secFunc() public {
        vm.prank(address(44));
        gasbad.secondFunc(23,address(44));
    }
}