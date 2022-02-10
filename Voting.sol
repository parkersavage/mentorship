pragma solidity ^0.7.0;
pragma abicoder v2;

contract Voting{
   address admin;
   string public title;
   string public description;
   uint256 public endDate;
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

    function createNewElection(string memory _title, string memory _description, string[] memory _options, uint256[] memory _tally, uint256 memory _endDate) external{
        require(msg.sender==admin);
        title = _title;
        description = _description;
        options = _options;
        tally = _tally;
        endDate = _endDate;
    }

    function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
        // only way that i could compare string in array with string in parameter
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
        sender.voted = true;
        uint256 i = 0;
        while (i < options.length){
            if (stringsEquals(_vote, options[i])){
                tally[i] = tally[i] + 1;
            }
            i = i + 1;
        }
        sender.vote = _vote;
    }

    function getWinner(){
        require(block.timestamp>=endDate);
        string winner;
        if ()
    }
}
