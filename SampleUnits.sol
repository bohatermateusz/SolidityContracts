// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract SampleUnits {
    modifier betweenOneAndTwoEth() {
        require(msg.value>= 1 ether && msg.value <= 2 ether);
        _;
    }

    uint runUnitTimestamp;
    uint startTimestamp;

    constructor(uint startTimestamp) {
        startTimestamp = block.timestamp + (startInDays *24 *60 *60);
        runUntilTimestamp = startTimestamp + (7 days);
    }
    
}