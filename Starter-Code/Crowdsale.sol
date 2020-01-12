pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor(
        // @TODO: Fill in the constructor parameters!
        uint rate,
        address payable wallet,
        PupperCoin token
        )
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(
            rate,
            wallet,
            token
            )
            
        CappedCrowdsale(
            305 ether
            )
            
        TimedCrowdsale(
            now,
            now + 24 weeks
            )
            
        RefundableCrowdsale(
            300 ether
            )
        
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public tokenSaleAddress;
    address public tokenAddress;

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
    {
        // @TODO: create the PupperCoin and keep its address handy
        PupperCoin token = new PupperCoin(name, symbol);
        tokenAddress = address(token);
        
        // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        PupperCoinSale tokenSale = new PupperCoinSale(1, wallet, token);
        tokenSaleAddress = address(tokenSale);

        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(tokenSaleAddress);
        token.renounceMinter();
    }
}