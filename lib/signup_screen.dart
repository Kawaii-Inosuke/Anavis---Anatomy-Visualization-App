import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D1B),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_screen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 20),
                  // Logo
                  Center(
                    child: Image.asset('assets/logo.jpg', height: 80),
                  ),
                  SizedBox(height: 32),
                  // Create Account Text
                  Center(
                    child: Text(
                      'Create account',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          'Login',
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
                  // Form Container
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _buildTextField(
                          icon: Icon(Icons.person_outline, color: Color(0xFF1D61E7)),
                          hint: 'Enter your name',
                          controller: nameController,
                        ),
                        _buildDivider(),
                        _buildTextField(
                          icon: SvgPicture.asset(
                            'assets/mail.svg',
                            height: 24,
                            colorFilter: ColorFilter.mode(Color(0xFF1D61E7), BlendMode.srcIn),
                          ),
                          hint: 'Enter your email',
                          controller: emailController,
                        ),
                        _buildDivider(),
                        _buildTextField(
                          icon: Icon(Icons.calendar_today, color: Color(0xFF1D61E7)),
                          hint: 'Enter your date of birth',
                          controller: dateController,
                        ),
                        _buildDivider(),
                        _buildTextField(
                          icon: Icon(Icons.phone, color: Color(0xFF1D61E7)),
                          hint: 'Enter your phone number',
                          controller: phoneController,
                          prefix: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                            ),
                          ),
                        ),
                        _buildDivider(),
                        _buildTextField(
                          icon: SvgPicture.asset(
                            'assets/lock.svg',
                            height: 24,
                            colorFilter: ColorFilter.mode(Color(0xFF1D61E7), BlendMode.srcIn),
                          ),
                          hint: 'Enter your password',
                          controller: passwordController,
                          isPassword: true,
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/eye-off.svg',
                              height: 24,
                              colorFilter: ColorFilter.mode(Color(0xFFACB5BB), BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle registration
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1D61E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required Widget icon,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    Widget? trailing,
    Widget? prefix,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          icon,
          SizedBox(width: 12),
          if (prefix != null) prefix,
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword ? _obscureText : false,
              style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey.shade300, height: 1);
  }
}