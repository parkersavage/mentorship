pragma solidity ^0.7.0;
pragma abicoder v2;

contract Voting{
   address admin;
   string title, description;
   string[] options;
   uint256[] tally;

   constructor(){
        admin = msg.sender
    }

    struct Election{
        string title;
        string description;
        string[] options;
        uint256[] tally;
    }

    struct Voter{
        bool voted;
        uint vote;
    }

    function createNewElection(string memory _title, string memory _description, string[] memory _options, uint256[] memory _tally) public{
        require(msg.sender==admin);
        title = _title;
        description = _description;
        options = _options;
        tally = _tally;
    }
}
