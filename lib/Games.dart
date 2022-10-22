import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Games extends StatefulWidget {
  final Game;

  const Games({super.key, required this.Game});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  bool lording = true;
  @override
  void initState() {
    super.initState();
    lording = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.Game,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  lording = false;
                });
              },
            ),
            lording == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
