// import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

getImageGallary(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? image = await imagePicker.pickImage(source: source);
  if (image != null) {
    return await image.readAsBytes();
  }
}

getImageCamera(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  if (photo != null) {
    return await photo.readAsBytes();
  }
}
