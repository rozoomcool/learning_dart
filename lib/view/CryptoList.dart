import 'package:crypto_viewer/controller/CryptoProvider.dart';
import 'package:crypto_viewer/model/CryptoModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoList extends StatelessWidget {
  CryptoList({super.key});

  List<CryptoModel> data = [];

  @override
  Widget build(BuildContext context) {
    data = Provider.of<CryptoProvider>(context).cryptoData;

    if(data.isNotEmpty){
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildList(context, index));
    }else{
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: LinearProgressIndicator(
            minHeight: 20,
          ),
        ),
      );
    }

  }

  _buildList(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(right:5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)]
        ),
        child: ListTile(
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
        ),
      ),
    );
  }
}
