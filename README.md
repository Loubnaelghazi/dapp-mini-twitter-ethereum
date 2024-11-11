# dapp-mini-twitter-ethereum
Smart Twitter mini App (Smart Contract Backend)

# Mini Twitter Web Interface with Smart Contract Backend

This project is a simple web application that interfaces with a smart contract to simulate a Twitter-like environment where users can post, like, dislike, and modify posts. It uses Web3.js to interact with the Ethereum blockchain, allowing decentralized interactions.

## Prerequisites

Before running the project, make sure you have the following installed:

- [Node.js](https://nodejs.org/) (which includes npm)
- A code editor (e.g., [Visual Studio Code](https://code.visualstudio.com/))

## Setup Instructions

### 1. **Install Dependencies**

This project uses Web3.js to interact with Ethereum, and you need to install it in your project. Follow these steps to install it:

1. Navigate to your project folder and initialize a Node.js project:

   ```bash
   npm init -y
2. Install Web3.js using npm:
   
   ```bash
   npm install web3
   
3. Change Smart Contract Address and ABI

To interact with your smart contract, you need to update the contract address and ABI (Application Binary Interface) in the frontend code.

Contract Address: In your front-end code, locate where the contract address is defined (usually in a .js or .html file).</br> 
Replace the placeholder address with your deployed smart contract address on the Ethereum network.

Contract ABI: Ensure that the ABI of your deployed smart contract is added in the appropriate section of the code. </br>
The ABI is a JSON object that defines how the contract should interact with the front-end.

4. Start the Application

After you have installed Web3.js and updated the contract details:

    Run your web application as per the instructions in your project (e.g., running a local server or opening the HTML file in your browser).

    Ensure that your Ethereum wallet (such as MetaMask) is connected to the correct network (either a testnet or mainnet).

5. Usage
    Create posts
    Like and dislike posts (only once per user)
    View the number of likes and dislikes per post
    Prevent liking or disliking a post multiple times by the same user
   
Features

    Post Creation: Users can create posts that are stored on the blockchain.
    Like and Dislike System: Users can like or dislike a post, but can only do so once. Users cannot like and dislike the same post at the same time.
    Smart Contract: The contract ensures that the like/dislike actions are securely recorded and that users cannot interact with posts more than once in conflicting ways.
    Feed Display: The feed displays all posts, along with the number of likes and dislikes.
    User Interaction: Users can like and dislike posts, and the UI dynamically updates after each interaction.

Technologies Used

    Smart Contract: Solidity
    Frontend: HTML, CSS, JavaScript
    Ethereum Blockchain: Web3.js (for interacting with the Ethereum blockchain)
    Backend: Ethereum Smart Contract

Smart Contract

The smart contract handles the logic for liking and disliking posts. Here's the core functionality:
Smart Contract Functions:

    likePost(uint postId): Allows a user to like a post once.
    dislikePost(uint postId): Allows a user to dislike a post once.
    getLikes(uint postId): Retrieves the number of likes for a post.
    getDislikes(uint postId): Retrieves the number of dislikes for a post.
    getPostContent(uint postId): Retrieves the content of a post.


    Deploy the Smart Contract:
Deploy the smart contract using Remix IDE or Truffle to an Ethereum testnet (e.g., Rinkeby) or a local test blockchain.

Connect to Ethereum Network:
In your JavaScript code, use Web3.js to connect to an Ethereum wallet (e.g., MetaMask).

Start the App:
Open the app in a browser and interact with the blockchain through the UI.
