pragma solidity ^0.4.23;

contract Splitter{

    mapping(address => uint)balances;
    address owner;

    constructor () public payable{
        
        owner = msg.sender;
    }

    function split(address person1,address person2) public payable {

        require(person1!=0 && person2!=0);
        require(msg.value > 0 wei);

        uint sendAmount = msg.value/2;

        balances[person1] += sendAmount + ((msg.value%2 != 0)? 1 wei : 0 wei);
        balances[person2] += sendAmount;

    }

    function withdraw() public {

        require(balances[msg.sender] > 0);
        uint sendAmount  = balances[msg.sender];

        balances[msg.sender] = 0;
        msg.sender.transfer(sendAmount);
    }

    function killSwitch() public returns (bool){

        require(msg.sender == owner);
        selfdestruct(owner);
        return true;
    }
}