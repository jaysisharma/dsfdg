import 'package:flutter/material.dart';
import 'package:tourpulse/home.dart'; // Import your Home page

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Destinations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()), // Navigate to Home page
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                filled: true,
                fillColor: Colors.lightBlueAccent[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildPlaceItem('assets/manali.jpg', 'Manali', 'India', screenWidth),
                _buildPlaceItem('assets/las vegas.jpg', 'Las Vegas', 'USA', screenWidth),
                _buildPlaceItem('assets/munduk.jpg', 'Bali', '', screenWidth), // Bali without country
                _buildPlaceItem('assets/varanasi.jpg', 'Varanasi', 'India', screenWidth),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceItem(String imagePath, String cityName, String countryName, double screenWidth) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(imagePath, fit: BoxFit.cover, height: screenWidth * 0.30, width: double.infinity),
              const Positioned(
                right: 8,
                top: 8,
                child: Icon(Icons.bookmark, color: Colors.blue),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Dark city name
                ),
                Opacity(
                  opacity: 0.6, // Make the country name slightly transparent
                  child: Text(
                    countryName,
                    style: const TextStyle(fontSize: 16, color: Colors.black), // Dark color for the country name
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
