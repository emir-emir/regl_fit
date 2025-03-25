import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ContentContainerPage extends StatefulWidget {
  const ContentContainerPage({super.key});

  @override
  State<ContentContainerPage> createState() => _ContentContainerPageState();
}

class _ContentContainerPageState extends State<ContentContainerPage> {
  // Örnek veri seti
  final List<Map<String, String>> items = [
    {
      "image": "assets/images/araba1.jpg",
      "title": "Başlık 1",
    },
    {
      "image": "assets/images/araba2.jpg",
      "title": "Başlık 1",
    },
    {
      "image": "assets/images/araba3.jpg",
      "title": "Başlık 1",
    },
    {
      "image": "assets/images/cloud.jpg",
      "title": "Başlık 2",
    },
    {
      "image": "assets/images/cloud2.png",
      "title": "Başlık 1",
    },
    {
      "image": "assets/images/pasta.jpg",
      "title": "Başlık 2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('içerik'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            child: InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Hero(
                    tag: index, // Unique tag for each item
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: AssetImage(items[index]["image"]!),
                      height: 200,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                      color: Colors.white54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]["title"]!,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
