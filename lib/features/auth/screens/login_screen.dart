import 'package:celoe/core/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (Building) - using a placeholder color/container for now
          // In a real app, use Image.asset or NetworkImage
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              color: Colors.grey, // Placeholder for building image
              // image: DecorationImage(
              //   image: AssetImage('assets/images/building.jpg'),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: const Center(child: Text("Building Image Placeholder", style: TextStyle(color: Colors.white))),
          ),
          
          // White Curved Background
          ClipPath(
            clipper: LoginBackgroundClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
          ),
          
          // Floating Logo
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35 - 50, // Adjust based on curve
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25), // 0.1 opacity * 255 = 25.5
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Center(
                  // Placeholder for Telkom Logo
                  child: Icon(Icons.school, size: 50, color: AppColors.primary),
                ),
              ),
            ),
          ),
          
          // Login Form
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: MediaQuery.of(context).size.height * 0.45,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Learning Management System",
                      style: AppTextStyles.heading1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person_outline),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text("LOGIN"),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton.icon(
                      onPressed: () {
                        // SSO Integration Stub
                      },
                      icon: const Icon(Icons.email_outlined), // Replace with Microsoft icon if available
                      label: const Text("Sign in with Email 365"),
                      style: OutlinedButton.styleFrom(
                         minimumSize: const Size(double.infinity, 50),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Wave Footer (Placeholder or Custom Paint)
                  ],
                ),
              ),
            ),
          ),
          
           // Footer Wave
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: FooterWaveClipper(),
              child: Container(
                height: 80,
                color: AppColors.primary.withAlpha(25), // 0.1 * 255
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This creates the white part that covers the bottom part of the image
    Path path = Path();
    path.moveTo(0, size.height * 0.40); // Start slightly above center
    path.quadraticBezierTo(
      size.width / 2, size.height * 0.30, // Control point (curve up)
      size.width, size.height * 0.40, // End point
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 4, size.height - 60,
      size.width / 2, size.height - 30,
    );
    path.quadraticBezierTo(
      size.width * 3 / 4, size.height,
      size.width, size.height - 30,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
