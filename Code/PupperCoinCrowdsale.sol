pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/distribution/RefundableCrowdsale.sol";

/**
 * @title Pupper Coin Sale
 * This contract creates a crowdsale for the tokens from the imported
 * PupperCoin contract. It inherits five contracts from
 * the OpenZeppelin library.
 */
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    /**
    * @dev The parameters are accepted and passed to the
    * imported OpenZeppelin function to create the crowdsale.
    * @param rate An integer that is the rate of PupperCoin
    * to Ether.
    * @param wallet The main wallet that will have the newly
    * minted PupperCoin.
    * @param token The token being used, in this case,
    * PupperCoin.
    */
    constructor(
        uint rate,
        address payable wallet,
        PupperCoin token
        )
        
        /**
        * @dev The paraments of the constructor are
        * passed to this inherited function to create
        * a crowdsale.
        */
        Crowdsale(
            rate,
            wallet,
            token
            )
        
        /**
        * @dev The inherited function is being hardcoded
        * to cap the crowdsale at 3 Ether, a low amount
        * for test purposes.
        */
        CappedCrowdsale(
            3 ether
            )
        
        /**
        * @dev This inherited function is being hardcoded
        * with the open and close dates. It is set to 1 minute
        * for test purposes.
        */
        TimedCrowdsale(
            now,
            now + 1 minutes
            )
        
        /**
        * @dev This inherited function is being hardcoded
        * the amount of Ether that could be refunded. It is
        * set to be able to refund the amount it is capped at,
        * 3 Ether.
        */
        RefundableCrowdsale(
            3 ether
            )
        
        public
    {}
}

/**
 * @title Pupper Coin Sale Deployer
 * This contract serves to deploy both the PupperCoin
 * and PupperCoinCrowdsale contracts under a single
 * transaction.
 */
contract PupperCoinSaleDeployer {

    address public tokenSaleAddress;
    address public tokenAddress;

    /**
    * @dev The parameters are accepted and passed to the
    * PupperCoin and PupperCoinCrowdsale contracts.
    * @param name a string saved to memory that is
    * the name of the token.
    * @param symbol a string saved to memory that is
    * the symbol (similar to a traditional stock ticker)
    * of the token.
    * @param wallet The main wallet that will have the newly
    * minted PupperCoin.
    */
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
    {
        // Creating the PupperCoin and saving it's address
        // to the previously declared tokenAddress variable.
        PupperCoin token = new PupperCoin(name, symbol);
        tokenAddress = address(token);
        
        // Creating the PupperCoinSale and passing it
        // the rate, wallet, and token parameters. Then
        // saving its address to the previously declared
        // tokenSaleAddress variable.
        PupperCoinSale tokenSale = new PupperCoinSale(1, wallet, token);
        tokenSaleAddress = address(tokenSale);

        // Making the PupperCoinSale contract a minter,
        // then have the PupperCoinSaleDeployer renounce its minter role.
        token.addMinter(tokenSaleAddress);
        token.renounceMinter();
    }
}