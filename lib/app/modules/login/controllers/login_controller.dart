import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../routes/app_pages.dart';

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
        // Redirect to the HOME route or perform other actions
        Get.offAllNamed(Routes.HOME);
      } else {
        // Failed login, handle the error
        // Show an error message or perform other actions
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Failed to log in.',
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        );
      }
    } catch (error) {
      // Handle Dio request error
      print('Error: $error');
    }
  }
}
