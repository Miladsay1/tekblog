import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'package:tekblog/controller/file_controller.dart';

FilePickerController filepickercontroller = Get.put(FilePickerController());
Future pichFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filepickercontroller.file.value = result!.files.first;
}
