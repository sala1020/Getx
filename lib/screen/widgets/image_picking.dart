import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management/screen/controller/controller.dart';

StudentController controller = Get.put(StudentController());

GestureDetector imagePicking() {
  return GestureDetector(
      onTap: () {
        pickimage();
      },
      child: Obx(
        () => CircleAvatar(
          backgroundColor: Colors.white,
          radius: 70,
          backgroundImage: controller.selectedImage.isEmpty
              ? Image.asset(
                  'assets/profile1.png',
                  fit: BoxFit.fill,
                ).image
              : Image.file(
                  File(controller.selectedImage.value),
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                ).image,
        ),
      ));
}

void pickimage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    controller.selectedImage.value = image.path.toString();
  }
  return null;
}
