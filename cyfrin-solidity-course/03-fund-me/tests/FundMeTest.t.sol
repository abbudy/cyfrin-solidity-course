// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../contracts/FundMe.sol";

/**
 * @title FundMeTest
 * @notice Foundry unit tests for FundMe contract
 * @dev Uses a mock price feed — no Chainlink dependency needed for local tests
 */

// ─── Mock Price Feed ────────────────────────────────────────────────────────
contract MockV3Aggregator {
    uint8  public decimals = 8;
    int256 public latestAnswer;

    constructor(int256 _initialAnswer) {
        latestAnswer = _initialAnswer;
    }

    function latestRoundData()
        external
        view
        returns (uint80, int256, uint256, uint256, uint80)
    {
        return (0, latestAnswer, 0, 0, 0);
    }

    function version() external pure returns (uint256) { return 4; }
}

// ─── Tests ──────────────────────────────────────────────────────────────────
contract FundMeTest is Test {
    FundMe       fundMe;
    MockV3Aggregator mockFeed;

    address USER    = makeAddr("user");
    address OWNER;
    uint256 constant SEND_VALUE    = 0.1 ether;
    uint256 constant STARTING_BALANCE = 10 ether;

    // ETH price: $2000 with 8 decimals = 200000000000
    int256  constant ETH_USD_PRICE = 2000e8;

    function setUp() public {
        mockFeed = new MockV3Aggregator(ETH_USD_PRICE);
        fundMe   = new FundMe(address(mockFeed));
        OWNER    = fundMe.getOwner();
        vm.deal(USER, STARTING_BALANCE);
    }

    // ── Deployment Tests ────────────────────────────────────────────────────
    function testOwnerIsDeployer() public view {
        assertEq(fundMe.getOwner(), address(this));
    }

    function testMinimumUsdIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    // ── Fund Tests ──────────────────────────────────────────────────────────
    function testFundFailsWithoutEnoughEth() public {
        vm.expectRevert();
        fundMe.fund{value: 0}();   // $0 — below $5 minimum
    }

    function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();
        assertEq(fundMe.getAddressToAmountFunded(USER), SEND_VALUE);
    }

    function testAddsFunderToArray() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();
        assertEq(fundMe.getFunder(0), USER);
    }

    // ── Withdraw Tests ──────────────────────────────────────────────────────
    function testOnlyOwnerCanWithdraw() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();

        vm.prank(USER);
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testWithdrawWithSingleFunder() public {
        uint256 startOwnerBalance    = OWNER.balance;
        uint256 startContractBalance = address(fundMe).balance;

        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();

        vm.prank(OWNER);
        fundMe.withdraw();

        assertEq(address(fundMe).balance, 0);
        assertEq(OWNER.balance, startOwnerBalance + startContractBalance + SEND_VALUE);
    }
}
