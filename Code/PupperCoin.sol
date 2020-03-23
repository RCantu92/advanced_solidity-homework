pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20Mintable.sol";

/**
 * @title Pupper Coin
 * This contract will create a standard ERC20Mintable token
 * to be used in a crowdsale. It inherits three contracts from
 * the OpenZeppelin library.
 */
contract PupperCoin is ERC20, ERC20Detailed, ERC20Mintable {

    /**
    * @dev The parameters are accepted and passed to the
    * imported OpenZeppelin function to create the ERC20 token.
    * @param name a string saved to memory that is
    * the name of the token.
    * @param symbol a string saved to memory that is
    * the symbol (similar to a traditional stock ticker)
    * of the token.
    */
    constructor(
        string memory name,
        string memory symbol
    )
        /**
        * @dev The parameters being passed to the imported
        * OpenZeppelin function to create the ERC20 token.
        * @param name the name of the token previously saved
        * is passed to this inherited function.
        * @param symbol the symbol of the token previously saved
        * is passed to this inherited function.
        * @param 18 Hardcoded number of decimals for new token.
        */
        ERC20Detailed(name, symbol, 18)
        public
    {}
}