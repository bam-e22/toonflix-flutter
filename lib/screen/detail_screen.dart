import 'package:flutter/material.dart';

import '../services/api_service.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  void printFuture() async {
    var toonDetail = await ApiService.getToonById(id);
    var episodes = await ApiService.getLatestEpisodeById(id);

    print('detail= ${toonDetail.genre}');
    print(
        'episodes= ${episodes[0].title} ${episodes[0].date} ${episodes[0].rating}');
  }

  @override
  Widget build(BuildContext context) {
    printFuture();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(10, 10),
                          color: Colors.black.withOpacity(0.5),
                        )
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(thumb, headers: const {
                    "User-Agent":
                        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
