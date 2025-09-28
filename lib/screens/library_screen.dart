import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma bibliothèque'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildGameCard(
              context,
              'Devil May Cry 5',
              'assets/devil_may_cry_5.jpg',
                  () {
                Navigator.pushNamed(context, '/purchase');
              },
            ),
            _buildGameCard(
              context,
              'Resident Evil VIII',
              'assets/resident_evil_8.jpg',
                  () {},
            ),
            _buildGameCard(
              context,
              'Need For Speed Heat',
              'assets/nfs_heat.jpg',
                  () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.grey[300],
                ),
                child: const Icon(
                  Icons.games,
                  size: 40,
                  color: Colors.grey,
                ),
                // Replace with: ClipRRect(
                //   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                //   child: Image.asset(imagePath, fit: BoxFit.cover),
                // )
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
