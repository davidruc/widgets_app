import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkmodeProvider = StateProvider((ref) => false);

// Para valores inmutables.
final colorListProvider = Provider((ref) => colorList);

// State es para mantener una pieza de estado.
final selectedIndexProvider = StateProvider((ref) => 3);



// Para mantener un estado un poco más eleborado. Es administrado por la clase ThemeNotifier que acabo de crear.y es de tipo AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// o ThemeController
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super(AppTheme());

  //Con esto realizo una instancia de la clase AppTheme(), usando la palabra super. puedo acceder a las propiedades y métodos de AppTheme

  void toggleDarkmode(){
    state = state.copyWith( null ,!state.isDarkMode);
  }

  void chnageColorIndex(int colorIndex) {
    state = state.copyWith(colorIndex , null);
  }

}