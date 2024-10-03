import 'package:flutter/material.dart';
import 'package:tourpulse/Home.dart';
import 'package:tourpulse/Signup.dart';
import 'package:tourpulse/forgot_password.dart'; // Import your Forgot Password page

class Login extends StatelessWidget {
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
                    // Navigate back to the third page
                    Navigator.pop(context);
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
          // Bottom section with email and password input fields
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
              child: SingleChildScrollView( // Wrap in SingleChildScrollView to avoid overflow
                padding: const EdgeInsets.all(20.0), // Padding for the content
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20), // Space before the "Login" text
                    // Login Text
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 28, // Increased font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Changed color to black
                      ),
                    ),
                    SizedBox(height: 20), // Space before email field
                    // Email TextField with rounded corners and shadow
                    _buildTextField(label: 'Email', icon: Icons.email),
                    SizedBox(height: 10), // Space between fields
                    // Password TextField with rounded corners and shadow
                    _buildTextField(label: 'Password', icon: Icons.lock, obscureText: true),
                    SizedBox(height: 20), // Space before the login button
                    // Login Button with shadow
                    _buildLoginButton(context),
                    SizedBox(height: 20), // Space before the signup text
                    // Signup Text on the same line
                    _buildSignupText(context),
                    SizedBox(height: 10), // Space before the forgot password text
                    // Forgot Password Text
                    GestureDetector(
                      onTap: () {
                        // Navigate to forgot password page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPassword()), // Ensure this matches your actual ForgotPassword class
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 15, 138, 239), // Color for the forgot password text
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build TextField widgets
  Widget _buildTextField({required String label, required IconData icon, bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
            borderSide: BorderSide.none, // Remove border line
          ),
          filled: true, // Fill color
          fillColor: Colors.white, // Fill color
        ),
      ),
    );
  }

  // Function to build the Login Button
  Widget _buildLoginButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10, // Adjust the blur radius for shadow effect
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5, // Decreased width of the button
        child: ElevatedButton(
          onPressed: () {
            // Navigate to home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()), // Ensure this matches your actual Home class
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12), // Height adjustment
            backgroundColor: Color.fromARGB(255, 49, 81, 107),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 25, // Maintain the original font size
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to build the Signup Text
  Widget _buildSignupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white, // Color for the "Don't have an account?" text
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigate to signup page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()), // Ensure this matches your actual Signup class
            );
          },
          child: Text(
            'Signup',
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 15, 138, 239), // Color for the signup text
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(), // Updated to use the Login class
  ));
}
