import 'package:flutter/material.dart';

class PsyduckErrorWidget extends StatelessWidget {
  const PsyduckErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300, //MediaQuery.of(context).size.height * 0.5,
        width: 300, //MediaQuery.of(context).size.width * 0.5,
        child: Column(children: [
          Stack(children: [
            SizedBox(
              width: 500,
              height: 70,
              child: Image.asset(
                'assets/chat_image.png',
                fit: BoxFit.fill,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, right: 5, left: 5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Ops, ocorreu um erro!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
          Flexible(flex: 2, child: Image.asset('assets/psyduck.png')),
        ]));
  }
}
