
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  static const name = 'theme_changer_screen';
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode= ref.watch(themeNotifierProvider).isDarkMode;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Changer"),
        actions: [
            IconButton(
            onPressed: (){
              ref.read( themeNotifierProvider.notifier ).toggleDarkmode();
            }, 
            icon:  Icon( 
              isDarkMode == false ? 
                Icons.light_mode_outlined :  
                Icons.dark_mode_outlined
              )
            ) 
        ]),
        body: const _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedIndex = ref.watch( selectedIndexProvider );
    final int selectedIndex = ref.watch( themeNotifierProvider ).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text("${color.value}"),
          activeColor: color,
          value: index, 
          groupValue: selectedIndex, 
          onChanged: (value) {
            ref.read( themeNotifierProvider.notifier).chnageColorIndex(index);
          },
        );
      },
    );
  }
}