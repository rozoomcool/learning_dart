import 'package:equatable/equatable.dart';

class CryptoModel extends Equatable {
  String symbol;
  String currency;
  double jump;
  double price;
  double volume;

  CryptoModel(
      {required this.symbol,
      required this.currency,
      required this.jump,
      required this.price,
      required this.volume});

  @override
  List<Object?> get props => [currency, symbol];
}
