const DappToken = artifacts.require("DappToken");
const DappTokenSale = artifacts.require("DappTokenSale");

module.exports = function(deployer) {
  deployer.deploy(DappToken, 1000000).then(function() {
  	// Token price is 0.01 Ether
  	var TokenPrice = 1000000000000000;
  	return deployer.deploy(DappTokenSale, DappToken.address, TokenPrice);
  });
 };
