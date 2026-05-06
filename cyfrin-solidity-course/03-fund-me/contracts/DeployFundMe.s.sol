// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../contracts/FundMe.sol";

/**
 * @title DeployFundMe
 * @notice Foundry deployment script for FundMe
 *
 * Run on Sepolia:
 *   forge script script/DeployFundMe.s.sol \
 *     --rpc-url $SEPOLIA_RPC_URL \
 *     --private-key $PRIVATE_KEY \
 *     --broadcast --verify
 */
contract DeployFundMe is Script {
    // Chainlink ETH/USD price feed addresses
    address constant SEPOLIA_PRICE_FEED = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
    address constant MAINNET_PRICE_FEED = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;

    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe(SEPOLIA_PRICE_FEED);
        vm.stopBroadcast();
        return fundMe;
    }
}
