pragma solidity ^0.5.0;

interface Regulator {
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    modifier ownerFunc {
        require(owner == msg.sender, "bukan owner");
        _;
    }
    
    constructor (uint amount) public {
        value = amount;
        owner = msg.sender;
    } 
    
    function deposit(uint amount) public ownerFunc {
        value += amount;
    }  
    
    function withdraw(uint amount) public ownerFunc {
        if (checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() public view returns(uint) {
        return value;
    }
    
    function checkValue(uint amount) public returns(bool) {
        return value >= amount;
    }
    
    function loan() public returns(bool) {
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint private age;
    
    function setName(string memory newName) public {
        name = newName;
    }
    
    function getName() public view returns(string memory) {
        return name;
    }
 
    function setAge(uint newAge) public {
        age = newAge;
    }   
    
    function getAge() public view returns(uint) {
        return age;
    }
    
}