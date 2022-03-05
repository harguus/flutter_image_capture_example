// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  final ImagePicker picker = ImagePicker();
  List<XFile>? images = [];
  List<XFile>? cameraImages = [];
  XFile image = XFile('');

  @override
  void onInit() {
    initImages();
    super.onInit();
  }

  void initImages() async {}

  Future getImages() async {
    List<XFile>? temp = await picker.pickMultiImage(
      imageQuality: 10,
    );
    if (temp != null) {
      images = temp;
      update();
    }
  }

  void removeImagesGallery(int i) {
    images!.removeAt(i);
    update();
  }

  Future takeImage() async {
    XFile image = (await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 300,
      maxWidth: 400,
      imageQuality: 100,
    ))!;
    print(image.path);
    cameraImages!.add(image);
    update();
  }

  void removeImagesCamera(int i) {
    cameraImages!.removeAt(i);
    update();
  }
}
