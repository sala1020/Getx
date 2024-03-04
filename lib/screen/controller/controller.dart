import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hive/hive.dart';
import 'package:student_management/database/boxes/boxes.dart';
import 'package:student_management/database/model/model.dart';

class StudentController extends GetxController {
  final RxString selectedImage = ''.obs;

  static StudentController get to => Get.find();
  @override
  void onInit() {
    super.onInit();
    updateStudentListView();
    // Call method to populate data
  }

  Box<StudentModel> studentBox = Hive.box<StudentModel>('StudentDetails');

  void updateStudentListView() {
    List<StudentModel> newData = box.values.cast<StudentModel>().toList();
    for (var student in newData) {
      if (!studentBox.values.contains(student)) {
        studentBox.add(student);
      }
    }

    update();
  }

  void updateDetails({required int index, required StudentModel data}) {
    studentBox.putAt(index, data);

    update();
  }

  void deleteStudent({required int index}) {
    studentBox.deleteAt(index);

    update();
  }
}
