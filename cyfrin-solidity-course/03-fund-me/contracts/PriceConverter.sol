// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Chainlink Price Feed interface
// Import from: @chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol
interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (
            uint80  roundId,
            int256  answer,      // price with 8 decimals (e.g. 200000000000 = $2000.00)
            uint256 startedAt,
            uint256 updatedAt,
            uint80  answeredInRound
        );
}

/**
 * @title PriceConverter
 * @author Abdu Ahmed Mohammed (following Cyfrin Updraft — Patrick Collins)
 * @notice Module 3: FundMe — Solidity Library for ETH/USD price conversion
 * @dev This is a LIBRARY — cannot hold state, all functions must be internal
 *      Used as: using PriceConverter for uint256;
 *
 * Chainlink ETH/USD Sepolia feed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
 */
library PriceConverter {

    /**
     * @notice Get the current ETH price in USD (18 decimal precision)
     * @param priceFeed The Chainlink AggregatorV3Interface address
     * @return price ETH/USD price scaled to 18 decimals
     */
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        // Chainlink returns 8 decimals: e.g. 200000000000 = $2000.00000000
        // We want 18 decimals to match wei precision → multiply by 1e10
        return uint256(answer * 1e10);
    }

    /**
     * @notice Convert a Wei amount to its USD value
     * @param ethAmountInWei  The ETH amount in wei
     * @param priceFeed       The Chainlink price feed
     * @return ethAmountInUsd The USD equivalent (18 decimal precision)
     */
    function getConversionRate(
        uint256 ethAmountInWei,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        // Both ethPrice and ethAmountInWei have 18 decimals
        // Dividing by 1e18 gives the correct dollar amount
        uint256 ethAmountInUsd = (ethPrice * ethAmountInWei) / 1e18;
        return ethAmountInUsd;
    }
}
