import 'package:flutter/material.dart';
import 'package:quizz/src/models/newsmodel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel newsItem;

  const DetailPage({super.key, required this.newsItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Berita")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ✅ Menampilkan judul berita
            Text(
              widget.newsItem.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
            const SizedBox(height: 10),
            // ✅ Menampilkan gambar berita
            Image.network(widget.newsItem.image, height: 200, width: double.infinity, fit: BoxFit.cover),
            
            const SizedBox(height: 10),
            // ✅ Menampilkan deskripsi berita
            Text(
              widget.newsItem.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            // ✅ Menampilkan jumlah likes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text("${widget.newsItem.likes} Likes", style: const TextStyle(fontSize: 16)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.newsItem.likes++;
                    });
                  },
                  child: const Text("Like"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}