import 'dart:async';

class ThemeBloc {
  final _themeStream = StreamController<bool>.broadcast();

  // =====================================================================
  // Setters
  // =====================================================================
  Function(bool) get changeTheTheme => _themeStream.sink.add;

  // =====================================================================
  // Getters
  // =====================================================================
  Stream<bool> get darkThemeIsEnabled => _themeStream.stream;

  // Dispose
  void dispose() async {
    await _themeStream?.close();
  }
}
