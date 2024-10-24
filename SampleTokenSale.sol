// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;


abstract contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public view virtual returns (uint8);
}


contract TokenSale {

    uint public tokenPriceInWei = 1 ether;
    ERC20 public token;
    address public tokenOwner;

    constructor(address _token) {
        tokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseACoffe() public payable {
        require(msg.value >= tokenPriceInWei, "Not enought money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint reminder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer);
        payable(msg.sender).transfer(reminder);
    }

    
}