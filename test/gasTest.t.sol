// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {console} from "forge-std/console.sol";
import {GasBad} from "../src/return.sol";
import {Reverts} from "../src/require.sol";
import {ForGas} from "../src/for.sol";
import {VarGas} from "../src/variables.sol";
import {BitwiseOperations} from "../src/bitwise.sol";
import {BitwiseAccessControls} from "../src/btiwiseAccessControl.sol";
import {EEEFF} from "../src/if.sol";

/**
 * @title Gas optimisations check test
 * @author Kwame 4B
 * @notice Test to check how much gas spent by the various functions 
 */

contract returnTest is Test {
    GasBad gasbad;
    Reverts rev;
    ForGas forResult;
    VarGas vargas;
    BitwiseOperations bitwise;
    BitwiseAccessControls btwsAccess;
    EEEFF eeff;

    function setUp() public {
        gasbad = new GasBad();
        rev = new Reverts();
        forResult = new ForGas();
        vargas = new VarGas();
        bitwise = new BitwiseOperations();
        eeff = new EEEFF();
    }
////////////////// Return Test  ////////////////////////////////
    function test_gas_firstFunc() public {
        vm.prank(address(44));
        gasbad.firstFunc(23,address(44));
    }

    function test_gas_secFunc() public {
        vm.prank(address(44));
        gasbad.secondFunc(23,address(44));
    }

///////////////////////// revert test //////////////////////////

    function test_rev_firstFunc() public {
        vm.prank(address(45));
        rev.firstFunc(address(45));
    }

    function test_rev_secFunc() public {
        vm.prank(address(45));
        rev.secondFunc(address(45));
    }

    function test_rev_thirdFunc() public {
        vm.expectRevert();
        rev.thirdFunc(address(45));
    }

    function test_rev_fourthFunc() public {
        vm.expectRevert();
        rev.fourthFunc(address(45));
    }

    function test_rev_fifthFunc() public view{
        rev.fifthFunc(23);
    }

    function test_rev_sixthFunc() public view{
        rev.sixthFunc(23);
    }

//////////////////////// for test //////////////////////////////

    function test_for_firstFunc() public{
        forResult.firstFunc();
    }

    function test_for_secFunc() public {
        forResult.secondFunc();
    }
    function test_for_thirdFunc() public {
        forResult.thirdFunc();
    }
////////////////// variable initialisation test /////////////////////////
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

    function test_overflow_init() public view{
        // vargas.hiddenOverflow(7);
        vargas.hiddenOverflow2(255,65325);
        // vargas.hiddenOverflow3(200);
    }

    function test_bitwise_bitDivFunc() public view {
        bitwise.bitwiseDivision(44);
    }
    function test_bitwise_divNormFunc() public view{
        bitwise.normalDivision(44);
    }

    function test_bitwise_bitMulFunc() public view {
        bitwise.bitwiseMultiplication(257);
    }

    function test_bitwise_normMulFunc() public view {
        bitwise.normalMultiplication(257);
    }

    function test_bitwise_bitModFunc() public view {
        bitwise.bitwiseModulo(515);
    }

    function test_bitwise_normModFunc() public view {
        bitwise.normalModulo(515);
    }

    function test_if_condi() public view {
        eeff.conditionalIf(23);
    }

    function test_if_nested() public view{
        eeff.nestedIf(40);
    }

    function testBiwiseAccessControls() public{
        btwsAccess._setRole(address(this),0);
        bool ok = btwsAccess._hasRole(address(this),1);
        assertTrue(ok);
    }
}
//============================================================//




