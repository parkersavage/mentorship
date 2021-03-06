pragma solidity ^0.7.0;

contract TrustFund{
    address payable public grantor;
    address payable public trustee;
    uint256 public unlockDate;
    uint256 public lastWithdraw;

    constructor() public{
        grantor = msg.sender;
        trustee = ###;
        unlockDate = ###; /// In Unix Seconds
    }

    function viewBalance() public view returns (uint256){
        return address(this).balance;
    }

    function deposit() payable public{
    }

    function withdrawAll() public{
        if(block.timestamp >= unlockDate && msg.sender == trustee){
            trustee.transfer(address(this).balance);            
        }
        else{
            require(msg.sender==grantor);
            msg.sender.transfer(address(this).balance);
        }
    }

    function withdraw() public{
        require(msg.sender == trustee && block.timestamp >= lastWithdraw + 60);
        trustee.transfer(address(this).balance/10);
        lastWithdraw = block.timestamp;         
    }
}
