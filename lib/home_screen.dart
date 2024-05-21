import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ostad_project/photo_data.dart';
import 'package:ostad_project/photo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoData> photoList = [];

  @override
  void initState() {
    super.initState();
    _getPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: photoList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: _buildPhotoGallery(photoList[index]),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 10,
          ),
        ),
      ),
    );
  }


  Future<void> _getPhoto() async {
    setState(() {});
    photoList.clear();
    const String getPhotoUrl = 'https://jsonplaceholder.typicode.com/photos';
    Uri uri = Uri.parse(getPhotoUrl);
    Response response = await get(uri);

    print(response.statusCode);

    if (response.statusCode == 200) {
      //step no.1 decode the data
      final decodeData = jsonDecode(response.body);
      //step no.2 define the array key/id

      //step no.3 loop between body decoded data
      for (var p in decodeData) {
        PhotoData photoData = PhotoData(
            albumId: p['albumId'] ?? 0,
            id: p['id'] ?? 0,
            title: p['title'] ?? '',
            url: p['url'] ?? '',
            thumbnailUrl: p['thumbnailUrl'] ?? '');
        photoList.add(photoData);
        setState(() {});
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed')));
    }
  }

  Widget _buildPhotoGallery(PhotoData photoData) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PhotoScreen(
                photoData: photoData,
              ),
            ));
      },
      child: ListTile(
        leading: SizedBox(
            child: Image.network(
              photoData.thumbnailUrl,
              fit: BoxFit.cover,
              height: 70,
              width: 70,
            )),
        title: Wrap(
          spacing: 10,
          children: [
            Text(
              photoData.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
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
