// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniTwitter {
    // Structure de chaque post
    struct Post {
        address owner;               // Propriétaire du post
        string content;              // Contenu du post
        uint256 creationDate;        // Date de création (timestamp)
        uint256 lastModifiedDate;    // Date de modification (timestamp)
        uint256 likes;               // Nombre de likes
        uint256 dislikes;            // Nombre de dislikes
        mapping(address => bool) hasLiked;    // Si un utilisateur a liké ce post
        mapping(address => bool) hasDisliked; // Si un utilisateur a disliké ce post
    }

    mapping(uint => Post) public posts; // Mapping pour les posts avec un ID unique
    uint public postCount;              // Compteur de posts

    // Mapping pour stocker l'utilisateur actuel
    address public currentUser;

    // Événement de création de post
    event PostCreated(uint postId, address indexed owner, string content);
    // Événement de modification de post
    event PostModified(uint postId, string newContent, uint256 modificationDate);
    // Événement de like/dislike
    event PostLiked(uint postId, address indexed user);
    event PostDisliked(uint postId, address indexed user);

    // Fonction pour se connecter avec un wallet (changer d'utilisateur)
    function connectWallet(address _user) public {
        currentUser = _user;
    }

function createPost(string memory _content) public {
    postCount++;
    Post storage newPost = posts[postCount];
    newPost.owner = msg.sender;
    newPost.content = _content;
    newPost.creationDate = block.timestamp;
    newPost.lastModifiedDate = block.timestamp;
    newPost.likes = 0;
    newPost.dislikes = 0;

    emit PostCreated(postCount, msg.sender, _content);
}
    // Fonction pour modifier un post
    function modifyPost(uint postId, string memory _newContent) public {
        Post storage post = posts[postId];
        
        // Vérifier si l'utilisateur est le propriétaire du post
        require(msg.sender == post.owner, "Only the owner can modify the post");

        // Modifier le contenu et mettre à jour la date de modification
        post.content = _newContent;
        post.lastModifiedDate = block.timestamp; // La date actuelle est la date de modification
        emit PostModified(postId, _newContent, post.lastModifiedDate);
    }

    // Fonction pour liker un post
    function likePost(uint postId) public {
        Post storage post = posts[postId];
        
        // Vérifier si l'utilisateur a déjà liké ce post
        require(!post.hasLiked[msg.sender], "You can like only once");
        require(!post.hasDisliked[msg.sender], "You can't like and dislike at the same time");

        // Mettre à jour les mappings de like
        post.hasLiked[msg.sender] = true;
        post.likes++;

        emit PostLiked(postId, msg.sender);
    }

    // Fonction pour disliker un post
    function dislikePost(uint postId) public {
        Post storage post = posts[postId];

        // Vérifier si l'utilisateur a déjà disliké ce post
        require(!post.hasDisliked[msg.sender], "You can dislike only once");
        require(!post.hasLiked[msg.sender], "You can't like and dislike at the same time");

        // Mettre à jour les mappings de dislike
        post.hasDisliked[msg.sender] = true;
        post.dislikes++;

        emit PostDisliked(postId, msg.sender);
    }

    // Fonction pour obtenir le nombre de likes
    function getLikes(uint postId) public view returns (uint256) {
        return posts[postId].likes;
    }

    // Fonction pour obtenir le nombre de dislikes
    function getDislikes(uint postId) public view returns (uint256) {
        return posts[postId].dislikes;
    }

    // Fonction pour afficher la date de création d'un post
    function getCreationDate(uint postId) public view returns (uint256) {
        return posts[postId].creationDate;
    }

    // Fonction pour afficher la date de dernière modification d'un post
    function getLastModifiedDate(uint postId) public view returns (uint256) {
        return posts[postId].lastModifiedDate;
    }

    // Fonction pour afficher le contenu d'un post
    function getPostContent(uint postId) public view returns (string memory) {
        return posts[postId].content;
    }

    // Fonction pour obtenir le propriétaire du post
    function getPostOwner(uint postId) public view returns (address) {
        return posts[postId].owner;
    }

    // Fonction pour obtenir les informations d'un post
    function getPostInfo(uint postId) public view returns (address owner, string memory content, uint256 creationDate, uint256 lastModifiedDate, uint256 likes, uint256 dislikes) {
        Post storage post = posts[postId];
        return (
            post.owner,
            post.content,
            post.creationDate,
            post.lastModifiedDate,
            post.likes,
            post.dislikes
        );
    }
}
