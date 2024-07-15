// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {GasBad} from "../src/return.sol";
import {Reverts} from "../src/require.sol";
import {ForGas} from "../src/for.sol";
import {VarGas} from "../src/variables.sol";

/**
 * @title Gas optimisations check test
 * @author Kwame 4b
 * @notice Test to check how much gas spent by the various functions 
 */

contract returnTest is Test {
    GasBad gasbad;
    Reverts rev;
    ForGas forResult;
    VarGas vargas;

    function setUp() public {
        gasbad = new GasBad();
        rev = new Reverts();
        forResult = new ForGas();
        vargas = new VarGas();
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
    function test_for_thirdFunc() public {
        forResult.thirdFunc();
    }
    function test_vargas_firstFunc() public  {
        vargas.firstFunc();
    }
    function test_vargas_secFunc() public view {
        vargas.secondFunc();
    }
    function test_vargas_thirdFunc() public view{
        vargas.thirdFunc();
    }
    function test_vargas_fourthFunc() public view{
        vargas.fourthFunc();
    }
    function test_vargas_fifthFunc() public {
        vargas.fifthFunc();
    }
    function test_vargas_sixFunc() public view{
        vargas.sixFunc();
    }
    function test_vargas_sevnFunc() public view{
        vargas.sevnFunc();
    }
    function test_vargas_eigthFunc() public view{
        vargas.eighthFunc();
    }

    function test_vargas_ninethFunc() public view {
        vargas.ninethFunc();
    }

    function test_vargas_tenthFunc() public view {
        vargas.tenthFunc();
    }

    function test_vargas_eleventhFunc() public view{
        vargas.eleventhFunc();
    }

}