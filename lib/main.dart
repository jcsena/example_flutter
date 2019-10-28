import 'package:flutter/material.dart';
import 'ticker/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_with_stream/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        builder: (context) => TickerBloc(Ticker()),
        child: MyHomePage(),
      ),
    );
  }
}

void _showModalTwo(BuildContext context) {
  final bloc = BlocProvider.of<TickerBloc>(context);
  showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final bloc = BlocProvider.of<TickerBloc>(context);
        return Container(
          color: Colors.transparent,
          child: Container(
            color: Colors.amber,
          ),
          height: 100,
        );
      });
}

void _showModalOne(BuildContext context) {
  final bloc = BlocProvider.of<TickerBloc>(context);
  showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Container(
            color: Colors.amber,
          ),
          height: 100,
        );
      });
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc with Streams'),
      ),
      body: BlocBuilder<TickerBloc, TickerState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _showModalOne(context);
                      },
                      child: Center(
                        child: Text('Button example One'),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showModalTwo(context);
                      },
                      child: Center(
                        child: Text('Button example Two'),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
