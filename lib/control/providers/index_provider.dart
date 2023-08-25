import 'package:flutter/foundation.dart';
import 'package:untitled2/control/widgets/image_fetch.dart';

class IndexProvider extends ChangeNotifier {
  int _index = 0;
  final getImgs = ImageFetch();
  bool _aboutme = false;
  bool _mycv = false;
  bool _services = false;
  bool _contact = false;

  bool get aboutme => _aboutme;
  bool get mycv => _mycv;
  bool get services => _services;
  bool get contact => _contact;
  int get index => _index;

  void setaboutme(){
    _aboutme = !_aboutme;
    _contact = false;
    _services = false;
    _mycv = false;
  }

  void setmycv(){
    _aboutme = false;
    _contact = false;
    _services = false;
    _mycv = !_mycv;
  }

  void setservice(){
    _aboutme = false;
    _contact = false;
    _services = !_services;
    _mycv = false;
  }

  void setcontact(){
    _aboutme = false;
    _contact = _contact;
    _services = false;
    _mycv = false;
  }

  Future<void> changeIndex() async {
    List<String> bgImgs = await getImgs.fetchBgImg();
    if (index < bgImgs.length) {
      _index++;
    } else {
      _index = 0;
    }

    notifyListeners();
  }
}
