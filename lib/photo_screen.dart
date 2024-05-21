import 'package:flutter/material.dart';
import 'package:ostad_project/photo_data.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key, required this.photoData});

  final PhotoData photoData;

  @override
  State<PhotoScreen> createState() => _PhotoScreenState(photoData: photoData);
}

class _PhotoScreenState extends State<PhotoScreen> {
  final PhotoData photoData;

  _PhotoScreenState({required this.photoData});
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Image.network(photoData.url),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              children: [
                Text(
                  'Title: ${photoData.title}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'ID:${photoData.id.toString()}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}
