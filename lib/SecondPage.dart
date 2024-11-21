import 'package:flutter/material.dart';
import 'package:tourpulse/ThirdPage.dart'; // Import ThirdPage

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/abc.jpg'), // Your background image path
                fit: BoxFit.cover, // Ensures the image covers the entire background
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft, 
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 40.0), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Your Journey with TourPulse',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87, 
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
                            color: Colors.black87, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 3), 

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ThirdPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.grey[800],
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space between the button and the circles

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 1), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SecondPage(),
  ));
}
