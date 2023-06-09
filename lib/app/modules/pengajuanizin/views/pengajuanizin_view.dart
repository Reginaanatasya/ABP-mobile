import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';

import '../controllers/pengajuanizin_controller.dart';

class PengajuanizinView extends StatefulWidget {
  const PengajuanizinView({Key? key}) : super(key: key);

  @override
  _PengajuanizinViewState createState() => _PengajuanizinViewState();
}

class _PengajuanizinViewState extends State<PengajuanizinView> {
  late DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;
  String selectedReason = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 84,
        backgroundColor: Color.fromARGB(0, 121, 135, 123),
        elevation: 0,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: IconButton(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                child: ImageIcon(
                  AssetImage('assets/logo/back-appbar.png'),
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: Text(
          "Form Pengajuan Izin",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Wrap the body with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Center(
                child: Container(
                  width: Get.width * 0.85,
                  height: 100,
                  color: Color.fromARGB(0, 244, 67, 54),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tanggal Izin',
                                    style: GoogleFonts.montserrat(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 242, 242, 242),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                minTime: DateTime(2000, 1, 1),
                                                maxTime: DateTime(2030, 12, 31),
                                                onConfirm: (date) {
                                                  setState(() {
                                                    selectedDate = date;
                                                    isDateSelected = true;
                                                  });
                                                  print('confirm $date');
                                                },
                                                currentTime: DateTime.now(),
                                                locale: LocaleType.id,
                                              );
                                            },
                                            child: isDateSelected
                                                ? Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 50.0),
                                                      child: Text(
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(
                                                                selectedDate),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
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
                      Positioned(
                        left: 15,
                        top: 42,
                        child: Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 130, 130, 130),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Container(
                  width: Get.width * 0.85,
                  height: 70,
                  color: Color.fromARGB(0, 43, 173, 47),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 0.0, top: 0.0),
                          child: Text(
                            'Jenis',
                            style: GoogleFonts.montserrat(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        left: Get.width * 0.10,
                        right: Get.width * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: 'Izin',
                                  groupValue: selectedReason,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedReason = value.toString();
                                    });
                                  },
                                  activeColor:
                                      Color.fromARGB(255, 255, 153, 12),
                                ),
                                Text(
                                  'Izin',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 'Sakit',
                                  groupValue: selectedReason,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedReason = value.toString();
                                    });
                                  },
                                  activeColor:
                                      Color.fromARGB(255, 255, 153, 12),
                                ),
                                Text(
                                  'Sakit',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Center(
                child: Container(
                  width: Get.width * 0.85,
                  height: 150,
                  color: Color.fromARGB(0, 244, 67, 54),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Keterangan',
                                    style: GoogleFonts.montserrat(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 242, 242, 242),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 8, // Menambahkan padding atas
                                        ),
                                        border: InputBorder
                                            .none, // Menghilangkan garis bawah
                                      ),
                                      style: GoogleFonts.montserrat(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      maxLines:
                                          6, // Mengatur jumlah baris maksimum menjadi tidak terbatas (wrap text)
                                      textInputAction: TextInputAction
                                          .done, // Mengatur tindakan keyboard saat tombol "Enter" ditekan
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
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(height: 195),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Aplikasi belum jadi!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
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
                    'Kirim',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
