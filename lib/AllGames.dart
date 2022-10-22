import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_view_game/Controller/Fevorite_Add_Remove.dart';
import 'Games.dart';
import 'favorite.dart';

class AllGames extends StatefulWidget {
  @override
  State<AllGames> createState() => _AllGamesState();
}

class _AllGamesState extends State<AllGames> {
  Fevorite_Remove _fevorite_remove = Fevorite_Remove();
  bool Fev = false;
  bool? log;
  bool? get;
  @override
  Widget build(BuildContext context) {
    final Fevorite_Remove _fevorite_remove = Get.put(Fevorite_Remove());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _fevorite_remove.allgame.length,
              itemBuilder: (context, indexList) {
                return Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color(0xff6200ee)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_fevorite_remove.allgame[indexList]['category']} Games',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'Recoleta',
                                ),
                              ),
                              Text(
                                '${_fevorite_remove.allgame[indexList]['length'].toString()} Games',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                        children: List.generate(
                            _fevorite_remove.allgame[indexList]['length'],
                            (index) {
                      return Column(
                        children: [
                          index.isEven
                              ? FadeInRight(
                                  duration: Duration(seconds: 2),
                                  child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Games(
                                                  Game: _fevorite_remove
                                                              .allgame[
                                                          indexList]['gameURL']
                                                      [index]['GameURL']),
                                            ));
                                      },
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          _fevorite_remove.allgame[indexList]
                                              ['gameURL'][index]['Logo'],
                                          height: 80,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      title: Text(
                                        _fevorite_remove.allgame[indexList]
                                            ['gameURL'][index]['GameName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Recoleta',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            _fevorite_remove.allgame[indexList]
                                                ['gameURL'][index]['category'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/6488/6488575.png',
                                            height: 25,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                      trailing: GetBuilder<Fevorite_Remove>(
                                        builder: (controller) {
                                          print(controller.allgame.length);

                                          return IconButton(
                                            icon: AddGems().addGems.contains(
                                                    controller
                                                            .allgame![indexList]
                                                        ['gameURL'][index])
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                : Icon(Icons.favorite_outline),
                                            onPressed: () {
                                              controller.Add_Remove(
                                                  indexList, index);
                                            },
                                          );
                                        },
                                      )),
                                )
                              : FadeInLeft(
                                  duration: Duration(seconds: 2),
                                  child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Games(
                                                  Game: _fevorite_remove
                                                              .allgame[
                                                          indexList]['gameURL']
                                                      [index]['GameURL']),
                                            ));
                                      },
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          _fevorite_remove.allgame[indexList]
                                              ['gameURL'][index]['Logo'],
                                          height: 80,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      title: Text(
                                        _fevorite_remove.allgame[indexList]
                                            ['gameURL'][index]['GameName'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Recoleta',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            _fevorite_remove.allgame[indexList]
                                                ['gameURL'][index]['category'],
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/6488/6488575.png',
                                            height: 25,
                                            width: 30,
                                          )
                                        ],
                                      ),
                                      trailing: GetBuilder<Fevorite_Remove>(
                                        builder: (controller) {
                                          print(controller.allgame.length);

                                          return IconButton(
                                            icon: AddGems().addGems.contains(
                                                    controller
                                                            .allgame![indexList]
                                                        ['gameURL'][index])
                                                ? Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )
                                                : Icon(Icons.favorite_outline),
                                            onPressed: () {
                                              controller.Add_Remove(
                                                  indexList, index);
                                            },
                                          );
                                        },
                                      )),
                                ),
                        ],
                      );
                    })),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
