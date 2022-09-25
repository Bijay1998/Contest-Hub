import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Image {
  File? images;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagePath = File(image.path);
    } on PlatformException catch (err) {
      return "Unable to Pick Image: $err";
    }
  }
}
