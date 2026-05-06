// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

/**
 * @title StorageFactory
 * @author Abdu Ahmed Mohammed (following Cyfrin Updraft — Patrick Collins)
 * @notice Module 2: Storage Factory
 * @dev Demonstrates: deploying contracts from contracts, interacting with ABIs,
 *      contract composition, imports
 */
contract StorageFactory {

    // Array to keep track of all deployed SimpleStorage contracts
    SimpleStorage[] public listOfSimpleStorageContracts;

    /**
     * @notice Deploy a brand new SimpleStorage contract and track it
     */
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    /**
     * @notice Store a favourite number in a specific SimpleStorage contract
     * @param _simpleStorageIndex Index in our array
     * @param _newSimpleStorageNumber The number to store
     */
    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        // To interact with another contract you need:
        //  1. The contract's ADDRESS
        //  2. The contract's ABI (Application Binary Interface)
        listOfSimpleStorageContracts[_simpleStorageIndex].store(
            _newSimpleStorageNumber
        );
    }

    /**
     * @notice Retrieve the stored number from a specific SimpleStorage contract
     * @param _simpleStorageIndex Index in our array
     * @return The stored number
     */
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
