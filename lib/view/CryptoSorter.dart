import 'package:crypto_viewer/view/SortPopUpMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoSorter extends StatelessWidget{
  const CryptoSorter({super.key});

  final TextStyle primary = const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)]
      ),
      alignment: Alignment.center,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Sort: ', style: primary,),
          const SortPopUpMenu()
        ],
      ),
    );
  }

}