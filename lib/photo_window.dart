import 'package:example/creative_window.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PhotoWindow extends StatelessWidget {
  const PhotoWindow({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SafeArea(child: PhotoMainBlock())));
  }
}

class CameraMainScreen extends StatefulWidget {
  const CameraMainScreen({super.key});

  @override
  State<CameraMainScreen> createState() => _CameraMainScreenState();
}

class _CameraMainScreenState extends State<CameraMainScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {});
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return CameraPreview(cameraController);
    } else {
      return const SizedBox();
    }
  }
}

class PhotoMainBlock extends Container {
  PhotoMainBlock({super.key});
  @override
  Decoration? get decoration =>
      BoxDecoration(color: Color.fromRGBO(17, 22, 39, 1));

  @override
  Widget? get child => Column(
        children: [TitleRow(), CameraWindow(), PhotoButtons()],
      );
}

class TitleRow extends Container {
  @override
  EdgeInsetsGeometry? get padding => EdgeInsets.fromLTRB(20, 6, 20, 6);
  @override
  Widget? get child =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text(
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

class CameraWindow extends Container {
  CameraWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: 375,
      child: const CameraMainScreen(),
    );
  }
}

class PhotoButtons extends Container {
  PhotoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: [IconButton(onPressed: () {}, icon: Icon(Icons.cached))],
      ),
    );
  }
}
