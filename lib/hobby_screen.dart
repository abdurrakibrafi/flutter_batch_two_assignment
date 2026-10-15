import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HobbyScreen extends StatelessWidget {
  const HobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Background Color
      backgroundColor: Colors.green,
      // 2. App Bar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          'My Favorite Hobby',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      // 3. Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              // Hobby Title
              Text(
                'Reading Books',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 16),

              // Hobby Description
              Text(
                'My favorite hobby is reading books. '
                'I love reading books in my free time. '
                'Reading helps me learn new things and '
                'improve my knowledge. It also makes me '
                'feel relaxed and happy. I enjoy reading '
                'storybooks, science books, and technology '
                'articles. Reading is an important part '
                'of my daily life.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),

              const SizedBox(height: 20),

              // Hobby Image
              // you can add image from asset or network using image.asset or image.network
              Image.network(
                'https://images.unsplash.com/photo-1507842217343-583bb7270b66',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,

                /// if some how the image doesn't come up
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.broken_image,
                    size: 80,
                    color: Colors.white,
                  );
                },
              ),

              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),

                child: Text(
                  'Submit My Hobby',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // 4. Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,

        onPressed: () {
          /// fire something
        },

        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
