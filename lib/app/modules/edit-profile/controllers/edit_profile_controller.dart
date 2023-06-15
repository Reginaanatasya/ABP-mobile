import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilController extends GetxController {
  Future<void> updateProfile({
    required String token,
    required String nik,
    required String username,
    required String noHp,
    required String password,
  }) async {
    // URL nya nanti bisa di ganti ke ip local server kamu
    final String url = "http://10.0.2.2:8001/api/karyawan/$nik";
    try {
      final response = await Dio().put(
        url,
        // ini data baru yang menggantikan data lama
        data: {"username": username, "no_hp": noHp, "password": password},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        Get.dialog(
          AlertDialog(
            title: Text('Update profil berhasil'),
            actions: [
              ElevatedButton(
                child: Text('Tutup'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 153, 12)),
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: Text('Gagal update profil'),
            content: Text('Terjadi kesalahan saat memperbarui profile'),
            actions: [
              ElevatedButton(
                child: Text('Tutup'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 153, 12)),
                onPressed: () {
                  // Close the dialog
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print("Exception: $e");
      Get.dialog(
        AlertDialog(
          title: Text('Gagal update profil'),
          content: Text('Terjadi kesalahan saat memperbarui profile'),
          actions: [
            ElevatedButton(
              child: Text('Tutup'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 153, 12)),
              onPressed: () {
                // Close the dialog
                Get.back();
              },
            ),
          ],
        ),
      );
    }
  }
}
