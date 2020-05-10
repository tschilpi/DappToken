pragma solidity ^0.6.7;

contract DappToken {
	// Name
	string public name = "DApp Token";
	// Symbol
	string public symbol = "DAPP";
	string public standard = "DApp Token v.1.0";
	uint256 public totalSupply;

	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	mapping(address => uint256) public balanceOf;

	constructor (uint256 _initialSupply) public {
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;
		// allocate the initial supply
	}

	// Transfer
	function transfer(address _to, uint256 _value) public returns (bool success) {
		// Exception if account doesn't have enough
		require(balanceOf[msg.sender] >= _value);

		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;

		// Transfer Event
		emit Transfer(msg.sender, _to, _value);

		// Return a boolean
		return true; 
		
		
		
	}
}

