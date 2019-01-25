pragma solidity ^0.5.0;
/** @title Owned. */
contract Owned{
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    /** @dev Checks whether the sender of the function is owner.
      * @param owner Address of the owner.
      */
    modifier onlyOwner {
        require(
            msg.sender == owner,
            "You must be the owner."
        );
        _;
    }
    
}
/** @title Certificate. */
contract Certificate is Owned{
    struct Holder{
        bytes16 name;
        uint level;
    }
    //Mapping address
    mapping (address => Holder) holders;
    address[] public holderAccts;
    
    event HolderInfo(
        bytes16 name,
        uint level
    );
     /** @dev Checks the level required to get a cerificate issued.
      * @param _level Level of the Recipient.
      */
    modifier checkLevel(uint _level){
        require(
            _level <= 3,
            "You input the wrong level."
        );
        _;
    }
     /** @dev Sets the details of the holder of the certificate on the issuer.
      * @param _name Name of the holder.
      * @param _level Level of the holder.
      * @param _address Account address of the holder.
      */
    function setHolder(address _address, bytes16 _name, uint _level) onlyOwner checkLevel(_level) public{
        holders[_address].name = _name;
        holders[_address].level = _level;
        holderAccts.push(_address);
        emit HolderInfo(_name, _level);
    }
     /** @dev Returns the ceritificate holding accounts.
      * @return holderAccts Address of the certificate holders.
      */
    function getHolders() view public returns(address[] memory) {
        return holderAccts; 
    }
     /** @dev Issues Cerificate to the recipient.
      * @param _address Address of the recipient.
      * @return name Name of recipient.
      * @return level Level of recipient.
      */
    function getHolder(address _address) view public returns(bytes16, uint){
        return (holders[_address].name, holders[_address].level);
    }
     /** @dev Calculates a rectangle's surface and perimeter.
      * @return uint Length of holder's account.
      */
    function countHolders() view public returns(uint) {
        return holderAccts.length;
    }
}
