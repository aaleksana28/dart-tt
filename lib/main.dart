// import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(const Creativiti());
}

class Creativiti extends StatelessWidget {
  const Creativiti({super.key});

  child() => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // const SizedBox(height: 30,),
                    const Text(
                      'Творчество',
                      style: TextStyle(
                        color: Color.fromRGBO(49, 64, 120, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        // fontFamily: Open Sans,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print("ЗАКРЫЛИ");
                      },
                      icon: const Icon(Icons.cancel,
                          size: 28, color: Color.fromARGB(146, 180, 180, 180)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 335,
                      height: 335,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/images.jpg'),
                              fit: BoxFit.fill),
                          border: Border.all(
                              color: Color.fromARGB(0, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Перейти на камеру");
                      },
                      child: Text("Поменять картинку"),
                      style: TextButton.styleFrom(
                          side: BorderSide(style: BorderStyle.none),
                          backgroundColor: Color.fromRGBO(243, 243, 243, 1),
                          padding: EdgeInsets.fromLTRB(20, 6, 20, 6),
                          textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(82, 87, 99, 1))),
                    )
                  ],
                )
              ],
            )),
      )),
    );
  }
}
