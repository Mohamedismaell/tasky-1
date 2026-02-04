import 'package:flutter/material.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';

class HomeController with ChangeNotifier {
  String? username = "Default";
  String? userImagePath;

  void ini() {
    loadUserName();
  }

  void loadUserName() async {
    username = PreferencesManager().getString(StorageKey.username);
    userImagePath = PreferencesManager().getString('user_image');
    notifyListeners();
  }
}
