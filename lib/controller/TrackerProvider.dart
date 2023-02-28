import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/CryptoModel.dart';

class TrackerProvider extends ChangeNotifier {
  final url = Uri.https('api.blockchain.com', 'v3/exchange/tickers');
  final header = {'Accepts': 'application/json'};
  List<CryptoModel> CCdata = [];

  TrackerProvider() {}

  sortCCDataUSD() {
    CCdata = CCdata.where((e) => e.currency.contains('USDT') == true).toList();
  }

  Future<void> trackCrypto() async {
    final response = await http.get(url, headers: header);
    var allData = await jsonDecode(response.body) as List;
    for (int i = 0; i < allData.length; i++) {
      CryptoModel model = CryptoModel(
          symbol: allData[i]['symbol'].split('-')[0],
          currency: allData[i]['symbol'].split('-')[1],
          jump: allData[i]['price_24h'] - allData[i]['last_trade_price'],
          price: allData[i]['price_24h'],
          volume: allData[i]['volume_24h']);
      CCdata.add(model);
    }
    // sortCCDataUSD();
  }
}
