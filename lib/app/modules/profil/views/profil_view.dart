import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../../karyawan/models/karyawan.dart';
import '../../../routes/app_pages.dart';
import '../../karyawan/models/karyawan.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  final Karyawan karyawan;

  const ProfilView({required this.karyawan, Key? key}) : super(key: key);
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
                              karyawan?.nama ?? '',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ), // Jarak antara teks dengan konten selanjutnya, atur sesuai kebutuhan Anda
                            Text(
                              karyawan?.nik ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              karyawan?.jabatan ?? '',
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
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height:
                                          30), // Jarak dari bagian atas container
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(0, 244, 67,
                                          54), // Ganti dengan warna yang sesuai untuk tombol menu pertama
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color.fromARGB(50, 0, 0,
                                            0), // Ganti dengan warna border yang diinginkan
                                        width:
                                            2.0, // Ganti dengan lebar border yang diinginkan
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            'Edit Profil',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: ImageIcon(
                                            AssetImage('assets/logo/next.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                      height:
                                          10), // Jarak antara tombol pertama dan kedua
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(0, 76, 175,
                                          79), // Ganti dengan warna dan konten yang sesuai untuk tombol menu kedua
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color.fromARGB(50, 0, 0,
                                            0), // Ganti dengan warna border yang diinginkan
                                        width:
                                            2.0, // Ganti dengan lebar border yang diinginkan
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              // Replace '1234567890' with the desired WhatsApp number
                                              String whatsappNumber =
                                                  '1234567890';
                                              // Create a WhatsApp URL with the given number
                                              String url =
                                                  'https://wa.me/$whatsappNumber';
                                              // Launch the URL using the url_launcher package
                                              launch(url);
                                            },
                                            child: Text(
                                              'Hubungi Admin',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: ImageIcon(
                                            AssetImage('assets/logo/next.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          10), // Jarak antara tombol kedua dan ketiga
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(0, 33, 149,
                                          243), // Ganti dengan warna dan konten yang sesuai untuk tombol menu ketiga
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color.fromARGB(50, 0, 0,
                                            0), // Ganti dengan warna border yang diinginkan
                                        width:
                                            2.0, // Ganti dengan lebar border yang diinginkan
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            'Kerjasama dengan Kami',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: ImageIcon(
                                            AssetImage('assets/logo/next.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(height: 50),
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
                                      Get.toNamed(Routes.HOME,
                                          arguments: karyawan);
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
                                      Get.toNamed(Routes.IZIN,
                                          arguments: karyawan);
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
                                      Get.toNamed(Routes.PROFIL,
                                          arguments: karyawan);
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
