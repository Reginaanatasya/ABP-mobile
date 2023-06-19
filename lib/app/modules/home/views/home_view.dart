import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../karyawan/models/karyawan.dart';
import 'package:slider_button/slider_button.dart';
import '../../profil/views/profil_view.dart';
import '../controllers/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

class JamWidget extends StatefulWidget {
  @override
  _JamState createState() => _JamState();
}

class _JamState extends State<JamWidget> {
  String _timeString = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
  }

  void updateTime() {
    setState(() {
      _timeString = _formatDateTime(DateTime.now());
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: GoogleFonts.montserrat(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    );
  }
}

class HomeView extends GetView<HomeController> {
  final Karyawan karyawan;

  HomeView({required this.karyawan});
  @override
  Widget build(BuildContext context) {
    // Inisialisasi package intl
    Intl.defaultLocale = 'id_ID';
    initializeDateFormatting();
    // Membuat stream untuk jam yang terus terupdate
    Stream<DateTime> clockStream =
        Stream.periodic(Duration(seconds: 1), (_) => DateTime.now());

    // Access the karyawan object from Get.arguments
    final karyawan = Get.arguments as Karyawan?;
    final karyawanOrNull = karyawan ?? null;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 110, // Menyesuaikan tinggi toolbar
        backgroundColor: Color.fromARGB(0, 146, 190, 154),
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.only(left: 16), // Menambahkan jarak dari sisi kiri
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Halo, ",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                      text: karyawan?.nama ?? '',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "!",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "\n${karyawan?.jabatan ?? ''}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: "\n${karyawan?.cabang ?? ''}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: 30), // Menambahkan jarak dari sisi kanan
            child: CircleAvatar(
              radius: 35, // Mengatur ukuran lingkaran
              child: ClipOval(
                child: Image.asset(
                  'assets/logo/logokaryawan.png',
                  fit: BoxFit.cover, // Menyesuaikan gambar ke dalam lingkaran
                  width: 70, // Mengatur ukuran lebar gambar
                  height: 70, // Mengatur ukuran tinggi gambar
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 528,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background/homebg-attendify.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment(0, -0.5), // Atur nilai y sesuai kebutuhan
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(0, 255, 255, 255),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateFormat('EEEE, d MMMM y').format(DateTime.now()),
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      JamWidget(),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Action Absensi'),
                                  actions: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: SliderButton(
                                        action: () {
                                          // Custom button action
                                          // Add your custom logic here
                                          Get.find<HomeController>()
                                              .callPresensiApi(
                                                  karyawan?.nik ?? '');
                                          Get.offAllNamed(Routes.HOME,
                                              arguments: karyawan);
                                        },
                                        label: Text(
                                          'Absen Masuk',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.arrow_right_alt,
                                          color: Colors.white,
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 12, 0, 27),
                                        buttonSize: 48.0,
                                        baseColor: const Color.fromARGB(
                                            255, 66, 245, 69),
                                        highlightedColor: Colors.blue.shade800,
                                      ),
                                    ),
                                    SizedBox(width: 10, height: 20),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SliderButton(
                                        action: () {
                                          // Custom button action
                                          // Add your custom logic here
                                          Get.find<HomeController>()
                                              .callPresensiOut(
                                                  karyawan?.nik ?? '');
                                          Get.offAllNamed(Routes.HOME,
                                              arguments: karyawan);
                                        },
                                        label: Text(
                                          'Absen Keluar',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 47, 1, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.arrow_right_alt,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: const Color.fromARGB(
                                            255, 192, 217, 238),
                                        buttonSize: 48.0,
                                        baseColor:
                                            Color.fromARGB(255, 241, 77, 41),
                                        highlightedColor: Colors.blue.shade800,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 153, 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Absen',
                            style: GoogleFonts.montserrat(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 370),
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
                  height: 75,
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: Center(
                    child: Text(
                      "Riwayat Presensi",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  //yang bisa di scroll
                  child: Container(
                    color: Color.fromARGB(0, 230, 131, 131),
                    child: Column(
                      children: [
                        Expanded(
                          child: FutureBuilder<List<dynamic>>(
                            future:
                                controller.listPresensi(karyawan?.nik ?? ''),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Show a loading indicator while waiting for the future to complete
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                // Handle the error case
                                print('Error calling API: ${snapshot.error}');
                                return Text('Error occurred');
                              } else if (snapshot.hasData) {
                                final listPresensi = snapshot.data!;

                                if (listPresensi.isEmpty) {
                                  // Show a placeholder if the list is empty
                                  return Text('No data available');
                                }

                                return ListView.builder(
                                  padding: EdgeInsets.only(top: 0),
                                  itemCount: listPresensi.length,
                                  itemBuilder: (context, index) {
                                    final presensi = listPresensi[index];

                                    // Use the presensi data to build your UI elements
                                    return FractionallySizedBox(
                                      widthFactor: 0.85,
                                      child: Container(
                                        height: 80,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Absen Masuk",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromARGB(
                                                            255, 0, 152, 237),
                                                      ),
                                                    ),
                                                    Text(
                                                      presensi['jam_in'],
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 255, 153, 12),
                                                      ),
                                                    ),
                                                    Text(
                                                      presensi['tgl_presensi'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.black,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Absen Keluar",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Color.fromRGBO(
                                                            255, 73, 12, 1),
                                                      ),
                                                    ),
                                                    Text(
                                                      presensi['jam_out'] ?? '',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromARGB(
                                                            255, 255, 153, 12),
                                                      ),
                                                    ),
                                                    Text(
                                                      presensi['tgl_presensi'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                // Handle other cases
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                        Container(
                          // navbar
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 50,
                                blurRadius: 30,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Fungsi Beranda
                                  Get.offAllNamed(Routes.HOME,
                                      arguments: karyawan);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/logo/Home-On.png',
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
                                  Get.toNamed(Routes.IZIN, arguments: karyawan);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  if (karyawan != null) {
                                    Get.to(
                                        () => ProfilView(karyawan: karyawan!));
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/logo/Profile-Off.png',
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
    );
  }
}
