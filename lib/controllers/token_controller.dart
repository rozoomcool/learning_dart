import 'package:get/get.dart';

import 'package:flutter/services.dart';

import 'package:flutter_web3/flutter_web3.dart';

import 'package:crypto_dashboard/controllers/wallet_connect_controller.dart';

class TokenController extends GetxController {
  static const String tokenAdress =
      '0x19e412078A022a6A02AFD24d48BD25AB7637e4B1';
  static Contract? contract;

  init() async {
    final String tokenABI =
        await rootBundle.loadString('assets/abis/token_abi.json');

    final Interface tokenInterface = Interface(tokenABI);

    contract = Contract(tokenAdress, tokenInterface,
        WalletConnectController.web3wc!.getSigner());
  }

  _checkInitializated() async {
    if (contract == null && WalletConnectController.currentAddress.isNotEmpty) {
      await init();
    }
  }

  Future<BigInt> balanceOf() async {
    await _checkInitializated();

    return await contract!
        .call<BigInt>("balanceOf", [WalletConnectController.currentAddress]);
  }

  Future transfer(String toAdress, BigInt amount) async {
    final tx = await contract!.send("transfer", [toAdress, amount],
        TransactionOverride(gasLimit: BigInt.from(1000000)));
    await tx.wait();
  }

  Future approve(String toAdress, String amount) async {
    final tx = await contract!.send("approve", [toAdress, amount],
        TransactionOverride(gasLimit: BigInt.from(1000000)));
    await tx.wait();
  }

  Future<BigInt> allowance(String address) async {
    return await contract!.call<BigInt>("allowance", [address]);
  }
}
