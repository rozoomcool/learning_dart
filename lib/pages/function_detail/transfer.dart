import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/utils/adaptive_height_extension.dart';
import 'package:crypto_dashboard/utils/constants.dart';
import 'package:crypto_dashboard/utils/icons.dart';

import 'package:crypto_dashboard/controllers/token_controller.dart';

class TransferDetail extends StatefulWidget {
  @override
  State<TransferDetail> createState() => _TransferDetailState();
}

class _TransferDetailState extends State<TransferDetail> {
  String? toAdress;
  BigInt? amount;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TokenController(),
        builder: (TokenController controller) {
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
              title: Text("Transfer"),
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
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Input address to sent",
                              hintStyle: TextStyle(color: Colors.white)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) => setState(() {
                            toAdress = value;
                          }),
                          style: TextStyle(color: Colors.white),
                        )),
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
                                if (toAdress == null ||
                                    toAdress == '' ||
                                    amount == null ||
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

                                controller
                                    .transfer(toAdress!, amount!)
                                    .then((_) {
                                  Widget continueButton = TextButton(
                                    child: Text("Continue"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );

                                  AlertDialog alert = AlertDialog(
                                    title: Text("Transfer Success"),
                                    content:
                                        Text("Sending tokens was successful!"),
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
