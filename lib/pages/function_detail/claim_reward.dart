import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
import 'package:crypto_dashboard/utils/constants.dart';
import 'package:crypto_dashboard/utils/icons.dart';

import 'package:crypto_dashboard/controllers/staking_token_controller.dart';

class ClaimRewardDetail extends StatefulWidget {
  @override
  State<ClaimRewardDetail> createState() => _ClaimRewardDetailState();
}

class _ClaimRewardDetailState extends State<ClaimRewardDetail> {
  BigInt? amount;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: StakingTokenController(),
        builder: (StakingTokenController controller) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FlutterIcons.keyboard_backspace_mdi,
                ),
              ),
              centerTitle: true,
              title: Text("Claim Reward"),
            ),
            body: Container(
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                        height: 90.0.h,
                        color: Color.fromRGBO(55, 66, 92, 0.4),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: RichText(
                            text: TextSpan(
                          text: "No params.",
                          style: TextStyle(color: Colors.white),
                        ))),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Widget continueButton = TextButton(
                                  child: Text("Continue"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );

                                late AlertDialog alert;

                                controller.claimReward().then((value) {
                                  if (value) {
                                    alert = AlertDialog(
                                      title: Text("Claim Reward Success"),
                                      content:
                                          Text("Claim reward was successful!"),
                                      actions: [continueButton],
                                    );
                                  } else {
                                    alert = AlertDialog(
                                      title: Text("Claim Reward Failed"),
                                      content: Text(
                                          "It looks like you didn't perform a stakeToken, or you aborted the operation after receiving the reward"),
                                      actions: [continueButton],
                                    );
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                }).catchError((onError) {
                                  alert = AlertDialog(
                                    title: Text("Claim Reward Failed"),
                                    content: Text(
                                        "It looks like you didn't perform a stakeToken, or you aborted the operation after receiving the reward"),
                                    actions: [continueButton],
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                });
                              },
                              child: Text(
                                "SENT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: kSuccessColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
