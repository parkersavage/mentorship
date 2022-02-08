pragma solidity ^0.7.0;

contract SplitEth{
	address payable address_1 = ###;
	address payable address_2 = ###;
	function balance() external view returns(uint){
		return address(this).balance;
	}
	function splitEth() external{
		address_1.transfer((address(this).balance)/2);
		address_2.transfer(address(this).balance);
	}
	function pay() external payable{
		this.splitEth();
	}
}
