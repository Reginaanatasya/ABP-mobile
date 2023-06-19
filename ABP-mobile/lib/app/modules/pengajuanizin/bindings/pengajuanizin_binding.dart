import 'package:get/get.dart';

import '../controllers/pengajuanizin_controller.dart';

class PengajuanizinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanizinController>(
      () => PengajuanizinController(),
    );
  }
}
