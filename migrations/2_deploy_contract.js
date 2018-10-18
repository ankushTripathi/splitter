var Splitter = artifacts.require("./Splitter.sol");

module.exports = function(deployer,network,accounts) {

    if(accounts.length < 3){

        deployer.deploy(Splitter,0,0,0);
    }
    else{
        
        const alice  = accounts[3];
        const bob  = accounts[4];
        const carol = accounts[5];
        deployer.deploy(Splitter,alice,bob,carol);
    }
};