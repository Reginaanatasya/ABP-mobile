import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> callPresensiApi(String nik) async {
    final url = 'http://10.0.2.2:8001/api/presensi';

    // Request location permission
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Location permission denied');
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permission permanently denied');
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();

    final latitude = position.latitude;
    final longitude = position.longitude;

    try {
      final response = await Dio().post(url, data: {
        "nik": "$nik",
        "lokasi_in": "$latitude,$longitude",
      });

      if (response.statusCode == 201) {
        // API call successful, handle the response here
        print(response.data);

        Get.dialog(
          AlertDialog(
            title: Text('Absen Berhasil'),
            content: Text('Terima kasih, absen Anda berhasil.'),
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
      } else {
        // API call failed, handle the error here
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while calling the API
      print('Error calling API: $e');
    }
  }

  Future<void> callPresensiOut(String nik) async {
    final url = 'http://10.0.2.2:8001/api/absen_keluar';

    // Request location permission
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Location permission denied');
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permission permanently denied');
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();

    final latitude = position.latitude;
    final longitude = position.longitude;

    try {
      final response = await Dio().post(url, data: {
        "nik": "$nik",
        "lokasi_out": "$latitude,$longitude",
      });

      if (response.statusCode == 201) {
        // API call successful, handle the response here
        print(response.data);

        Get.dialog(
          AlertDialog(
            title: Text('Absen Berhasil'),
            content: Text('Terima kasih, absen Anda berhasil.'),
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
      } else {
        // API call failed, handle the error here
        print('API call failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred while calling the API
      print('Error calling API: $e');
    }
  }

  Future<List<dynamic>> listPresensi(String nik) async {
    final url = 'http://10.0.2.2:8001/api/get_presensi/$nik';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        // API call successful, handle the response here
        final responseData = response.data['data'];
        return responseData;
      } else {
        // API call failed, handle the error here
        print('API call failed with status code: ${response.statusCode}');
        return []; // Return an empty list as a default value
      }
    } catch (e) {
      // An error occurred while calling the API
      print('Error calling API: $e');
      return []; // Return an empty list as a default value
    }
  }
}
