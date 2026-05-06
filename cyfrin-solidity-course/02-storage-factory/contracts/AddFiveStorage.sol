// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

/**
 * @title AddFiveStorage
 * @author Abdu Ahmed Mohammed (following Cyfrin Updraft — Patrick Collins)
 * @notice Module 2: Storage Factory — demonstrates Solidity Inheritance
 * @dev Inherits from SimpleStorage and OVERRIDES the store() function
 *      to always add 5 to whatever number is stored
 */
contract AddFiveStorage is SimpleStorage {

    /**
     * @notice Override store() to add 5 to every stored number
     * @dev `override` keyword required when overriding a `virtual` parent function
     */
    function store(uint256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    }
}
