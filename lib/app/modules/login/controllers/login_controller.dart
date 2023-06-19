import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../routes/app_pages.dart';
import '../../karyawan/models/karyawan.dart';

class LoginController extends GetxController {
  Future<void> login(String username, String password) async {
    final url = 'http://10.0.2.2:8001/api/login';

    try {
      final response = await Dio().post(url, data: {
        'nik': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Successful login, handle the response data
        final token = response.data['token'];
        final nik = response.data['nik'];
        final karyawan = await fetchKaryawanData(token, nik);

        // Redirect to the HOME route or perform other actions
        Get.offAllNamed(Routes.HOME, arguments: karyawan);
      } else {
        // Failed login, handle the error
        // Show an error message or perform other actions
        Get.dialog(
          AlertDialog(
            title: Text('Login gagal'),
            content: Text('Check kembali username dan password Anda'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle Dio request error
      print('Error: $error');
    }
  }

  Future<Karyawan> fetchKaryawanData(String token, String nik) async {
    final karyawanUrl = 'http://10.0.2.2:8001/api/karyawan/$nik';

    try {
      final response = await Dio().get(
        karyawanUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        // Successful response, extract and return the Karyawan data
        final data = response.data['data'];
        final nama = data['nama_lengkap'];
        final nik = data['nik'] ?? '';
        final jabatan = data['jabatan'] ?? '';
        final cabang = data['kode_cabang'] ?? '';

        return Karyawan(nama: nama, nik: nik, jabatan: jabatan, cabang: cabang);
      } else {
        // Failed to fetch Karyawan data, handle the error
        print('Failed to fetch Karyawan data: ${response.statusCode}');
        throw Exception('Failed to fetch Karyawan data');
      }
    } catch (error) {
      // Handle Dio request error
      print('Error: $error');
      throw Exception('Failed to fetch Karyawan data');
    }
  }
}
