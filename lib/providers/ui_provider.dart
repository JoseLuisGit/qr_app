import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _currentIndexScreen = 0;


  int get currentIndexScreen => _currentIndexScreen;

  set setCurrentIndexScreen(int current){
    _currentIndexScreen = current;
    notifyListeners();
  }

}