import 'package:bloc_example/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        themeMode: ThemeMode.dark,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildCommonButton(String symbol, CounterEvent event) {
    return FloatingActionButton(
      onPressed: () => BlocProvider.of<CounterBloc>(context).add(event),
      child: Text(symbol),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Operations - ${state.operationsCounter}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  state.value.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCommonButton('+', CounterIncrementEvent()),
                    _buildCommonButton('-', CounterDecrementEvent()),
                    _buildCommonButton('x2', CounterDoubleEvent()),
                  ],
                ),
                _buildCommonButton('R', CounterResetEvent()),
              ],
            ),
          ),
        );
      },
    );
  }
}
