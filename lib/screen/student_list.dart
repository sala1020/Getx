import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/screen/add_student.dart';
import 'package:student_management/screen/controller/controller.dart';
import 'package:student_management/screen/widgets/appbar_wiget.dart';
import 'package:student_management/screen/widgets/card_widget.dart';

class Students extends StatelessWidget {
  Students({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddStudent());
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.person_add,
          color: Colors.black,
        ),
      ),
      appBar: appBarWidget(title: 'Students'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
         
            kHeight20,
            Expanded(
              child: GetBuilder<StudentController>(
                  init: StudentController(),
                  builder: (controller) {
                    return  controller.studentBox.values.isEmpty
                            ? Center(
                                child: Text('No data'),
                              )
                            : GridView.builder(
                                    itemCount: controller.studentBox.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                      childAspectRatio: 6 / 9,
                                    ),
                                    itemBuilder: (context, index) {
                                      final data =
                                          controller.studentBox.getAt(index);
                                      return cardWidget(
                                          details: data!,
                                          index: index,
                                          context: context);
                                    },
                                  );
                               
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
