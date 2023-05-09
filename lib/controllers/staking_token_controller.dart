import 'package:get/get.dart';

import 'package:flutter/services.dart';

import 'package:flutter_web3/flutter_web3.dart';

import 'package:crypto_dashboard/controllers/token_controller.dart';
import 'package:crypto_dashboard/controllers/wallet_connect_controller.dart';

class StakingTokenController extends GetxController {
  static const String stakingTokenAdress =
      '0xaad96765ec51C2c14d40f71509B1A4287e9A1Ad3';
  static Contract? contract;

  init() async {
    final String tokenABI =
        await rootBundle.loadString('assets/abis/staking_token_abi.json');

    final Interface stakingTokenInterface = Interface(tokenABI);

    contract = Contract(stakingTokenAdress, stakingTokenInterface,
        WalletConnectController.web3wc!.getSigner());
  }

  _checkInitializated() async {
    if (contract == null && WalletConnectController.currentAddress.isNotEmpty) {
      await init();
    }
  }

  Future<bool> claimReward() async {
    await _checkInitializated();

    final tx = await contract!.send(
        "claimReward", [], TransactionOverride(gasLimit: BigInt.from(1000000)));
    final receipt = await tx.wait();
    return receipt.status;
  }

  Future<bool> stakeToken(String amount) async {
    await _checkInitializated();

    final allowedAmount = await TokenController().allowance(stakingTokenAdress);

    if (allowedAmount < BigInt.parse(amount)) {
      await TokenController().approve(stakingTokenAdress,
          (BigInt.parse(amount) - allowedAmount).toString());
    }

    final tx = await contract!.send("stakeToken", [amount],
        TransactionOverride(gasLimit: BigInt.from(1000000)));

    final receipt = await tx.wait();
    return receipt.status;
  }
}
