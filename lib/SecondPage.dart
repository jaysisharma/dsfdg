import 'package:flutter/material.dart';
import 'package:tourpulse/ThirdPage.dart'; // Import ThirdPage

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/abc.jpg'), // Your background image path
                fit: BoxFit.cover, // Ensures the image covers the entire background
              ),
            ),
          ),
          // Main content (Text and Buttons)
          Positioned.fill(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft, // Aligning to the top left corner
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 40.0), // Adding left and top padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Your Journey with TourPulse',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, // Darker text color for better visibility
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'At TourPulse, we believe that travel should be seamless, '
                          'stress-free, and full of joy. Whether you\'re planning a '
                          'weekend getaway or a month-long adventure, our app is '
                          'designed to be your trusted guide, helping you manage '
                          'every aspect of your journey with ease.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87, // Darker description text color for better readability
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 3), // Space below the text to push buttons down

                // Get Started Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to ThirdPage on button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.grey[800],
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between the button and the circles

                // Indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1), // Extra space at the bottom
              ],
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
    home: SecondPage(),
  ));
}
