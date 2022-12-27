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
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc get _counterBloc => BlocProvider.of<CounterBloc>(context);

  Widget _buildCommonButton(Widget child, CounterEvent event) {
    return FloatingActionButton(
      onPressed: () => _counterBloc.add(event),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.title)),
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
                    _buildCommonButton(
                      const Text('+'),
                      CounterIncrementEvent(),
                    ),
                    _buildCommonButton(
                      const Text('-'),
                      CounterDecrementEvent(),
                    ),
                    _buildCommonButton(
                      const Text('x2'),
                      CounterDoubleEvent(),
                    ),
                  ],
                ),
                _buildCommonButton(const Text('R'), CounterResetEvent()),
              ],
            ),
          ),
        );
      },
    );
  }
}
