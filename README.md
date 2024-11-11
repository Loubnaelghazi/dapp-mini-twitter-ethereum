# dapp-mini-twitter-ethereum
Smart Twitter mini App (Smart Contract Backend)

Overview

This app is a decentralized social media platform that uses a smart contract backend deployed on the Ethereum blockchain to manage posts, likes, and dislikes. The app allows users to:

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


    
