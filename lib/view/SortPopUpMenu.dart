import 'package:crypto_viewer/controller/CryptoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SampleItem { USD, EUR, BTC }

class SortPopUpMenu extends StatefulWidget {
  const SortPopUpMenu({super.key});

  @override
  State<SortPopUpMenu> createState() => _SortPopUpMenuState();
}

class _SortPopUpMenuState extends State<SortPopUpMenu> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: PopupMenuButton<SampleItem>(
          initialValue: selectedMenu,
          // Callback that sets the selected popup menu item.
          onSelected: (SampleItem item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
            PopupMenuItem<SampleItem>(
              value: SampleItem.USD,
              child: FilledButton(
                onPressed: () => Provider.of<CryptoProvider>(context, listen: false).getSortedCryptoByUsd(),
                child: const Text('USD'),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.EUR,
              child: FilledButton(
                onPressed: () => Provider.of<CryptoProvider>(context, listen: false).getSortedCryptoByEur(),
                child: const Text('EUR'),
              ),
            ),
            PopupMenuItem<SampleItem>(
              value: SampleItem.BTC,
              child: FilledButton(
                onPressed: () => Provider.of<CryptoProvider>(context, listen: false).getSortedCryptoByBtc(),
                child: const Text('BTC'),
              ),
            ),
          ],
        ),
      );
  }
}