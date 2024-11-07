contract MyContract {
    
    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer(address to, uint amount) public {
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function someCryptoFunctionName(address _addr) public view returns(uint) {
        return balance[_addr];
    }

}