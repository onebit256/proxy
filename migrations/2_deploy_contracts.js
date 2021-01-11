const Store = artifacts.require("Store");
const StoreFactory = artifacts.require("StoreFactory");

module.exports = function(deployer,network, accounts) {
  deployer.deploy(Store).then(() => {
    return deployer.deploy(StoreFactory, Store.address, accounts[0]);
  });
};
