import 'package:crypto_viewer/controller/CryptoProvider.dart';
import 'package:crypto_viewer/view/CryptoList.dart';
import 'package:crypto_viewer/view/CryptoSorter.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Viewer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const CryptoSorter(),
            Expanded(child: CryptoList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CryptoProvider>(context, listen: false).getCryptoData(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
