pragma solidity ^0.4.23;

contract Splitter{


    address public alice;
    address public bob;
    address public carol;

    constructor (address _alice,address _bob,address _carol) public {
        
        alice = _alice;
        bob = _bob;
        carol = _carol;
    }

    modifier isSet(){

        require(alice != 0);
        require(bob != 0);
        require(carol != 0);
        _;
    }

    modifier isAlice(){

        require(msg.sender == alice);
        _;
    }

    function getContractBalance() public view returns(uint){

        return address(this).balance;
    }

    function getUserBalances() public view isSet returns(uint aliceBalance,uint bobBalance,uint carolBalance){

        return (address(alice).balance,address(bob).balance,address(carol).balance);
    }

    function split() public isSet isAlice payable {

        uint sendAmount = msg.value/2;

        address(bob).transfer(sendAmount);
        address(carol).transfer(sendAmount);
    }

    function () public payable {}
}