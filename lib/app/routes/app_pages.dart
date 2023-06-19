import 'package:get/get.dart';

import '../modules/editprofil/bindings/editprofil_binding.dart';
import '../modules/editprofil/views/editprofil_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/izin/bindings/izin_binding.dart';
import '../modules/izin/views/izin_view.dart';
import '../modules/karyawan/models/karyawan.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pengajuanizin/bindings/pengajuanizin_binding.dart';
import '../modules/pengajuanizin/views/pengajuanizin_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () {
        final karyawan = Get.arguments as Karyawan?;
        return HomeView(
            karyawan: karyawan ??
                Karyawan(nama: '', nik: '', jabatan: '', cabang: ''));
      },
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(karyawan: Get.arguments as Karyawan),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.IZIN,
      page: () {
        final karyawan = Get.arguments as Karyawan?;
        return IzinView(
            karyawan: karyawan ??
                Karyawan(nama: '', nik: '', jabatan: '', cabang: ''));
      },
      binding: IzinBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUANIZIN,
      page: () => const PengajuanizinView(),
      binding: PengajuanizinBinding(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => ProfilView(karyawan: Get.arguments as Karyawan),
    ),
    GetPage(
      name: _Paths.EDITPROFIL,
      page: () => EditprofilView(),
      binding: EditprofilBinding(),
    ),
  ];
}
