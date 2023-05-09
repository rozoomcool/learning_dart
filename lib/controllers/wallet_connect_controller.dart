import 'package:get/get.dart';

import 'package:flutter_web3/flutter_web3.dart';

class WalletConnectController extends GetxController {
  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;
  bool get isEnable => ethereum != null;

  static bool isMetamaskConnected = false;
  static String currentAddress = '';
  static int currentChain = -1;
  static bool wcConnected = false;

  static const int OPERATING_CHAIN = 97;

  static WalletConnectProvider wc = WalletConnectProvider.fromRpc(
    {OPERATING_CHAIN: 'https://data-seed-prebsc-1-s1.binance.org:8545/'},
    chainId: OPERATING_CHAIN,
    network: 'BNB Smart Chain Testnet',
  );

  static Web3Provider? web3wc;

  connectWallet() async {
    await wc.connect();

    if (wc.connected && wc.chainId.toString() != OPERATING_CHAIN.toString()) {
      await wc.disconnect();
      return clear();
    }

    if (wc.connected && currentAddress.isEmpty) {
      currentAddress = wc.accounts.first;
      currentChain = OPERATING_CHAIN;
      wcConnected = true;
      web3wc = Web3Provider.fromWalletConnect(wc);
      WalletConnectController.isMetamaskConnected = true;
    }

    update();
  }

  Future<void> tryConnectMetamask() async {
    if(isEnable) {
      try {
        final accs = await ethereum!.requestAccount();
        if (accs.isNotEmpty) {
          currentAddress = accs.first;
          currentChain = await ethereum!.getChainId();
          wcConnected = true;
          web3wc = Web3Provider.fromEthereum(ethereum!);
          WalletConnectController.isMetamaskConnected = true;
        }
      } catch (e){

      }
    } else {
      clear();
    }
    update();
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    wcConnected = false;
    web3wc = null;
    WalletConnectController.isMetamaskConnected = false;

    update();
  }

  getLastestBlock() async {
    print(await provider!.getLastestBlock());
    print(await provider!.getLastestBlockWithTransaction());
  }

  test() async {}
}
