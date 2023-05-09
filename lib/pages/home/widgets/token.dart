import 'package:crypto_dashboard/pages/home/widgets/function_card.dart';
import 'package:crypto_dashboard/pages/function_detail/transfer.dart';
import 'package:flutter/material.dart';

class Token extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Token GBR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          functionCard(name: "Transfer", details: TransferDetail())
        ],
      ),
    );
  }
}
