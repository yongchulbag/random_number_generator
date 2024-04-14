import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';
import 'package:random_number_generator/screen/setting_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [
    123,456,789,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '랜덤숫자 생성기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          final int? result = await
                          Navigator.of(context).push<int>( // int로 result 값을 지정해 줄수도 있다
                            MaterialPageRoute(
                              builder: (BuildContext context){
                                return SettingsScreen( );
                              }
                            )
                          ); // 복잡하지만 이렇게 푸시하는 방법도 알아두세요라고 함
                          print(result);

                          if(result!=null)
                            {
                              setState(() {
                                maxNumber = result;
                              });
                            }
                        },
                        icon: Icon(
                          Icons.settings,
                          color: RED_COLOR,
                        )),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: randomNumbers.asMap().entries.map((x) => Padding(
                      padding: EdgeInsets.only(bottom: x.key == 2 ? 0:16),
                      child: Row(children: x.value.toString().split('').map((y)=>Image.asset('asset/img/$y.png',height:70,width:60,)).toList(),),
                    ),).toList(),
                  ),
                ),

                /*  SizedBox(
                width: double.infinity, // 아래 ROW 대신에 이렇게 무한대값 넣어줘도 에러 안난다고 함
                child: ElevatedButton(onPressed: (){}, child: Text('생성하기'),)), */

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: RED_COLOR,
                        ),
                        onPressed: () {

                          final List<int> three_random = []; // List 대신 Set로 바꾸면 중복 숫자 제거 가능

                          for (int i=0; i<3; i++)
                            {final smallnumber = Random().nextInt(maxNumber);
                              print(smallnumber);
                            three_random.add(smallnumber);} // Set 변경시 for loop을 while loop으로 변경

                          setState(() {
                            randomNumbers = three_random; // Set로 변경시 뒤에 .toList() 추가
                          });

                          print(randomNumbers);

                        },
                        child: Text('생성하기'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
