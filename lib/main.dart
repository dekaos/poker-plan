import 'package:flutter/material.dart';
import 'package:poker_plan/utils/nav.dart';
import 'package:poker_plan/widgets/button.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(PokerPlan());
  });
}

class PokerPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker plan',
      theme: ThemeData(primaryColor: Colors.black),
      home: PokerPlanList(),
    );
  }
}

class PokerPlanList extends StatelessWidget {
  void _goToDetail(BuildContext context, Widget page) async {
    await push(context, page);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                    text: '1',
                    onPressed: () => _goToDetail(context, Detail(text: '1'))),
                Button(
                    text: '2',
                    onPressed: () => _goToDetail(context, Detail(text: '2'))),
                Button(
                    text: '3',
                    onPressed: () => _goToDetail(context, Detail(text: '3'))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                    text: '5',
                    onPressed: () => _goToDetail(context, Detail(text: '5'))),
                Button(
                    text: '8',
                    onPressed: () => _goToDetail(context, Detail(text: '8'))),
                Button(
                    text: '13',
                    onPressed: () => _goToDetail(context, Detail(text: '13'))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                    text: '20',
                    onPressed: () => _goToDetail(context, Detail(text: '20'))),
                Button(
                    text: '40',
                    onPressed: () => _goToDetail(context, Detail(text: '40'))),
                Button(
                    text: '100',
                    onPressed: () => _goToDetail(context, Detail(text: '100'))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Button(
                    text: '?',
                    onPressed: () => _goToDetail(context, Detail(text: '?'))),
                Button(
                    text: '∞',
                    onPressed: () => _goToDetail(context, Detail(text: '∞'))),
                Button(
                  text: '☕',
                  onPressed: () => _goToDetail(context, Detail(text: '☕')),
                )
              ],
            ),
          ],
        ));
  }
}

class Detail extends StatelessWidget {
  final String text;

  Detail({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -10) {
          Navigator.pop(context);
        }
      },
      child: Container(
        color: Colors.black,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Colors.blue,
                ),
                width: screenWidth / 1.5,
                height: screenWidth / 1.5,
                child: Center(
                  child: Text(
                    this.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth / 4,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              )
            ]
        )
      )
    );
  }
}
