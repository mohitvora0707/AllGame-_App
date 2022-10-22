import 'package:animate_do/animate_do.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_view_game/Home_Screen.dart';
import 'AllGames.dart';
import 'Controller/Fevorite_Add_Remove.dart';
import 'Fev.dart';
import 'Search.dart';

class Web_Viwe_GAme extends StatelessWidget {
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
              print('cbdshfgds$demo');
            },
            currentIndex: demo,
            dotIndicatorColor: Colors.black,
            //enableFloatingNavBar: false,
            items: [
              DotNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                selectedColor: Colors.purple,
              ),

              /// Likes
              DotNavigationBarItem(
                icon: Icon(Icons.grid_view),
                selectedColor: Colors.pink,
              ),

              /// Search
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
                      Share.share("https://www.youtube.com/");
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
                    title: Text('More Apps'),
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
      body: DoubleBackToCloseApp(
        child: GetBuilder<Fevorite_Remove>(
          builder: (controller) {
            return Page[demo];
          },
        ),
        snackBar: SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            content: Text('Tap back again to leave')),
      ),
    );
  }
}
