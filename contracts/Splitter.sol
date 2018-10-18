pragma solidity ^0.4.23;

contract Splitter{


    address public alice;
    address public bob;
    address public carol;
    
    bool turn;    //determines whose turn is it to get extra in case of odd amount 

    constructor (address _alice,address _bob,address _carol) public payable {
        
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

    function setUsers(address _alice,address _bob,address _carol) public{

        alice = _alice;
        bob = _bob;
        carol = _carol;
    }

    function split() public isSet isAlice payable {

        require(msg.value > 0 wei, "ether > 0 required for split");

        uint sendAmount = msg.value/2;

        address(bob).transfer(sendAmount + ((msg.value%2 != 0 && turn)? 1 wei : 0 wei));
        address(carol).transfer(sendAmount + ((msg.value%2 != 0 && !turn)? 1 wei : 0 wei));

        if(msg.value%2 != 0)
            turn = !turn;
    }

    function () public payable {}
}