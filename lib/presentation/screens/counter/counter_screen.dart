import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget  {
  const CounterScreen({super.key});
  static const String name = "counter_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final int clickCounter = ref.watch(counterProvider);
    final bool themeSelect = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed: (){
              ref.read( isDarkmodeProvider.notifier).update((state) =>  !state);
            }, 
            icon:  Icon( 
              themeSelect == false ? 
                Icons.light_mode_outlined :  
                Icons.dark_mode_outlined
              )
            ) 
          ],
      ),
      body: Center(
        child: Text("Valor: $clickCounter", style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //! Esta es la implementación del botón. Es una mala practica usar el watch en métodos, genera cosas raras.
          ref.read(counterProvider.notifier).state ++;
          //? Si llego a necesitar el estado también puedo hacer la actualización así :
          // -> ref.read(counterProvider.notifier).update((state) => state ++);
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}