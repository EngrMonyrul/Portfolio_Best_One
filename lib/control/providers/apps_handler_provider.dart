import 'package:flutter/foundation.dart';

class AppsHandlerProvider extends ChangeNotifier{
  bool _showDrawer = false;

  bool get showDrawer => _showDrawer;

  setDrawer(){
    _showDrawer = !_showDrawer;
    notifyListeners();
  }
}