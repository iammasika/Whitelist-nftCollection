// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract Whitelist {
    //Max number of whutelited address
    uint public maxWhitelistedAddresses;

   /* create a mapping of whitelistedAddresss
    if the address is whitelisted then it should be set to true
    and default for other addresses*/
    mapping(address =>bool) public whitelistedAddresses;
    
    //this variable keeps numbr of all whitelisted addresses
    uint public numAddressesWhitelisted;

    //this will set te max number of whitelisted addresses 
    // which te user will put during deployment
    constructor(uint _maxWhitelistedAddresses) {
      maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
    This function add the address of the sender to the whitelist
    */
   function addAddressToWhitelist() public{
    //first check is user address has already been whitelisted
    require(!whitelistedAddresses[msg.sender],"Sendr has already been whiteisted");

    //check if number of maxnumber of whitelisted address has been reached 
    // if so it will through an error
    require(numAddressesWhitelisted < maxWhitelistedAddresses,"More Address cant be added Limt has been reached");

    // adding the address that called this function to the whitelistedAddress Array
    whitelistedAddresses[msg.sender] = true;
    
    //increase the number of whitelisted addresses
    numAddressesWhitelisted +=1;

   }


}