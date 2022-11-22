import 'package:flutter/material.dart';

import 'Data/AllGames_Data.dart';

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sss = [
      {
        'Count': ttttt.length,
      },
      {
        'Count': ttt2.length,
      },
      {
        'Count': ttt3.length,
      },
      {
        'Count': ttt4.length,
      },
      {
        'Count': ttt5.length,
      }
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(ttttt[index]['GameName']),
                );
              },
              itemCount: ttttt.length,
            ),
          )
        ],
      ),
    );
  }
}
