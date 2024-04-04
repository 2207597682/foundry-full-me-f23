// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {HelperConfig} from "./HelperConfig.s.sol";
import {FundMe} from "../src/FundMe.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
        address priceFeed = helperConfig.activeNetworkConfig();
        console.log("type;", msg.sender);
        vm.startBroadcast();
        FundMe fundMe = new FundMe(priceFeed);
        console.log("type6", address(fundMe));
        vm.stopBroadcast();
        return (fundMe, helperConfig);
    }
}
