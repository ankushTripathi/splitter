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

        require(alice != 0 && bob != 0 && carol != 0,"alice,bob and carol's account must be set for this action");
        _;
    }

    modifier isAlice(){

        require(msg.sender == alice, "only alice can make this call");
        _;
    }

    function getContractBalance() public view returns(uint){

        return address(this).balance;
    }

    function setUsers(address _alice,address _bob,address _carol) public{

        alice = _alice;
        bob = _bob;
        carol = _carol;
    }

    function getUserBalances() public view isSet returns(uint aliceBalance,uint bobBalance,uint carolBalance){

        return (address(alice).balance,address(bob).balance,address(carol).balance);
    }

    function split() public isSet isAlice payable {

        require(msg.value > 0 ether, "ether > 0 required for split");

        uint sendAmount = msg.value/2;

        address(bob).transfer(sendAmount);
        address(carol).transfer(sendAmount);
    }

    function () public payable {}
}