// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter, AggregatorV3Interface} from "./PriceConverter.sol";

/**
 * @title FundMe
 * @author Abdu Ahmed Mohammed (following Cyfrin Updraft — Patrick Collins)
 * @notice Module 3: FundMe — Accept ETH funding with a minimum USD threshold
 *         Owner can withdraw all funds at any time.
 * @dev Demonstrates:
 *      - Sending ETH to a contract (payable)
 *      - Chainlink price feeds (oracles)
 *      - Custom errors (gas-efficient vs require strings)
 *      - Modifiers
 *      - Immutable & constant variables
 *      - Receive / fallback
 *      - Library usage (PriceConverter)
 */
contract FundMe {

    // ─── Library ─────────────────────────────────────────────────────────────
    // Attaches PriceConverter functions to uint256
    // So we can call ethAmount.getConversionRate(priceFeed)
    using PriceConverter for uint256;

    // ─── Custom Errors (gas-efficient) ────────────────────────────────────────
    error FundMe__NotOwner();
    error FundMe__NotEnoughEth();
    error FundMe__WithdrawFailed();

    // ─── Constants (cheaper gas than regular variables) ───────────────────────
    // MINIMUM_USD: $5 with 18 decimal places
    uint256 public constant MINIMUM_USD = 5e18;

    // ─── Immutables (set once in constructor, cheaper than storage) ───────────
    address private immutable i_owner;
    AggregatorV3Interface private immutable i_priceFeed;

    // ─── State ────────────────────────────────────────────────────────────────
    address[] private s_funders;
    mapping(address funder => uint256 amountFunded) private s_addressToAmountFunded;

    // ─── Events ───────────────────────────────────────────────────────────────
    event Funded(address indexed funder, uint256 amount);
    event Withdrawn(address indexed owner, uint256 amount);

    // ─── Modifier ─────────────────────────────────────────────────────────────
    modifier onlyOwner() {
        if (msg.sender != i_owner) revert FundMe__NotOwner();
        _;
    }

    // ─── Constructor ──────────────────────────────────────────────────────────
    constructor(address priceFeedAddress) {
        i_owner    = msg.sender;
        i_priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    // ─── Fund Function ────────────────────────────────────────────────────────
    /**
     * @notice Send ETH to this contract — must be at least $5 USD worth
     */
    function fund() public payable {
        // msg.value is in wei (18 decimals)
        // getConversionRate comes from the PriceConverter library
        if (msg.value.getConversionRate(i_priceFeed) < MINIMUM_USD) {
            revert FundMe__NotEnoughEth();
        }

        s_funders.push(msg.sender);
        s_addressToAmountFunded[msg.sender] += msg.value;
        emit Funded(msg.sender, msg.value);
    }

    // ─── Withdraw ─────────────────────────────────────────────────────────────
    /**
     * @notice Owner withdraws all funds — gas-optimized version
     * @dev Uses memory cache to avoid repeated storage reads
     */
    function withdraw() public onlyOwner {
        uint256 fundersLength = s_funders.length;

        // Reset all balances
        for (uint256 funderIndex = 0; funderIndex < fundersLength; funderIndex++) {
            address funder = s_funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }

        // Reset the funders array
        s_funders = new address[](0);

        // Transfer all ETH to owner (recommended: call pattern)
        uint256 contractBalance = address(this).balance;
        (bool callSuccess, ) = payable(i_owner).call{value: contractBalance}("");
        if (!callSuccess) revert FundMe__WithdrawFailed();

        emit Withdrawn(i_owner, contractBalance);
    }

    // ─── Fallback & Receive ───────────────────────────────────────────────────
    // If someone sends ETH directly without calling fund(), route to fund()
    receive()  external payable { fund(); }
    fallback() external payable { fund(); }

    // ─── Getters (view functions) ─────────────────────────────────────────────
    function getOwner() public view returns (address) {
        return i_owner;
    }

    function getFunder(uint256 index) public view returns (address) {
        return s_funders[index];
    }

    function getAddressToAmountFunded(address funder) public view returns (uint256) {
        return s_addressToAmountFunded[funder];
    }

    function getPriceFeed() public view returns (AggregatorV3Interface) {
        return i_priceFeed;
    }

    function getVersion() public view returns (uint256) {
        return i_priceFeed.version();
    }
}
