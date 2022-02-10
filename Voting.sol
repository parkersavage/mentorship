pragma solidity ^0.7.0;
pragma abicoder v2;

contract Voting{
    string[3][] listElections;

    struct Election{
        string title;
        string[] options;
        uint256 numOfVotes;
    }

    struct Voter{
        bool voted;
        uint vote; /// index of the voted election
    }

    function createNewElection(string memory name, string memory inte, string memory stri) public{
        /// string[] memory candidates
        listElections.push([name, inte, stri]);
    }

    function getListElections() public view returns (string [] memory){
        return listElections;
    }
}
