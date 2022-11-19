import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'Games.dart';
import 'View/Navigation .dart';

class Allgame extends StatefulWidget {
  final Category;
  final CategoryName;
  const Allgame({
    super.key,
    required this.Category,
    required this.CategoryName,
  });
  @override
  State<Allgame> createState() => _AllgameState();
}

class _AllgameState extends State<Allgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6200ee),
        centerTitle: true,
        title: FadeInDown(
          child: Text(
            widget.CategoryName.toString(),
            style:
                TextStyle(fontFamily: 'Recoleta', fontWeight: FontWeight.w600),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Navigation_Screen(),
                ));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: widget.Category.length,
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
                                Game: widget.Category[index]['GameURL']
                                    .toString()),
                          )),
                      child: colorindex % 2 == 0
                          ? FadeInLeft(
                              duration: Duration(seconds: 2),
                              child: Container(
                                height: 95,
                                width: 95,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.Category[index]['Logo']
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
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        widget.Category[index]['Logo']
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
        ),
      ),
    );
  }
}
