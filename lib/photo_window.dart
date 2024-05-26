import 'package:example/creative_window.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PhotoWindow extends StatelessWidget {
  const PhotoWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: PhotoMainBlock(),
        )));
  }
}

class PhotoMainBlock extends Container {
  PhotoMainBlock({super.key});
  @override
  // TODO: implement decoration
  Decoration? get decoration =>
      BoxDecoration(color: Color.fromRGBO(17, 22, 39, 1));

  @override
  // TODO: implement child
  Widget? get child => Column(
        children: [TitleRow()],
      );
}

class TitleRow extends Container {
  @override
  // TODO: implement padding
  EdgeInsetsGeometry? get padding => EdgeInsets.fromLTRB(20, 6, 20, 6);
  @override
  // TODO: implement child
  Widget? get child =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Вдохновение",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        CloseButton()
      ]);
}

class CloseButton extends Container {
  CloseButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreativeWindow()));
        },
        icon: const Icon(Icons.cancel),
        iconSize: 28,
      ),
    );
  }
}
