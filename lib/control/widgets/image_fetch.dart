import 'package:firebase_storage/firebase_storage.dart';

class ImageFetch {

  Future<List<String>> fetchBgImg() async {
    final ListResult result =
        await FirebaseStorage.instance.ref().child('bgimg').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    return bgImg;
  }

  Future<String> fetchLoadingImg() async {
    final Reference ref = FirebaseStorage.instance.ref().child('icons/loading.gif');

    return ref.getDownloadURL();
  }

  Future<List<String>> fetchSplashImg() async {
    final ListResult result =
    await FirebaseStorage.instance.ref().child('splashimg').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    return bgImg;
  }

  Future<List<String>> fetchProfileImg() async {
    final ListResult result =
    await FirebaseStorage.instance.ref().child('profile').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    return bgImg;
  }
}
