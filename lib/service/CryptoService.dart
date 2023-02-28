import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/CryptoModel.dart';

class CryptoService{

  final url = Uri.https('api.blockchain.com', 'v3/exchange/tickers');
  final header = {'Accepts': 'application/json'};

  Future<List> _getCryptoData() async{
    final response = await http.get(url, headers: header);
    return jsonDecode(response.body);
  }

  Future<List<CryptoModel>> getCryptoModelData() async {

    List<CryptoModel> cryptoModelData = [];

    List cryptoData = await _getCryptoData();

    for (int i = 0; i < cryptoData.length; i++) {
      CryptoModel model = CryptoModel(
          symbol: cryptoData[i]['symbol'].split('-')[0],
          currency: cryptoData[i]['symbol'].split('-')[1],
          jump: cryptoData[i]['price_24h'] - cryptoData[i]['last_trade_price'],
          price: cryptoData[i]['price_24h'],
          volume: cryptoData[i]['volume_24h']);
      cryptoModelData.add(model);
    }

    return cryptoModelData;
  }

  Future<List<CryptoModel>> FilterDataByUsd() async{
    List<CryptoModel> data = await getCryptoModelData();
    return data.where((e) => e.currency.contains('USD')).toList();
  }

  Future<List<CryptoModel>> FilterDataByEur() async {
    List<CryptoModel> data = await getCryptoModelData();
    return data.where((e) => e.currency.contains('EUR')).toList();
  }

  Future<List<CryptoModel>> FilterDataByBtc() async {
    List<CryptoModel> data = await getCryptoModelData();
    return data.where((e) => e.currency.contains('BTC')).toList();
  }

}
