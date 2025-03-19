import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  // Update these with your own links!
  final String linkedInUrl = 'https://www.linkedin.com/in/yourname';
  final String emailUrl = 'mailto:your@email.com';

  void _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/pf.jpg'), // Put your image in assets folder
              ),
              const SizedBox(height: 16),
              const Text(
                'Your Name',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Mobile Developer / UI Designer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const Text(
                'Hi! I’m a passionate Flutter developer with skills in mobile UI/UX design. I love creating clean and responsive interfaces.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () => _launchUrl(emailUrl),
                icon: const Icon(Icons.email),
                label: const Text('Hire Me'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.indigo,
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton.icon(
                onPressed: () => _launchUrl(linkedInUrl),
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  side: const BorderSide(color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
