pragma solidity ^0.8.12;
// SPDX-License-Identifier: UNLICENSED
// 0xdcafB7729B65A4184fa5139a9784D15b0A6Ca13b
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract Savagecoin is ERC20 {
    address public admin;
    constructor() ERC20('Savagecoin', 'SVG') {
        admin = msg.sender;
        _mint(admin, 10000 * 10 ** 18);
    }
    function mint(address to, uint amount) external {
        require(msg.sender == admin);
        _mint(to, amount);
    }
    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }
}
