# NewCoin: ERC20 Token & Crowdsale

This projects creates an ERC20 token that will be minted through a Crowdsale contract uses the OpenZeppelin Solidity library.
The crowdsale contract will manage the entire process, allowing users to send ETH and get back the NewCoin.
This contract also mints the tokens automatically and distributes them to buyers in one transaction.
To function, it inherits Crowdsale, CappedCrowdsale, TimedCrowdsale, RefundableCrowdsale, and MintedCrowdsale from OpenZeppelin.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Running the tests

In your web browser, go to [Remix](https://remix.ethereum.org/#optimize=false&evmVersion=null&version=soljson-v0.6.1+commit.e6f7d5a4.js), and create a new file with the same name as your chosen file in the Code/ directory.

The following is a list of the three files with an in-depth explanation of their respective roles:

* ### New Coin: 
    * This contract will create a standard ERC20Mintable token to be used in a crowdsale. It inherits three contracts from the OpenZeppelin library.

* ### New Coin Crowdsale
    * This contract creates a crowdsale for the tokens from the imported New Coin contract. It inherits five contracts from the OpenZeppelin library.

### Deploying each contract

After navigating to Remix, copy and paste the code into the editor. Once pasted, compile the code under the second tab on the left. To make sure you are using the correct version of Solidity, select 

```
0.5.0+commit.1d4f565a
```
Under the compiler option. Next click the

```
Compile {fileName}.sol
```
button to get the file ready to deploy.

To deploy, navigate to the third tab from the left, and click the

```
deploy
```
button. Depending on which file you decided to deploy, you will need to provide different data under the deploy drop down arrow. Once you have provided the correct info, you are now ready to start testing out the contract for yourself!

## Built With

* [Solidity, v.0.5.0](https://solidity.readthedocs.io/en/v0.5.0/) - The programming language used.
* [Remix](https://remix.ethereum.org/#optimize=false&evmVersion=null&version=soljson-v0.6.1+commit.e6f7d5a4.js) - Online IDE used.
* [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)

## Authors

* **Roberto Cantu**  - [GitHub](https://github.com/RCantu92)