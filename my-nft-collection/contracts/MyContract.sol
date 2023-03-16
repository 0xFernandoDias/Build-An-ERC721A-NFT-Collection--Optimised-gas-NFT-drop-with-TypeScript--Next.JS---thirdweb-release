// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/base/ERC721Base.sol";
import "@thirdweb-dev/contracts/extension/PermissionsEnumerable.sol";

contract Contract is ERC721Base, PermissionsEnumerable {
    bytes32 public constant NICKNAMER_ROLE = keccak256("NICKNAMER_ROLE");
    constructor(
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps
    )
        ERC721Base(
            _name,
            _symbol,
            _royaltyRecipient,
            _royaltyBps
        )
    {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(NICKNAMER_ROLE, msg.sender);
    }

    // Mapping of token ID to nickname
    mapping(uint256 => string) public tokenNicknames;

    // Update the value of the mapping for a token ID
    function updateTokenNickname(
        uint256 _tokenId,
        string calldata _nickname
    ) public onlyRole(NICKNAMER_ROLE) {
        tokenNicknames[_tokenId] = _nickname;
    }
}


// https://thirdweb.com/contracts/deploy/Qmdf6NXsmB3hHt2iA4n3YM3ptuC5dnbYxEwTKa5z54gx4Z
// https://thirdweb.com/contracts/publish/QmPTmTp4exXiG1CbyXBJWR8KhSLb9zRWRbudXJCBdPGmm8

// Contract Parameters:
// Parameters the contract specifies to be passed in during deployment.

// Name (_name):
// "My cool nfts"

// Symbol (_symbol):
// "mycoolnfs"

// Royalty Recipient:
// "0x5fC..."

// Royalty Bps (_royaltyBps):
// "500"

// Network / Chain
// Goerli (ETH)
