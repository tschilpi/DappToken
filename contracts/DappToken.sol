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

	// approve
	event Approval(
		address indexed _owner,
		address indexed _spender,
		uint256 _value
	);

	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;
	//allowance

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

		// Delegated Transfer
		// approve
		function approve(address _spender, uint256 _value) public returns (bool success) {
		// Allowance
		  allowance[msg.sender][_spender] = _value;


		// Approve event
		  Approval(msg.sender, _spender, _value);

		  return true;
	}

		// transferFrom
		function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
			require(_value <= balanceOf[_from]);
			require(_value <= allowance[_from][msg.sender]);

			// Require _from has enough tokens
			// Require allowance is big enough
			// Change the balance
			balanceOf[_from] -= _value;
			balanceOf[_to] += _value;
			// Update the allowance

			allowance[_from][msg.sender] -= _value;

			emit Transfer(_from, _to, _value);
			return true;
			// Transfer event
			// return a boolean
		}
	
}

