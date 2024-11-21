import 'package:flutter/material.dart';
import 'package:tourpulse/home.dart'; // Import your Home page

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()), // Navigate to Home page
            );
          },
        ),
        title: const Text(
          'Explore',
          style: TextStyle(
            fontSize: 24, // Increased font size
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
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
                      offset: const Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
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
            const SizedBox(height: 10),
            _buildPopularDestinationsRow(),
            const SizedBox(height: 20), // Spacing before Explore section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Places',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black), // Dark arrow icon
                ],
              ),
            ),
            _buildExploreRow(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.grey[100], // Match with page background color
        items: const [
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
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), // Make Home text bold and increase font size
      ),
    );
  }

  Widget _buildPopularDestinationsRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildRoundedSquareImage('assets/akshardham.jpg', 'Bharat'),
          _buildRoundedSquareImage('assets/canggu.jpg', 'Bali'),
          _buildRoundedSquareImage('assets/miami.jpg', 'USA'),
          _buildRoundedSquareImage('assets/las vegas.jpg', 'Italy'),
          _buildRoundedSquareImage('assets/munduk.jpg', 'Japan'),
        ],
      ),
    );
  }

  Widget _buildRoundedSquareImage(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Bold text for labels
        ],
      ),
    );
  }

  Widget _buildExploreRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildExploreItem('assets/canggu.jpg', 'Beaches'),
          _buildExploreItem('assets/darjeeling.jpg', 'Mountains'),
          _buildExploreItem('assets/nusa.jpg', 'Islands'),
        ],
      ),
    );
  }

  Widget _buildExploreItem(String imagePath, String label) {
    return SizedBox(
      width: 120, // Increased size for Explore items
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 120, // Increased width
              height: 120, // Increased height
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Bold text for Explore labels
        ],
      ),
    );
  }
}
