pragma solidity ^0.7.0;
pragma abicoder v2;

import "hardhat/console.sol";

contract Voting{
   address admin;
   string public title;
   string public description;
   uint256 public endDate;
   string[] public options;
   string[] winners;
   uint256[] public tally;


   constructor(){
        admin = msg.sender;
    }

    struct Voter{
        bool voted;
        string vote;
    }

    mapping(address => Voter) public voters;

    function createNewElection(string memory _title, string memory _description, string[] memory _options, uint256 _endDate) external{
        require(msg.sender==admin);
        title = _title;
        description = _description;
        options = _options;
        endDate = _endDate;
        for(uint256 i = 0; i < options.length; i++){
            tally.push(0);
        }
    }

    function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
        // https://ethereum.stackexchange.com/questions/4559/operator-not-compatible-with-type-string-storage-ref-and-literal-string
        bytes memory b1 = bytes(s1);
        bytes memory b2 = bytes(s2);
        uint256 l1 = b1.length;
        if (l1 != b2.length) return false;
        for (uint256 i=0; i<l1; i++) {
            if (b1[i] != b2[i]) return false;
        }
        return true;
    }

    function vote(string memory _vote) external{
        // https://docs.soliditylang.org/en/v0.8.11/solidity-by-example.html
        Voter storage sender = voters[msg.sender];    
        require(!sender.voted);
        require(block.timestamp<endDate);
        sender.voted = true;
        bool successfully_voted = false;
        uint256 i = 0;
        while (i < options.length){
            if (stringsEquals(_vote, options[i])){
                tally[i] = tally[i] + 1;
                successfully_voted = true;
                break;
            }
            i = i + 1;
        }
        if (successfully_voted == true){
            sender.vote = _vote;
        }           
        else {
            revert();
        }
    }

    function getWinner() public returns (string[] memory){
        // require(block.timestamp>=endDate);
        uint256 max_votes = 0;
        for(uint256 i = 0; i < tally.length; i++){
            if(tally[i] > max_votes) {
                max_votes = tally[i];
            } 
        }
        for(uint256 j = 0; j < tally.length; j++){
            if(max_votes == tally[j]){
                winners.push(options[j]);
            }
        }
        return winners;
    }
}
