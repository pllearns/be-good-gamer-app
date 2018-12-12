pragma solidity >=0.4.0 <0.6.0;

contract ChatFactory {
    address[] public publicChats;

    function createChatStream(uint minimumFee) public {
        address newChat = new Chat(minimumFee, msg.sender);
        publicChats.push(newChat);
    }
    
    function getPublicChats() public view returns (address[] memory) {
        return publicChats;
    }
}

contract Chat {
    struct StartChat{
        string topic;
        string message;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    StartChat[] public chats;
    address public moderator;
    uint public minimumFeeForPost;
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier restricted() {
        require(msg.sender == moderator, "Not an authorized moderator");
        _;
    } 

    constructor(uint minimumFee, address creator) public {
        moderator = creator;
        minimumFeeForPost = minimumFee;
    }

    function payFee() public payable {
        require(msg.value > minimumFeeForPost, "Please contribute the minimum fee to start this topic");

        approvers[msg.sender] = true;
        approversCount++;
    }

    function createChat(string memory topic, string memory message) public restricted {
        StartChat memory newChatRequest = StartChat({
            topic: topic,
            message: message,
            complete: false,
            approvalCount: 0
        });

        chats.push(newChatRequest);
    }

    function approveChat(uint index) public {
        StartChat storage chat = chats[index];

        require(approvers[msg.sender], "The moderator must approve you!");
        require(!chat.approvals[msg.sender], "This topic is already approved");

        chat.approvals[msg.sender] = true;
        chat.approvalCount++;
    }

    function finalizeChat(uint index) public restricted {
        StartChat storage chat = chats[index];

        require(chat.approvalCount > (approversCount / 2), "We need more than one approval!");
        require(!chat.complete, "This chat is already complete");
        chat.complete = true;
    }

    function returnChat() public view returns (
      string memory, string memory, uint, uint, address
      ) {
        return (
          topic,
          message,
          chats.length,
          approversCount,
          moderator
        );
    }

    function getChatsCount() public view returns (uint) {
        return chats.length;
    }
}
