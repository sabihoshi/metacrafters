/*
Assessment Requirements
1. Create a variable that can hold a number of NFT's. What type of variable might this be?
2. Create an object inside your mintNFT function that will hold the metadata for your NFTs.
   The metadata values will be passed to the function as parameters. When the NFT is ready,
   you will store it in the variable you created in step 1
3. Your listNFTs() function will print all of your NFTs metadata to the console (i.e. console.log("Name: " + someNFT.name))
4. For good measure, getTotalSupply() should return the number of NFT's you have created
*/

// create a variable to hold your NFT's
const NFTs = [];

// this function will take in some values as parameters, create an
// NFT object using the parameters passed to it for its metadata,
// and store it in the variable above.
function mintNFT(_characterName, _element, _weaponType, _rarity) {
    const NFT = {
        characterName: _characterName,
        element: _element,
        weaponType: _weaponType,
        rarity: _rarity,
    };

    NFTs.push(NFT);
    console.log(`${_characterName}, the ${_element} ${_weaponType}, has been summoned! Rarity: ${_rarity}. Get ready for an adventure!`);
}

// create a "loop" that will go through an "array" of NFT's
// and print their metadata with console.log()
function listNFTs() {
    console.log("\nID: Character Name (Rarity, Element, Weapon Type)");
    for (let i = 0; i < NFTs.length; i++) {
        console.log(
            `${i + 1}:\t${NFTs[i].characterName} - A ${NFTs[i].rarity} ${NFTs[i].element} ${NFTs[i].weaponType} wielder ready for battle!`
        );
    }
}

// print the total number of NFTs we have minted to the console
function getTotalSupply() {
    console.log("\nNFT Total Supply: " + NFTs.length);
}

// call your functions below this line
mintNFT("Diluc", "Pyro", "Claymore", "Legendary");
mintNFT("Fischl", "Electro", "Bow", "Epic");
mintNFT("Xingqiu", "Hydro", "Sword", "Rare");
mintNFT("Zhongli", "Geo", "Polearm", "Mythic");
mintNFT("Keqing", "Electro", "Sword", "Uncommon");

listNFTs();
getTotalSupply();
