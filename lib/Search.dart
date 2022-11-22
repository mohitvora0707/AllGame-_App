import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Data/AllGames_Data.dart';
import 'Games.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.indigo,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? kkkk
        : kkkk
            .where((element) => [element['GameName'], element['category']]
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
    // TODO: implement buildSuggestions
    return ListView.separated(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: Lottie.asset('assets/Lottie/45082-game-controller.json',
                height: 50, width: 50),
            subtitle: Text(
              suggestionList[index]['category'].toString(),
              style: TextStyle(color: Colors.grey),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                suggestionList[index]['Logo'],
                height: 50,
                width: 50,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Games(Game: suggestionList[index]['GameURL']),
                  ));
            },
            title: Text(suggestionList[index]['GameName'].toString()));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
        );
      },
    );
  }
}
