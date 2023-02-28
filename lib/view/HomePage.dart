import 'package:crypto_viewer/controller/TrackerProvider.dart';
import 'package:crypto_viewer/view/CryptoList.dart';
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
        child: CryptoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<TrackerProvider>(context, listen: false).trackCrypto(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
