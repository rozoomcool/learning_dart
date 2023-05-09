import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
import 'package:crypto_dashboard/utils/constants.dart';
import 'package:crypto_dashboard/utils/icons.dart';

import 'package:crypto_dashboard/controllers/staking_token_controller.dart';

class StakeTokenDetail extends StatefulWidget {
  @override
  State<StakeTokenDetail> createState() => _StakeTokenDetailState();
}

class _StakeTokenDetailState extends State<StakeTokenDetail> {
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
              title: Text("Stake Tokens"),
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
                          text:
                              "Note: You may need to confirm two transactions - approve and the stakeToken itself",
                          style: TextStyle(color: Colors.white),
                        ))),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                        height: 90.0.h,
                        color: Color.fromRGBO(55, 66, 92, 0.4),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Input amount to sent",
                              hintStyle: TextStyle(color: Colors.white)),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChanged: (value) => setState(() {
                            amount = value.isNotEmpty
                                ? BigInt.parse(value)
                                : BigInt.from(0);
                          }),
                          style: TextStyle(color: Colors.white),
                        )),
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
                                if (amount == null ||
                                    amount == BigInt.from(0)) {
                                  Widget continueButton = TextButton(
                                    child: Text("Continue"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );

                                  AlertDialog alert = AlertDialog(
                                    title: Text("Empty Error Field"),
                                    content: Text(
                                        "The recipient's address and number of tokens fields must be filled in"),
                                    actions: [continueButton],
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                  return;
                                }

                                Widget continueButton = TextButton(
                                  child: Text("Continue"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );

                                late AlertDialog alert;

                                controller
                                    .stakeToken(amount!.toString())
                                    .then((value) {
                                  if (value) {
                                    alert = AlertDialog(
                                      title: Text("Stake Token Success"),
                                      content: Text(
                                          "Staking tokens was successful!"),
                                      actions: [continueButton],
                                    );
                                  } else {
                                    alert = AlertDialog(
                                      title: Text("Stake Token Failed"),
                                      content: Text(
                                          "You have already made a stakeToken, but you have not collected the reward, or your balance is insufficient, or you have issued zero tokens"),
                                      actions: [continueButton],
                                    );
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => alert);
                                }).catchError((onError) {
                                  alert = AlertDialog(
                                    title: Text("Stake Token Failed"),
                                    content: Text(
                                        "You have already made a stakeToken, but you have not collected the reward, or your balance is insufficient, or you have issued zero tokens"),
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
