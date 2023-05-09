import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/controllers/wallet_connect_controller.dart';

import 'package:crypto_dashboard/pages/home/widgets/account_balance.dart';
import 'package:crypto_dashboard/pages/home/widgets/token.dart';
import 'package:crypto_dashboard/pages/home/widgets/staking_token.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletConnectController>(
        init: WalletConnectController(),
        builder: (WalletConnectController controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Token GBR dApp"),
              automaticallyImplyLeading: false,
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    AccountBalance(),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Color.fromRGBO(97, 99, 119, 1),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    StakingToken(),
                    Token(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
