// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PrimogemWish {
    struct WishStats {
        uint256 totalWishes;
        uint256 pityCounter;
        uint256 primogems;
        uint256 lastWishTime;
        bool hasGuarantee;
    }

    mapping(address => WishStats) public wishStats;
    uint256 public constant WISH_COST = 160;  // Cost per wish in primogems
    uint256 public constant SOFT_PITY = 75;   // Soft pity starts at 75 wishes
    uint256 public constant HARD_PITY = 90;   // Guaranteed 5* at 90 wishes
    uint256 public constant WISH_COOLDOWN = 1 minutes;  // Cooldown between wishes

    event PrimogemSpent(address indexed player, uint256 amount);
    event WishResult(address indexed player, string itemRarity);

    modifier hasSufficientPrimogems(uint256 wishes) {
        require(wishStats[msg.sender].primogems >= wishes * WISH_COST, "Insufficient primogems");
        _;
    }

    function addPrimogems(uint256 amount) public {
        require(amount > 0, "Amount must be positive");
        require(amount <= 28800, "Cannot add more than 28800 primogems at once");

        wishStats[msg.sender].primogems += amount;
        assert(wishStats[msg.sender].primogems >= amount);
    }

    function wish(uint256 numberOfWishes) public hasSufficientPrimogems(numberOfWishes) {
        require(numberOfWishes > 0 && numberOfWishes <= 10, "Invalid wish count");
        require(
            block.timestamp >= wishStats[msg.sender].lastWishTime + WISH_COOLDOWN,
            "Please wait before wishing again"
        );

        uint256 cost = numberOfWishes * WISH_COST;
        if (wishStats[msg.sender].primogems < cost) {
            revert("Insufficient primogems for wishes");
        }

        wishStats[msg.sender].primogems -= cost;
        wishStats[msg.sender].lastWishTime = block.timestamp;

        for (uint256 i = 0; i < numberOfWishes; i++) {
            _processWish();
        }

        emit PrimogemSpent(msg.sender, cost);
    }

    function _processWish() private {
        wishStats[msg.sender].totalWishes++;
        wishStats[msg.sender].pityCounter++;

        // Simulate wish result based on pity system
        if (wishStats[msg.sender].pityCounter >= HARD_PITY) {
            _grant5Star();
        } else if (wishStats[msg.sender].pityCounter >= SOFT_PITY) {
            _increasedRate5Star();
        } else {
            _normalWish();
        }

        assert(wishStats[msg.sender].pityCounter <= HARD_PITY);
    }

    function _grant5Star() private {
        wishStats[msg.sender].pityCounter = 0;

        if (wishStats[msg.sender].hasGuarantee) {
            emit WishResult(msg.sender, "5* Featured Character");
            wishStats[msg.sender].hasGuarantee = false;
        } else {
            // 50/50 chance
            if (_random() % 2 == 0) {
                emit WishResult(msg.sender, "5* Featured Character");
                wishStats[msg.sender].hasGuarantee = false;
            } else {
                emit WishResult(msg.sender, "5* Standard Character");
                wishStats[msg.sender].hasGuarantee = true;
            }
        }
    }

    function _increasedRate5Star() private {
        // Increased rate logic
        if (_random() % 100 < 20) {  // 20% chance
            _grant5Star();
        } else {
            emit WishResult(msg.sender, "4* Item");
        }
    }

    function _normalWish() private {
        uint256 rand = _random() % 100;
        if (rand < 5) {  // 5% chance for 4*
            emit WishResult(msg.sender, "4* Item");
        } else {
            emit WishResult(msg.sender, "3* Item");
        }
    }

    function _random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, block.prevrandao)));
    }

    function getPityCount() public view returns (uint256) {
        return wishStats[msg.sender].pityCounter;
    }
}