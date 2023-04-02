import 'package:flutter/material.dart';
import 'package:toontoonflix/services/api_service.dart';

import '../model/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<WebtoonModel>> webtoon = ApiService.getTodaysToons();

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
        builder: (BuildContext context,
            AsyncSnapshot<List<WebtoonModel>> snapshot) {
          if (snapshot.hasData) {
            return Text("There is data!");
          }
          return Text('Loading....');
        },
      ),
    );
  }
}
