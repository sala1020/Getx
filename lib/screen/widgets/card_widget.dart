import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/database/model/model.dart';
import 'package:student_management/screen/widgets/image_picking.dart';
import 'package:student_management/screen/widgets/text_widget.dart';
import 'package:student_management/screen/widgets/textformfield_widget.dart';

Card cardWidget(
    {required StudentModel details,
    required int index,
    required BuildContext context}) {
  return Card(
    color: const Color(0xff1995AD),
    elevation: 19,
    shadowColor: Colors.grey,
    child: Column(
      children: [
        const Spacer(),
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: FileImage(File(
            details.imageUrl,
          )),
        ),
        textWidget(
          text: 'Name: ${details.name}',
        ),
        textWidget(text: 'Age: ${details.age}'.toString()),
        textWidget(text: 'Roll No: ${details.rollNumber}'.toString()),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.deleteStudent(index: index);
              },
              icon: const Icon(
                Icons.delete,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return editDialogue(
                        index: index, details: details, context: context);
                  },
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

editDialogue({
  required int index,
  required StudentModel details,
  required BuildContext context,
}) {
  var nameController = TextEditingController(
    text: details.name,
  );
  var ageController = TextEditingController(
    text: details.age.toString(),
  );
  var rollNumberController = TextEditingController(
    text: details.rollNumber.toString(),
  );
  var formKey = GlobalKey<FormState>();

  return Center(
    child: SingleChildScrollView(
      child: AlertDialog(
        shadowColor: Colors.black,
        title: SizedBox(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  pickimage();
                },
                child: Obx(
                  () => CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: controller.selectedImage.value.isEmpty
                        ? FileImage(
                            File(
                              details.imageUrl,
                            ),
                          )
                        : FileImage(
                            File(
                              controller.selectedImage.value,
                            ),
                          ),
                  ),
                ),
              ),
              kHeight20,
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        conroller: nameController,
                        keyboardType: TextInputType.name,
                        labelText: 'Name',
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Field is emtpy';
                          }
                          return null;
                        },
                      ),
                      kHeight20,
                      TextFormFieldWidget(
                        conroller: ageController,
                        labelText: 'Age',
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Field is emtpy';
                          }
                          return null;
                        },
                      ),
                      kHeight20,
                      TextFormFieldWidget(
                        conroller: rollNumberController,
                        labelText: 'RollNo',
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Field is emtpy';
                          }
                          return null;
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (controller.selectedImage.isNotEmpty ||
                  details.imageUrl.isNotEmpty) {
                if (formKey.currentState!.validate()) {
                  int age = int.parse(ageController.text);
                  int rollNo = int.parse(rollNumberController.text);
                  controller.updateDetails(
                      index: index,
                      data: StudentModel(
                        name: nameController.text,
                        age: age,
                        rollNumber: rollNo,
                        imageUrl: controller.selectedImage.value.isEmpty
                            ? details.imageUrl
                            : controller.selectedImage.value,
                      ));
                  Get.back();
                }
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    ),
  );
}
