import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;

  const SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber=1000; //초기값 지정안해주면 오류 작살남 왜인지는 모르겠음

  @override
  void initState() {
    maxNumber=widget.maxNumber.toDouble(); // stateful 의 경우 initstate에서만 widget 불러오기 가능
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(maxNumber: maxNumber, onSliderChanged: (double val){
                print(val);
                setState(() {
                  maxNumber=val;
                });
              },onButtonPressed: () {
                Navigator.of(context).pop(maxNumber.toInt());
              },)
              
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;

  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Row(
        children: maxNumber.toInt()
            .toString()
            .split('')
            .map((e) =>
            Image.asset('asset/img/$e.png', width: 30, height: 30))
            .toList(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const _Footer({required this.maxNumber, required this.onSliderChanged, required this.onButtonPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 100000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            primary: RED_COLOR,
          ),
          child: Text('저장'),
        )
      ],
    );
  }
}
