import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu-items/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = "home_screen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: appMenuItems.length,
        itemBuilder: ((context, index) {
          final menuItem = appMenuItems[index];
          return _CustomListTitle(menuItem: menuItem);
        }));
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        // Navigator.pushNamed(context, menuItem.url);

        //! En la documentación utilizan go, pero push es para poder facilitar la navagación
        context.push(menuItem.url);

        //? También lo puedo hacer usando context.pushName() pero tendría que crear una casilla en menuItem que me permita acceder dinámicamente a esa ruta. Por ahora o en este ejemplo lo usaré con push.
      },
    );
  }
}
