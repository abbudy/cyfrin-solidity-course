// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * @title SimpleStorage
 * @author Abdu Ahmed Mohammed (following Cyfrin Updraft — Patrick Collins)
 * @notice Module 1: Simple Storage — first complete Solidity contract
 * @dev Demonstrates: state variables, functions, arrays, structs, mappings
 *      Deployed and tested via Remix IDE
 */
contract SimpleStorage {

    // ─── State Variables ──────────────────────────────────────────────────
    // Default value is 0 — Solidity initializes all numbers to 0
    uint256 myFavouriteNumber;

    // ─── Struct ───────────────────────────────────────────────────────────
    // Custom type grouping name + favourite number
    struct Person {
        uint256 favouriteNumber;
        string  name;
    }

    // ─── Arrays ───────────────────────────────────────────────────────────
    // Dynamic array of Person structs
    Person[] public listOfPeople;

    // ─── Mapping ──────────────────────────────────────────────────────────
    // Maps a name (string) to a favourite number (uint256)
    mapping(string => uint256) public nameToFavouriteNumber;

    // ─── Functions ────────────────────────────────────────────────────────

    /**
     * @notice Store a new favourite number
     * @param _favouriteNumber The number to store on-chain
     */
    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }

    /**
     * @notice Retrieve the stored favourite number
     * @return The currently stored favourite number
     */
    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }

    /**
     * @notice Add a person with their favourite number to the list
     * @param _name      The person's name
     * @param _favouriteNumber Their favourite number
     *
     * Memory locations:
     *  - calldata : read-only, cheaper gas (can't be modified in function)
     *  - memory   : temporary, can be modified in function
     *  - storage  : persistent on-chain (default for state vars)
     *
     * Strings are reference types — must specify memory location
     */
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
