import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/database/boxes/boxes.dart';
import 'package:student_management/database/model/model.dart';
import 'package:student_management/screen/widgets/appbar_wiget.dart';
import 'package:student_management/screen/widgets/image_picking.dart';
import 'package:student_management/screen/widgets/text_widget.dart';
import 'package:student_management/screen/widgets/textformfield_widget.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final rollNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'Add Student'),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                imagePicking(),
                kHeight20,
                kHeight10,
                TextFormFieldWidget(
                  conroller: nameController,
                  labelText: 'Name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter Name Of student';
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
                      return 'Enter Age of the Student';
                    }
                    return null;
                  },
                ),
                kHeight20,
                TextFormFieldWidget(
                  conroller: rollNumberController,
                  labelText: 'Roll no',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Enter RollNO of Student';
                    }
                    return null;
                  },
                ),
                kHeight20,
                ElevatedButton(
                  onPressed: () {
                    if (controller.selectedImage.value.isNotEmpty) {
                      if (formKey.currentState!.validate()) {
                        int age = int.parse(ageController.text);
                        int rollNo = int.parse(rollNumberController.text);

                        box.add(
                          StudentModel(
                              name: nameController.text,
                              age: age,
                              rollNumber: rollNo,
                              imageUrl: controller.selectedImage.value),
                        );
                        nameController.clear();
                        ageController.clear();
                        rollNumberController.clear();
                        controller.selectedImage.value = '';

                        Get.back();
                        controller.updateStudentListView();
                        Get.snackbar('Success', 'Created Successfully',
                            backgroundColor: Color.fromARGB(106, 54, 244, 73),
                            dismissDirection: DismissDirection.horizontal);
                      }
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text('plz select image'),
                      //   duration: Duration(milliseconds: 500),
                      // ));
                      Get.snackbar('error', 'Plz Select image',
                          backgroundColor:
                              const Color.fromARGB(106, 244, 67, 54),
                          dismissDirection: DismissDirection.horizontal);
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff1995AD))),
                  child: textWidget(text: 'Create'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
