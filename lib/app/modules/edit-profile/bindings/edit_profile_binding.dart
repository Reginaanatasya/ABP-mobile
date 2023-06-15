import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilController>(
      () => EditProfilController(),
    );
  }
}
