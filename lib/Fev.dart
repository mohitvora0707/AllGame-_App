import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Games.dart';
import 'favorite.dart';

class Fev extends StatefulWidget {
  @override
  State<Fev> createState() => _FevState();
}

class _FevState extends State<Fev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AddGems().addGems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets8.lottiefiles.com/packages/lf20_xvf1dl3s.json',
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      'Not Liked Game',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Recoleta',
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        physics: BouncingScrollPhysics(),
                        itemCount: AddGems().addGems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          int colorindex = index ~/ 3;
                          while (colorindex > 1) {
                            colorindex -= 2;
                          }
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Games(
                                      Game: AddGems()
                                          .addGems[index]['GameURL']
                                          .toString()),
                                )),
                            child: colorindex % 2 == 0
                                ? FadeInLeft(
                                    duration: Duration(seconds: 2),
                                    child: Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              AddGems()
                                                  .addGems[index]['Logo']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  )
                                : FadeInRight(
                                    duration: Duration(seconds: 2),
                                    child: Container(
                                      height: 95,
                                      width: 95,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              AddGems()
                                                  .addGems[index]['Logo']
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ));
  }
}
