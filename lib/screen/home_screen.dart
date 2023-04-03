import 'package:flutter/material.dart';
import 'package:toontoonflix/services/api_service.dart';

import '../model/webtoon_model.dart';
import '../widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<WebtoonModel>> webtoon = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: webtoon,
        builder:
            (BuildContext context, AsyncSnapshot<List<WebtoonModel>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.requireData.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (BuildContext context, int index) {
        var webtoon = snapshot.requireData[index];
        print('[${webtoon.id}] ${webtoon.title}');
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
