import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
void main() {
  runApp(
    //! Lo primero que tengo que hacer al usar riverpod es envolver mi función main en este widget
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bool themeSelect = ref.watch(isDarthModeProvider);
    final int selectedIndex = ref.watch( selectedIndexProvider );
    return MaterialApp.router(
      title: "Flutter Widgets",
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedIndex, isDarkMode: themeSelect).getTheme(),
      
    );
  }
}
