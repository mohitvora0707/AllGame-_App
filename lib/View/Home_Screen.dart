import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../AllGame.dart';
import '../Data/Categories_Data.dart';
import '../Data/Slider_Data.dart';
import '../Games.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var page = 0.obs;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 85),
              physics: BouncingScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          CarouselSlider(
                              items: List.generate(
                                PageSlider.length,
                                (index) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Games(
                                              Game: PageSlider[index]
                                                  ['GamesPage']),
                                        )),
                                    child: Image.network(
                                      PageSlider[index]['Image'].toString(),
                                      height: 160,
                                      width: width * 0.8,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  page.value = index;
                                },
                                height: 160,
                                aspectRatio: 16 / 5,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 2),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Obx(() {
                              return AnimatedSmoothIndicator(
                                activeIndex: page.value,
                                count: 4,
                                effect: SlideEffect(
                                  dotWidth: 7,
                                  dotHeight: 7,
                                  activeDotColor: Color(0xff6200ee),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                            top: index == 1 ? 0 : 20,
                            right: width * 0.03,
                            left: width * 0.03),
                        child: index % 2 == 0
                            ? FadeInLeft(
                                duration: Duration(seconds: 1),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: category[index]['Colors'],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      )),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              category[index]['Category'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  fontFamily: 'Recoleta'),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Allgame(
                                                            CategoryName:
                                                                category[index][
                                                                    'Category'],
                                                            Category: category[
                                                                    index]
                                                                ['Gameitem']),
                                                  )),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: category[index]
                                              ['GameCount'],
                                          padding: EdgeInsets.only(left: 15),
                                          itemBuilder: (context, Gameindex) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(
                                                    Games(
                                                      Game: category[index]
                                                                  ['Gameitem']
                                                              [Gameindex]
                                                          ['GameURL'],
                                                    ),
                                                  );
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        category[index]
                                                                ['Gameitem']
                                                            [Gameindex]['Logo'],
                                                        height: 95,
                                                        width: 95,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      category[index]
                                                                  ['Gameitem']
                                                              [Gameindex]
                                                          ['GameName'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily: 'Recoleta',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : FadeInRight(
                                duration: Duration(seconds: 1),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: category[index]['Colors'],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      )),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        child: Row(
                                          children: [
                                            Text(
                                              category[index]['Category'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18,
                                                  fontFamily: 'Recoleta'),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Allgame(
                                                            CategoryName:
                                                                category[index][
                                                                    'Category'],
                                                            Category: category[
                                                                    index]
                                                                ['Gameitem']),
                                                  )),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: category[index]
                                              ['GameCount'],
                                          padding: EdgeInsets.only(left: 15),
                                          itemBuilder: (context, Gameindex) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Games(
                                                          Game: category[index][
                                                                      'Gameitem']
                                                                  [Gameindex]
                                                              ['GameURL'],
                                                        ),
                                                      ));
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        category[index]
                                                                ['Gameitem']
                                                            [Gameindex]['Logo'],
                                                        height: 95,
                                                        width: 95,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      category[index]
                                                                  ['Gameitem']
                                                              [Gameindex]
                                                          ['GameName'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily: 'Recoleta',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
