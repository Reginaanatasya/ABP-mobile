import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo/loginbg-attendify.png"), //background
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo/loginlogo-attendify.png", //logo aplikasi
                    ),
                    SizedBox(height: 125), //container username password masuk
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(0, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                              ),
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 216, 216, 216),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Password',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText:
                                  true, // membuat input password menjadi titik-titik
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                              ),
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(255, 216, 216, 216),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: ElevatedButton(
                              onPressed: () {
                                // Call the login function from the LoginController
                                controller.login(
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 255, 153, 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Login',
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
                    SizedBox(height: 230), //versi apk
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(0, 255, 255, 255),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Version 1.0 Alpha',
                              style: GoogleFonts.montserrat(
                                color: Color.fromARGB(185, 255, 255, 255),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
