import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_app/presentation/map_page.dart';
import 'package:test_app/widgets/test_tile.dart';

import 'package:test_app/domain/test_bloc.dart';
import 'package:test_app/model/test_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = TestBloc();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Задачи для непоседы'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://www.kinonews.ru/insimgs/2023/newsimg/big/newsimg112952.jpg'),
              ),
            )
          ],
          centerTitle: true),
      body: _selectedIndex == 1 ? MapPage() : Padding(
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
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'SandMap')
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.green,
      onTap: _onItemTapped,)
    );
  }
}
