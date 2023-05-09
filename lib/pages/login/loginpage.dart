import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:crypto_dashboard/controllers/wallet_connect_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/wallet-connect';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletConnectController>(
        init: WalletConnectController(),
        builder: (WalletConnectController controller) {
          controller.tryConnectMetamask();

          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Connect to GBR Token dApp"),
                automaticallyImplyLeading: false,
              ),
              body: Builder(builder: (_) {
                if (WalletConnectController.wc.connected &&
                    WalletConnectController.wc.chainId.toString() !=
                        WalletConnectController.OPERATING_CHAIN.toString()) {
                  Widget continueButton = TextButton(
                    child: Text("Continue"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );

                  AlertDialog alert = AlertDialog(
                    title: Text("Connection Error"),
                    content: Text(
                        "Supported dApp blockchain network - Binance SmartChain Testnet"),
                    actions: [continueButton],
                  );
                  Future.delayed(
                      Duration.zero,
                      () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          ));
                }

                if ((WalletConnectController.wc.connected ||
                        WalletConnectController.isMetamaskConnected) &&
                    !WalletConnectController.currentAddress.isEmpty) {
                  Future.delayed(Duration.zero,
                      () => Navigator.popAndPushNamed(context, '/'));
                }

                return Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              TextStyle(fontSize: 32))),
                      onPressed: controller.connectWallet,
                      child: Text('Connect'),
                    ),
                  ),
                );
              }));
        });
  }
}
