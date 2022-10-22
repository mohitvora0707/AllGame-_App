// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Sher extends StatefulWidget {
//   const Sher({Key? key}) : super(key: key);
//
//   @override
//   State<Sher> createState() => _SherState();
// }
//
// class _SherState extends State<Sher> {
//   bool chack = true;
//   TextEditingController Fild = TextEditingController();
//
//   void saveText(bool text) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('text', text);
//   }
//
//   void readText() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool? saveValue = prefs.getBool('text');
//     if (saveValue != null) {
//       print('$saveValue');
//       setState(() {
//         chack = saveValue;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     readText();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // TextField(
//             //   controller: Fild,
//             //   onChanged: (value) {
//             //     saveText(value);
//             //   },
//             // ),
//             Switch(
//               value: chack ?? true,
//               onChanged: (value) {
//                 setState(() {
//                   chack = !chack;
//                   saveText(chack);
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add extends StatelessWidget {
  var add = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(
            () {
              return Text('${add.value}');
            },
          )),
          ElevatedButton(
              onPressed: () {
                add++;
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
