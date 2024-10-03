import 'package:flutter/material.dart';
import 'package:tourpulse/favorites.dart';
import 'package:tourpulse/popular_destination.dart';
import 'package:tourpulse/explore.dart';
import 'package:tourpulse/category.dart'; // Import your Category page
import 'package:tourpulse/profile.dart'; // Import your Profile page
import 'package:tourpulse/tajmahal.dart'; // Import Taj Mahal page
import 'package:tourpulse/india.dart'; // Import India page
import 'package:tourpulse/bali.dart'; // Import Bali page
import 'package:tourpulse/usa.dart'; // Import USA page

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            fontSize: 24, // Increased font size
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding around the icon
            child: Container(
              width: 30, // Increase width
              height: 30, // Increase height
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30, // Increase icon size
                ),
                onPressed: () {
                  // Navigate to Profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()), // Replace with your Profile widget
                  );
                },
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey[100], // Match with page background color
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.lightBlueAccent[100], // Keep the same background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildPopularDestinationsRow(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: GestureDetector( // Wrap in GestureDetector
                onTap: () {
                  // Navigate to Popular Destinations page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PopularDestinations()), // Replace with your Popular Destinations widget
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Destinations',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black), // Dark arrow icon
                  ],
                ),
              ),
            ),
            _buildImageWithText('Taj Mahal', 'India', 'assets/tajmahal.jpg', height: 150, onTap: () {
              // Navigate to Taj Mahal page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TajMahal()), // Replace with your Taj Mahal widget
              );
            }), // Reduced height
            SizedBox(height: 5), // Reduced distance between Taj Mahal and India
            _buildImageWithText('Ubud', 'Bali', 'assets/ubud.jpg', height: 150, onTap: () {
              // Navigate to Bali page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bali()), // Replace with your Bali widget
              );
            }), // Reduced height
            SizedBox(height: 20), // Keep this distance for other elements
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: GestureDetector( // Wrap in GestureDetector
                onTap: () {
                  // Navigate to Explore page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Explore()), // Replace with your Explore widget
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black), // Dark arrow icon
                  ],
                ),
              ),
            ),
            _buildExploreRow(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.grey[100], // Match with page background color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30), // Increased icon size
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
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Make Home text bold and increase font size
        onTap: (index) {
          switch (index) {
            case 0:
              // Home page is already active
              break;
            case 1:
              // Navigate to Category page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Category()), // Replace with your Category widget
              );
              break;
            case 2:
              // Navigate to Favorite page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Favorites()), // Replace with your Favorite widget
              );
              break;
            case 3:
              // Navigate to Profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()), // Replace with your Profile widget
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildPopularDestinationsRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildRoundedSquareImage('assets/akshardham.jpg', 'Bharat', () {
            // Navigate to India page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => India()), // Replace with your India widget
            );
          }),
          _buildRoundedSquareImage('assets/canggu.jpg', 'Bali', () {
            // Navigate to Bali page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bali()), // Replace with your Bali widget
            );
          }),
          _buildRoundedSquareImage('assets/miami.jpg', 'USA', () {
            // Navigate to USA page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => USA()), // Replace with your USA widget
            );
          }),
          _buildRoundedSquareImage('assets/las vegas.jpg', 'Italy', () {
            // Navigate to Italy page
          }),
          _buildRoundedSquareImage('assets/munduk.jpg', 'Japan', () {
            // Navigate to Japan page
          }),
        ],
      ),
    );
  }

  Widget _buildRoundedSquareImage(String imagePath, String label, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector( // Wrap in GestureDetector
        onTap: () => onTap(),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Slightly rounded corners for a squarish shape
              child: Image.asset(
                imagePath,
                width: 90, // Increased width for a larger image
                height: 90, // Increased height for a larger image
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Bold text for labels
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText(String title, String subtitle, String imagePath, {double height = 200, Function? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4, // Shadow effect for the card
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap();
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imagePath,
                      height: height,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildExploreCard('assets/india.jpg', 'Beaches', () {
            // Navigate to Beaches page
          }),
          _buildExploreCard('assets/mountains.jpg', 'Mountains', () {
            // Navigate to Mountains page
          }),
          _buildExploreCard('assets/islands.jpg', 'Islands', () {
            // Navigate to Islands page
          }),
        ],
      ),
    );
  }

  Widget _buildExploreCard(String imagePath, String label, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector( // Wrap in GestureDetector
        onTap: () => onTap(),
        child: Container(
          height: 120, // Set the height to match the original size
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
