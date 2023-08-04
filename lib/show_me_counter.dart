import 'package:flutter/material.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: const Center(
        child: Text(
          '0',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 52.0,
          ),
          // BlocBuilder<CounterCubit, CounterState>(
          //   builder: (context, state) {
          //     return Text(
          //       '${state.counter}',
          //       style: const TextStyle(
          //         color: Colors.blue,
          //         fontSize: 52.0,
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
