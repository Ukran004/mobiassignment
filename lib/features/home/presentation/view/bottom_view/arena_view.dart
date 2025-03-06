import 'package:flutter/material.dart';

class ArenaView extends StatefulWidget {
  const ArenaView({super.key});

  @override
  State<ArenaView> createState() => _ArenaViewState();
}

class _ArenaViewState extends State<ArenaView> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> careerArenas = [
    {
      "name": "Manager",
      "location": "Kathmandu",
      "image": "assets/images/manager.jpg",
      "rating": 4.5,
      "price": "Rs. 90,000",
    },
    {
      "name": "Chyasal Futsal Arena",
      "location": "Lalitpur",
      "image": "assets/images/careerimage.jpg",
      "rating": 4.3,
      "price": "Rs. 1200/hr",
    },
    // {
    //   "name": "Bhaktapur Futsal Arena",
    //   "location": "Bhaktapur",
    //   "image": "assets/images/bhaktapur_arena.jpg",
    //   "rating": 4.7,
    //   "price": "Rs. 1400/hr",
    // },
    {
      "name": "Baneshwor Futsal Ground",
      "location": "Kathmandu",
      "image": "assets/images/dhukucareer.jpg",
      "rating": 4.6,
      "price": "Rs. 1300/hr",
    },
  ];
  List<Map<String, dynamic>> filteredArenas = [];

  @override
  void initState() {
    super.initState();
    filteredArenas = careerArenas;
    _searchController.addListener(_filterArenas);
  }

  void _filterArenas() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredArenas = careerArenas
          .where((arena) =>
              arena["name"].toLowerCase().contains(query) ||
              arena["location"].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Soft background color
      appBar: AppBar(
        title: const Text("Futsal Arenas",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 0, 37, 79), // Same as My Schedule
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by name or location...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 16),

            /// Futsal Arenas List
            Expanded(
              child: filteredArenas.isEmpty
                  ? const Center(
                      child: Text("No career arenas found.",
                          style: TextStyle(fontSize: 16, color: Colors.grey)))
                  : ListView.builder(
                      itemCount: filteredArenas.length,
                      itemBuilder: (context, index) {
                        final arena = filteredArenas[index];
                        return _buildArenaTile(arena);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// Arena List Tile UI
  Widget _buildArenaTile(Map<String, dynamic> arena) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(arena["image"],
              width: 70, height: 70, fit: BoxFit.cover),
        ),
        title: Text(
          arena["name"],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📍 ${arena["location"]}",
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text("💰 ${arena["price"]}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber.shade700, size: 20),
            Text(arena["rating"].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: () {
          _showArenaDetails(arena);
        },
      ),
    );
  }

  void _showArenaDetails(Map<String, dynamic> arena) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(arena["name"], textAlign: TextAlign.center),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8, // Set max width
            height: 300, // Ensure the dialog has a fixed height
            child: Column(
              mainAxisSize: MainAxisSize.min, // Important to prevent overflow
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    arena["image"],
                    width: double.infinity,
                    height: 150, // Fixed height for image
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text("📍 Location: ${arena["location"]}",
                    style: const TextStyle(fontSize: 14)),
                Text("💰 Price: ${arena["price"]}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                Text("⭐ Rating: ${arena["rating"]}",
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to application screen
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text("Apply", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
