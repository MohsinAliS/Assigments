const Web3 = require('web3');
const Provider = require('@truffle/hdwallet-provider');
const MyContract = require('../artifacts/contracts/Box.sol/Box.json');
const address = '0xDf02E5536d56C305ca03D98535d53Fa25FCc2f9B';
const privateKey = 'af15c58a190510f99748e9be3272a6b4785c77a74af9b7942f6a32e0652fee41';

    const init1 = async () => {
const provider = new Provider(privateKey, 'https://eth-rinkeby.alchemyapi.io/v2/sNTmGzIHRTQbptzyEXJZ13WwFZk-v4rV'); 
const web3 = new Web3(provider);
const networkId = await web3.eth.net.getId();
const myContract = new web3.eth.Contract
(

    MyContract.abi,
    MyContract.network="0x55af7EC9a205761caB6C79500EEcc4377897BFe5",
);  
    console.log(`Old value: ${await myContract.methods.getValue().call()}`);
const receipt = await myContract.methods.setvalue(30).send({ from: address });
    console.log(`Transaction hash: ${receipt.transactionHash}`);
    console.log(`New value: ${await myContract.methods.getValue().call()}`);
}
  
init1();
