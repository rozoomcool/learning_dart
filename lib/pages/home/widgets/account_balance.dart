import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/controllers/wallet_connect_controller.dart';
import 'package:crypto_dashboard/controllers/token_controller.dart';

class AccountBalance extends StatefulWidget {
  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  BigInt tokenBalance = BigInt.from(0);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return GetBuilder<TokenController>(
        init: TokenController(),
        builder: (TokenController controller) {
          if (WalletConnectController.wcConnected) {
            controller.balanceOf().then((value) {
              setState(() {
                tokenBalance = value;
              });
            });
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: themeData.textTheme.bodySmall,
                ),
                SizedBox(
                  height: 6.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\ ${tokenBalance.toString()} GBR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0,
                ),
              ],
            ),
          );
        });
  }
}
