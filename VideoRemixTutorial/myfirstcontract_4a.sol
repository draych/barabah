pragma solidity ^0.5.0;
 
contract Transaction {
    event SenderLogger(address);
    event ValueLogger(uint);
    
    address private owner;
    
    constructor () public {
        owner = msg.sender;
    }
    
    modifier isOwner {
        require(owner == msg.sender, "not ownner.");
        _;
    }
    
    modifier isValidValue {
        assert(msg.value >= 1 ether);
        _;
    }
    
    function () external payable isOwner isValidValue {
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }
    
}