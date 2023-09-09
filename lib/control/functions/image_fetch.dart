import 'package:firebase_storage/firebase_storage.dart';

class ImageFetch {

  List<String> bgImgs = [];
  String downloadUrl = '';
  List<String> splashImgs = [];
  List<String> profileImgs = [];

  Future<void> fetchBgImg() async {
    final ListResult result =
        await FirebaseStorage.instance.ref().child('bgimg').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    bgImgs = bgImg;
  }

  Future<void> fetchLoadingImg() async {
    final Reference ref = FirebaseStorage.instance.ref().child('icons/loading.gif');

    downloadUrl = await ref.getDownloadURL();
  }

  Future<void> fetchSplashImg() async {
    final ListResult result =
    await FirebaseStorage.instance.ref().child('splashimg').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    splashImgs = bgImg;
  }

  Future<void> fetchProfileImg() async {
    final ListResult result =
    await FirebaseStorage.instance.ref().child('profile').listAll();
    List<String> bgImg = result.items.map((e) => e.fullPath).toList();

    profileImgs = bgImg;
  }
}
