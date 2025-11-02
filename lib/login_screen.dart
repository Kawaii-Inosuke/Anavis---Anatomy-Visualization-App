import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D1B),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg_screen.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Color(0xFF0D0D1B),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/logo.jpg',
                      height: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 80,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    'Sign in to your\nAccount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupScreen()),
                            );
                          },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF1D61E7),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/mail.svg', height: 24, colorFilter: ColorFilter.mode(Color(0xFF1D61E7), BlendMode.srcIn)),
                              SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey.shade300, height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/lock.svg', height: 24, colorFilter: ColorFilter.mode(Color(0xFF1D61E7), BlendMode.srcIn)),
                              SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  obscureText: _obscureText,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter your password',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: SvgPicture.asset('assets/eye-off.svg', height: 24, colorFilter: ColorFilter.mode(Color(0xFFACB5BB), BlendMode.srcIn)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Your Password?',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xffffffff),
                          decorationThickness: 0.8,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1D61E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
