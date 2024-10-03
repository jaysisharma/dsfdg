import 'package:flutter/material.dart';
import 'package:tourpulse/home.dart'; // Import your Home page

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Colors.white; // Define the background color for the entire page

    return Scaffold(
      backgroundColor: backgroundColor, // Set the background color of the page
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()), // Navigate to Home page
            );
          },
        ),
        title: Text(
          'Favorites',
          style: TextStyle(
            fontSize: 24, // Set a large font size for the title
            fontWeight: FontWeight.bold, // Make title bold
          ),
        ),
        backgroundColor: backgroundColor, // Set AppBar color to white
        elevation: 0, // Optional: remove shadow
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFavoriteItem('assets/akshardham.jpg', 'Akshardham', 'Delhi'),
            _buildFavoriteItem('assets/tajmahal.jpg', 'Taj Mahal', 'India'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400], // Make unselected items more subtle
        backgroundColor: backgroundColor, // Set BottomNavigationBar color to white
        items: [
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
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildFavoriteItem(String imagePath, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                width: 150, // Adjust the size of the image
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.bookmark, color: Colors.red),
              onPressed: () {
                // Handle bookmark action
              },
            ),
          ],
        ),
      ),
    );
  }
}
