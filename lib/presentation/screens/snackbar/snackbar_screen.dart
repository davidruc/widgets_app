import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});
  static const name = "snackbar_screen";

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar =  SnackBar(
      content: const Text("hola mundo"),
      action: SnackBarAction(label: "ok!", onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar
    );
  }

  void openDialog (BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) =>  AlertDialog(
        title: const Text("Estás seguro? "),
        content: const Text("Esto fácilmente podría ser un dialogo con información"),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: const Text("Cancelar")),
          FilledButton(onPressed: ()=>context.pop(), child: const Text("Aceptar")),

        ],
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y dialogos"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                //!De estaforma podemos ver todas las licencias de la aplicacion
                showAboutDialog(
                  context: context,
                  children: [
                    const Text("Esto fácilmente podría ser un dialogo con información acerca de las licencias.")
                  ]
                );
              } , 
              child: const Text("Licencias usadas")
            ),
            FilledButton.tonal(
              onPressed: ()=> openDialog(context), 
              child: const Text("Show a Dialog"))
          ],
          
        )
      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        }, 
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}