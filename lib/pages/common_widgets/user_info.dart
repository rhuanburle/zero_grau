import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: 50,
            width: 50,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
              height: 50,
              child: Text('Bem vindo Rhuan',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    ]);
  }
}
