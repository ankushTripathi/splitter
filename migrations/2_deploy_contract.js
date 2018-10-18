var Splitter = artifacts.require("./Splitter.sol");

module.exports = function(deployer,network,accounts) {

    const alice  = accounts[3];
    const bob  = accounts[4];
    const carol = accounts[5];
    deployer.deploy(Splitter,alice,bob,carol);
};