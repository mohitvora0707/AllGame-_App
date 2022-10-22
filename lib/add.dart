import 'package:flutter/material.dart';

import 'Fev.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<Map<String, dynamic>> add = [
    {
      'Value': '1',
      'Name': 'One',
    },
    {
      'Value': '2',
      'Name': 'Two',
    },
    {
      'Value': '3',
      'Name': 'Three',
    },
    {
      'Value': '4',
      'Name': 'Four',
    },
    {
      'Value': '5',
      'Name': 'Five',
    },
    {
      'Value': '6',
      'Name': 'Six',
    },
    {
      'Value': '7',
      'Name': 'Seven',
    },
    {
      'Value': '8',
      'Name': 'Eight',
    },
    {
      'Value': '9',
      'Name': 'Nine',
    },
    {
      'Value': '10',
      'Name': 'Ten',
    },
  ];
  List<Map<String, dynamic>> Add = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite_outlined),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fev(),
              ));
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: add.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                          trailing: IconButton(
                            icon: Add.contains(add[index])
                                ? Icon(
                                    Icons.favorite,
                                  )
                                : Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.red,
                                  ),
                            onPressed: () {
                              setState(() {
                                if (Add.contains(add[index])) {
                                  Add.remove(add[index]);
                                } else {
                                  Add.add(add[index]);
                                }
                              });
                              print('MyAdd');
                              print(Add.toString());
                            },
                          ),
                          title: Text(add[index].toString())),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
