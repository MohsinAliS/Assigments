// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
contract IEC is ERC721URIStorage {
    
    mapping (address=> uint[]) public nft;
    constructor() ERC721("IEC", "I") {}
   
    /**
     * @dev Mints `tokenId` , 'tokenURI' and transfers it to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {_safeMint} whenever possible
     *
     * Requirements:
     *
     * - `tokenId` must not exist.
     * - `to` cannot be the zero address.
     * - 'tokenURI' please add complete tokenURI
     * Emits a {Transfer} event.
     */ 
    function mintToken(address to, string memory tokenURI, uint256 tokenId)
    public
    {
    _mint(to, tokenId);
    _setTokenURI(tokenId, tokenURI);
    nft[to].push(tokenId); 
    }

    /**
     * @dev getNftsOnAccount {_contractAddress}. If you want to know about how many
     * nfts on address and in which index minted so use this 
     * function to get all nfts plus index on adress
     */
    function getNftsOnAccount(address _contractAddress)
        public view returns (uint[]memory) 
    {
        return nft[_contractAddress];
    } 
    
    }








