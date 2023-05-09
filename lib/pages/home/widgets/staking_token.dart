import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:crypto_dashboard/controllers/token_controller.dart';
import 'package:crypto_dashboard/pages/home/widgets/function_card.dart';
import 'package:crypto_dashboard/pages/function_detail/stake_token.dart';
import 'package:crypto_dashboard/pages/function_detail/claim_reward.dart';

class StakingToken extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TokenController>(
        init: TokenController(),
        builder: (TokenController controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Staking Tokens GBR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  functionCard(
                      name: "Stake Tokens", details: StakeTokenDetail()),
                  SizedBox(height: 15.0),
                  functionCard(
                      name: "Claim Rewards", details: ClaimRewardDetail()),
                  SizedBox(height: 15.0),
                ],
              ),
            ));
  }
}
