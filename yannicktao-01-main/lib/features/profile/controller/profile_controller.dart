import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController businessLocationController = TextEditingController();
  final TextEditingController serviceAreaController = TextEditingController();
  RxString service = ''.obs;
  RxList serviceArea = [].obs;

  void addServiceArea(String value) {
    serviceArea.add(value);
    serviceAreaController.clear();
  }
  void removeServiceArea(String value) => serviceArea.remove(value);

  var profileImage = Rxn<File>();
  final ImagePicker _picker = ImagePicker();


  void selectService(String value) {
    service.value = value;
  }

  // Pick image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        profileImage.value = File(image.path);
        print('Image picked from gallery: ${image.path}');
      } else {
        print('No image selected from gallery');
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
      Get.snackbar('Error', 'Failed to pick image');
    }
  }

  // Capture image from camera
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        profileImage.value = File(image.path);
        print('Image captured from camera: ${image.path}');
      } else {
        print('No image captured from camera');
      }
    } catch (e) {
      print('Error capturing image from camera: $e');
      Get.snackbar('Error', 'Failed to capture image');
    }
  }

  // Save image (example: local storage or server upload)
  Future<void> saveImage() async {
    if (profileImage.value == null) {
      Get.snackbar('Error', 'No image selected');
      return;
    }

    try {
      // Example: Save to local storage
      // final directory = await getApplicationDocumentsDirectory();
      // final path = '${directory.path}/profile_image.png';
      // await profileImage.value!.copy(path);
      // print('Image saved to: $path');

      // Example: Upload to server (uncomment if needed)
      /*
      final uri = Uri.parse('YOUR_SERVER_UPLOAD_URL');
      final request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('image', profileImage.value!.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        throw Exception('Failed to upload image');
      }
      */

      Get.snackbar('Success', 'Profile image saved');
    } catch (e) {
      print('Error saving image: $e');
      Get.snackbar('Error', 'Failed to save image');
    }
  }

  // Clear image
  void clearImage() {
    profileImage.value = null;
  }
}