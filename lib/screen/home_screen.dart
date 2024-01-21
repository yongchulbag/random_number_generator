import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('랜덤숫자 생성기'),
              IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('123'),
                Text('456'),
                Text('789'),
              ],
            ),
          ),

          /*  SizedBox(
              width: double.infinity, // 아래 ROW 대신에 이렇게 무한대값 넣어줘도 에러 안난다고 함
              child: ElevatedButton(onPressed: (){}, child: Text('생성하기'),)), */

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('생성하기'),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
