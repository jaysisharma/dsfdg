import 'package:flutter/material.dart';
import 'package:tourpulse/Verification.dart'; // Import your Verification page
import 'package:tourpulse/Login.dart'; // Import your Login page

class ForgotPassword extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

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
                    // Navigate to the Login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()), // Navigate to Login page
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
                  // Forgot Password Text
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Email Input Box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                  // Send Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                      width: 150, // Set the desired width for the button
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle send action and navigate to Verification page
                          String email = _emailController.text;
                          // Implement your send password logic here

                          // Navigate to Verification page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Verification()), // Ensure this matches your actual Verification class
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
                            'Send',
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
    home: ForgotPassword(), // Updated to use ForgotPassword class
  ));
}
