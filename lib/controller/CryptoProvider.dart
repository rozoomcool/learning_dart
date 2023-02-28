import 'dart:convert';
import 'package:crypto_viewer/service/CryptoService.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/CryptoModel.dart';

class CryptoProvider extends ChangeNotifier {

  final CryptoService _service = CryptoService();
  List<CryptoModel> cryptoData = [];

  CryptoProvider() {
    getCryptoData();
    notifyListeners();
  }

  Future<void> getCryptoData() async {
    cryptoData = await _service.getCryptoModelData();
    notifyListeners();
  }

  Future<void> getSortedCryptoByUsd() async {
    cryptoData = _service.FilterDataByUsd(cryptoData);
    notifyListeners();
  }
}
