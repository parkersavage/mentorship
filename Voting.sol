pragma solidity ^0.7.0;

contract Voting{
   address admin;
   string public title;
   string public description;
   string[] public options;
   uint256[] public tally;

   constructor(){
        admin = msg.sender;
    }

    struct Voter{
        bool voted;
        string vote;
    }

    mapping(address => Voter) public voters;

    function createNewElection(string memory _title, string memory _description, string[] memory _options, uint256[] memory _tally) public{
        require(msg.sender==admin);
        title = _title;
        description = _description;
        options = _options;
        tally = _tally;
    }

    function vote(string _vote){
        Voter storage sender = voters[msg.sender]; // https://docs.soliditylang.org/en/v0.8.11/solidity-by-example.html
    }
}
