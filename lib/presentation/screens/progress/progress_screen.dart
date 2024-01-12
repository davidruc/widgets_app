import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  static const name = "progress_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("progress Indicators"),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children:  [
          SizedBox(height: 30),
          Text("circular progress Indicator"),
          SizedBox(height: 20),
          CircularProgressIndicator( 
            strokeWidth: 2, 
            backgroundColor: Color.fromARGB(28, 0, 0, 0)
          ),
          
          SizedBox(height: 40),
          Text("Progress Indicator controled"),
          SizedBox(height: 20),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic( const Duration(milliseconds: 300 ), (value){
        return (value * 2) / 100; 
      }).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue,  strokeWidth: 2, backgroundColor: const Color.fromARGB(26, 0, 0, 0),),
              const SizedBox(width: 30,height: 20),
              //! El linearProgressIndicator NO PUEDE ejecutarse sin un tamaño determinado, por lo que va a necesitar un widget que le diga que espacio va a abarcar
              Expanded(
                child: LinearProgressIndicator(value: progressValue) 
              )
            ],
          ),
        );
      }
    );
  }
}