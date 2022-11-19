import 'package:flutter/material.dart';
import 'package:web_view_game/AllGames.dart';

import 'Data/AllGames_Data.dart';

class MMM extends StatelessWidget {
  const MMM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${AllGame}'),
          );
        },
      ),
    );
  }
}
