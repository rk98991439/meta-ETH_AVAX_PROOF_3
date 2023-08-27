// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private _owner; // Private variable to store the contract owner's address

    constructor() ERC20("MyToken", "MTK") {
        _owner = msg.sender; // Assigns the contract deployer's address as the owner
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the contract owner can call this function");
        _; // Placeholder where the modified function is executed
    }

    function mint(address account, uint256 amount) external onlyOwner payable {
        _mint(account, amount); // Creates new tokens and assigns them to the specified account
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount); // Transfers tokens from the sender's address to the recipient
        return true; // Indicates a successful transfer
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount); // Destroys tokens from the sender's address
    }
}
