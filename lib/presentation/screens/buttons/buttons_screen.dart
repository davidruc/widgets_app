import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = "button_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons screen"),
      ),
      body: _ButtomsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // puedo usar pop para volver gracias a la librería de go_router
          context.pop();
        }, 
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtomsView extends StatelessWidget {
  const _ButtomsView();

  @override
  Widget build(BuildContext context) {


    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(
          spacing: 10,
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Eleveted')),
            
            const ElevatedButton(onPressed: null, child:  Text('Eleveted Disabled')),
            
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_sharp), label: const Text("Elevated-Icon")),

            FilledButton(onPressed: (){}, child: const Text("filled")),

            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.add), label: const Text("Filled-icon")),

            OutlinedButton(onPressed: (){}, child: const Text("outlined")),

            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.ice_skating_rounded),label: const Text("outlined")),

            TextButton(onPressed: (){}, child: const Text("text-button")),

            TextButton.icon(onPressed: (){}, icon:const Icon(Icons.add_photo_alternate),label: const Text("text-button")),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                iconColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(colors.primary)
              ),  
            ),

            _CustomButton(),
          ],
        ),
      ),
    );
  }
}


class _CustomButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("hola mundo", style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );
  }
}