import 'package:animate_do/animate_do.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_view_game/View/Home_Screen.dart';
import '../Controller/InternetChakeController.dart';
import '../Data/AllGames_Data.dart';
import 'Add_Fev_Games_Screen.dart';
import '../Controller/Fevorite_Add_Remove.dart';
import '../Fev.dart';
import '../Search.dart';

class Navigation_Screen extends StatelessWidget {
  final Uri _url =
      Uri.parse('https://sites.google.com/view/all-game-apps-privacy-policy');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  List Page = [
    Home_Screen(),
    AllGames(),
    Fev(),
  ];

  int demo = 0;

  @override
  Widget build(BuildContext context) {
    final Fevorite_Remove _fevorite_remove = Get.put(Fevorite_Remove());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: GetBuilder<Fevorite_Remove>(
        builder: (controller) {
          return DotNavigationBar(
            onTap: (p0) {
              demo = controller.Navigation(p0);
            },
            currentIndex: demo,
            dotIndicatorColor: Colors.black,
            //enableFloatingNavBar: false,
            items: [
              /// Home Screen
              DotNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                selectedColor: Colors.purple,
              ),

              /// All Game Screen
              DotNavigationBarItem(
                icon: Icon(Icons.grid_view),
                selectedColor: Colors.pink,
              ),

              /// Fev Screen
              DotNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                selectedColor: Colors.orange,
              ),
            ],
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff6200ee),
        title: FadeInDown(
            child: Text(
          'All Games App',
          style: TextStyle(fontFamily: 'Recoleta', fontWeight: FontWeight.w600),
        )),
        centerTitle: true,
        actions: [
          IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ))
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
            backgroundColor: Colors.deepPurple.shade100,
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/vectors/game-on-neon-game-controller-or-joystick-for-game-console-on-blue-vector-id1320799591?k=20&m=1320799591&s=612x612&w=0&h=-gtEK00fsfMUTbClNm1UeirSfeEN1EtsvYr_xpKUse0='),
                          fit: BoxFit.cover)),
                  child: null,
                ),
                FadeInLeft(
                  child: ListTile(
                    onTap: () {},
                    enabled: true,
                    hoverColor: Color(0xff6200ee),
                    leading: Icon(
                      Icons.home,
                    ),
                    title: Text('Home'),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                FadeInRight(
                  child: ListTile(
                    onTap: () {
                      Share.share(AllGame[0]['GameName']);
                    },
                    leading: Icon(
                      Icons.share,
                    ),
                    title: Text('Share Your Friends'),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                FadeInLeft(
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.grid_view,
                    ),
                    title: Text('More Appssssssss'),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                FadeInRight(
                  child: ListTile(
                    onTap: () {
                      _launchUrl();
                    },
                    leading: Icon(
                      Icons.privacy_tip,
                    ),
                    title: Text('Privacy Policy'),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                FadeInLeft(
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: Icon(
                      Icons.login,
                    ),
                    title: Text('Back'),
                  ),
                ),
              ],
            )),
      ),
      body: GetBuilder<InternetChake>(
        builder: (InternetChake internetCheckController) {
          if (internetCheckController.internetCheckLoader) {
            return Material();
          } else {
            if (internetCheckController.internet) {
              return DoubleBackToCloseApp(
                child: GetBuilder<Fevorite_Remove>(
                  builder: (controller) {
                    return Page[demo];
                  },
                ),
                snackBar: SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 2),
                    content: Text('Tap back again to leave')),
              );
            } else {
              return Material(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/no-wifi.png',
                        height: 80,
                        width: 80,
                      ),
                      Text(
                        'Whoops!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'No Internet connection found. Chack your\nconnection or try again.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              );
            }
          }
        },
        init: InternetChake(),
      ),
    );
  }
}
