import 'package:crypto_viewer/controller/TrackerProvider.dart';
import 'package:crypto_viewer/model/CryptoModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoList extends StatelessWidget {
  CryptoList({super.key});

  late List<CryptoModel> data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<TrackerProvider>(context).CCdata;
    return Expanded(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildList(context, index)),
    );
  }

  _buildList(BuildContext context, int i) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      title: Text(data[i].symbol),
      subtitle: Text(data[i].currency),
      leading: CircleAvatar(radius: 30, child: Text(data[i].symbol)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(data[i].price.toString()),
          const SizedBox(height: 7),
          Text(
            (data[i].jump > 0)
                ? data[i].jump.toStringAsFixed(2)
                : data[i].jump.toString(),
            style: TextStyle(
                color: (data[i].jump > 0) ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}
