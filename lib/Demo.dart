import 'package:flutter/material.dart';

import 'Data/AllGames_Data.dart';
import 'Demo2.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

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
                  trailing: Image.network(kkkk[index]['Logo'].toString()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Demo2(),
                        ));
                  },
                  title: Text(kkkk[index]['GameName'].toString()),
                );
              },
              itemCount: kkkk.length,
            ),
          )
        ],
      ),
    );
  }
}
