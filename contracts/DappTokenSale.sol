pragma solidity ^0.6.7;

import "./DappToken.sol";

contract DappTokenSale {
	address payable admin;
	DappToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;
	address thisAddress = address(this);
	
    
	event Sell(address _buyer, uint256 _amount);

    constructor (DappToken _tokenContract, uint256 _tokenPrice) public {
      admin = msg.sender;
      tokenContract = _tokenContract;   // Token Contract 
      tokenPrice = _tokenPrice;
    // Token Price
    }

    // multiply
    function multiply(uint x, uint y) internal pure returns (uint z) {
    	require(y == 0 || (z = x * y) / y == x);
    }

    // Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
		// Require that value is equal to tokens
		require(msg.value == multiply(_numberOfTokens, tokenPrice));
    	// Require that the contract has enough tokens
    	require(tokenContract.balanceOf(thisAddress) >= _numberOfTokens);
    	// Require that a transfer is successful
    	require(tokenContract.transfer(msg.sender, _numberOfTokens));

    	// Keep track of tokensSold
    	tokensSold += _numberOfTokens;

    	// Trigger Sell Event	
    	Sell(msg.sender, _numberOfTokens); 
    }

    // Ending Tokensale
    function endSale() public {
    	
    	require(msg.sender == admin);
    	require(tokenContract.transfer(admin, tokenContract.balanceOf(thisAddress)));
    	// Destroy contract
    	selfdestruct(admin);

    }
}