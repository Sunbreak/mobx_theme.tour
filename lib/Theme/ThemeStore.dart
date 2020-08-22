import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'ThemeService.dart';

part 'ThemeStore.g.dart';

class ThemeStore extends _ThemeStore with _$ThemeStore {
  ThemeStore(ThemeService themeService) : super(themeService);
}

abstract class _ThemeStore with Store {
  _ThemeStore(this._themeService);

  final ThemeService _themeService;

  @computed
  bool get isDark => theme.brightness == Brightness.dark;

  @observable
  ThemeData theme;

  @action
  Future<void> getTheme() async {
    theme = await _themeService.getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    theme = await _themeService.toggleTheme(theme);
  }
}
