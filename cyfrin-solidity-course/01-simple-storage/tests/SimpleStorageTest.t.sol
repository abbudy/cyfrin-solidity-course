// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {SimpleStorage} from "../contracts/SimpleStorage.sol";

/**
 * @title SimpleStorageTest
 * @notice Foundry tests for SimpleStorage contract
 */
contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function testStoreAndRetrieve() public {
        simpleStorage.store(7);
        assertEq(simpleStorage.retrieve(), 7);
    }

    function testDefaultValueIsZero() public view {
        assertEq(simpleStorage.retrieve(), 0);
    }

    function testAddPerson() public {
        simpleStorage.addPerson("Patrick", 7);
        assertEq(simpleStorage.nameToFavouriteNumber("Patrick"), 7);
    }

    function testAddMultiplePeople() public {
        simpleStorage.addPerson("Alice", 42);
        simpleStorage.addPerson("Bob", 99);
        assertEq(simpleStorage.nameToFavouriteNumber("Alice"), 42);
        assertEq(simpleStorage.nameToFavouriteNumber("Bob"), 99);
    }

    function testFuzzStore(uint256 favNum) public {
        simpleStorage.store(favNum);
        assertEq(simpleStorage.retrieve(), favNum);
    }
}
