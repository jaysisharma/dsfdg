import 'package:flutter/material.dart';
import 'package:tourpulse/Home.dart'; // Import your Home page
import 'package:tourpulse/forgot_password.dart'; // Import your Forgot Password page

class Verification extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image container filling 60% of the screen
          Container(
            height: MediaQuery.of(context).size.height * 0.6, // Set to 60% height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/abc.jpg'), // Your image asset
                fit: BoxFit.cover, // Ensure image covers the area
              ),
            ),
          ),
          // Positioned Back Button and Title on the top left corner
          Positioned(
            top: 40,
            left: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    // Navigate back to Forgot Password page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                ),
                SizedBox(width: 5),
                Text(
                  'TourPulse',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Bottom section with email input and buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45, // Bottom part
              width: MediaQuery.of(context).size.width, // Full width
              decoration: BoxDecoration(
                color: Colors.blueGrey[400], // Background color for the bottom part
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Verification Code Text
                  Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Code Input Box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: _codeController,
                      decoration: InputDecoration(
                        labelText: 'Enter the verification code',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color.fromARGB(141, 211, 205, 205),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Verify Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      width: 150, // Set the desired width for the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle verify action and navigate to Home page
                          String code = _codeController.text;
                          // Implement your verification logic here

                          // Navigate to Home page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15), // Maintain height
                          backgroundColor: Colors.teal, // Change background color of the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Resend Code Text
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8), // 80% transparency
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Verification(), // Updated to use Verification class
  ));
}
