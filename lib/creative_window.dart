import 'package:example/photo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreativeWindow extends StatelessWidget {
  const CreativeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: MainContainer(),
        )));
  }
}

class MainContainer extends Container {
  MainContainer({super.key});
  @override
  Decoration? get decoration =>
      const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255));

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.fromLTRB(20, 6, 20, 6);
  @override
  Widget? get child => const Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CreativeWindowMainContent(), FooterContent()],
      ));
}

class CreativeWindowMainContent extends Column {
  const CreativeWindowMainContent({super.key});
  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.center;
  @override
  List<Widget> get children => [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [TitleRow(), PageImage(), ChangeImageButton()],
        ),
      ];
}

class TitleRow extends Row {
  const TitleRow({super.key});
  @override
  MainAxisAlignment get mainAxisAlignment => MainAxisAlignment.spaceBetween;
  @override
  List<Widget> get children => [
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
      ];
}

class PageImage extends Row {
  const PageImage({super.key});
  @override
  List<Widget> get children => [
        Container(
          width: 335,
          height: 335,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/images/images.jpg'),
                  fit: BoxFit.fill),
              border: Border.all(color: const Color.fromARGB(0, 255, 255, 255)),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
        )
      ];
}

class ChangeImageButton extends Row {
  const ChangeImageButton({super.key});

  @override
  List<Widget> get children => [ChangeImageTextButton()];
}

class ChangeImageTextButton extends Container {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PhotoWindow()));
        },
        style: TextButton.styleFrom(
          side: const BorderSide(style: BorderStyle.none),
          backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
        ),
        child: const Text(
          "Поменять картинку",
          style: TextStyle(
            color: Color.fromRGBO(82, 87, 99, 1),
            fontWeight: FontWeight.w400,
            fontSize: 12,
            // fontFamily: Open Sans,
          ),
        ),
      ),
    );
  }
}

class FooterContent extends Column {
  const FooterContent({super.key});
  @override
  CrossAxisAlignment get crossAxisAlignment => CrossAxisAlignment.center;
  @override
  List<Widget> get children => [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [InfoBlock(), SharingButton()],
        ),
      ];
}

class InfoBlock extends Row {
  const InfoBlock({super.key});

  @override
  List<Widget> get children => [
        Container(
          width: 335,
          height: 88,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 243, 243, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: const Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info,
                    color: Color.fromRGBO(147, 150, 156, 1),
                  ),
                  Text(
                    "Дополнительная информация",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Text(
                "Промокод можно передвинуть куда пожелаете и поделиться своим творением.",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(82, 87, 99, 1)),
              )
            ],
          ),
        )
      ];
}

class SharingButton extends Row {
  const SharingButton({super.key});

  @override
  // TODO: implement children
  List<Widget> get children => [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    print("SHARING");
                  },
                  style: TextButton.styleFrom(
                      side: const BorderSide(style: BorderStyle.none),
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.fromLTRB(70, 17, 70, 17),
                      fixedSize: Size(335, 60)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Text(
                        "Поделиться творением",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ))
            ],
          ),
        )
      ];
}
