import 'package:attendify/app/modules/karyawan/models/karyawan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 84, // Menyesuaikan tinggi toolbar
        backgroundColor: Color.fromARGB(0, 121, 135, 123),
        elevation: 0,
        title: Text(
          "Profil",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: 528,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/homebg-attendify.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.6),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 133,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 153, 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Color.fromARGB(0, 237, 145, 17),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/logo/logokaryawan.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              MainAxisAlignment.start, // Menggeser teks ke kiri
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Menempelkan teks ke kiri
                          children: [
                            Text(
                              'Bernie',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ), // Jarak antara teks dengan konten selanjutnya, atur sesuai kebutuhan Anda
                            Text(
                              '123456',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              'IT',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Text(
                              'Bandung',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 400),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: Color.fromARGB(0, 82, 45, 45),
                    ),
                    Expanded(
                      child: Container(
                        color: Color.fromARGB(0, 232, 115, 115),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Get.toNamed(
                                      Routes.EDITPROFIL,
                                      arguments: {
                                        "karyawan": Karyawan(
                                          nama: "Kevin",
                                          nik: "1234",
                                          jabatan: "Karyawan",
                                        ),
                                        "token": "12345"
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Edit Profil",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 25),
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.offNamed(Routes.LOGIN);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 181, 23, 42),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Keluar',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // navbar
                              height: 75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HOME);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/logo/Home-Off.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Beranda',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.IZIN);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/logo/Paper-Off.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Izin',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //bingung
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/logo/Profile-On.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Profil',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
