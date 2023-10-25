// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import "forge-std/Script.sol";

// Order type
import "composable/ComposableCoW.sol";
import {DutchAuction} from "../src/DutchAuction.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address composableCow = vm.envAddress("COMPOSABLE_COW");

        vm.startBroadcast(deployerPrivateKey);

        // Deploy DutchAuction
        new DutchAuction{salt: ""}(ComposableCoW(composableCow));
    }
}
