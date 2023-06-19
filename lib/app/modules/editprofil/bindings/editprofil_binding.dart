import 'package:get/get.dart';

import '../controllers/editprofil_controller.dart';

class EditprofilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditprofilController>(
      () => EditprofilController(),
    );
  }
}
