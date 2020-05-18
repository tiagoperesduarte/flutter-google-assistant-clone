import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String body;
  final String supportingText;
  final String imageUrl;

  CardWidget({this.title, this.body, this.supportingText, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
        ],
      ),
    );
  }
}
