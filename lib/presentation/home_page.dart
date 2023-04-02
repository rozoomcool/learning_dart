import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/widgets/test_tile.dart';

import 'package:test_app/domain/test_bloc.dart';
import 'package:test_app/model/test_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = TestBloc();

    return Scaffold(
      appBar: AppBar(title: const Text('Test app'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TestBloc, List<TestModel>>(
          builder: (context, state) {
            bloc.add(TestGetEvent());
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, snapshot) {
                context
                    .read<TestBloc>()
                    .add(TestDoneResetByTestIndex(snapshot));

                return TestTile(test: state[snapshot], index: snapshot);
              },
            );
          },
        ),
      ),
    );
  }
}
