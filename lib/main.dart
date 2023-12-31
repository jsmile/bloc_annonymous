import 'package:bloc_annonymous/cubits/counter/counter_cubit.dart';
import 'package:bloc_annonymous/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Annonyous Route',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primarySwatch: Colors.blue,
        // primaryColor: Colors.blue[300],
        // useMaterial3: true,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'BLoC Annonyous Route Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext myHomePageContext) {
    // MyHomePage context
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Show me Counter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  // Navigator.push : new sub-route 생성
                  myHomePageContext, // MyHomePage context
                  MaterialPageRoute(
                    builder: (pageRouteContext) {
                      // .value() 생성자를 통해서
                      return BlocProvider.value(
                        // widget tree 에서 이미 존재하는 value:에 해당하는 class 를 찾아줌
                        value: myHomePageContext
                            .read<CounterCubit>(), // context error
                        child: const ShowMeCounter(),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text(
                'Increment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                // MyHomePage context
                // context.read<CounterCubit>().increment();
                BlocProvider.of<CounterCubit>(myHomePageContext).increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
