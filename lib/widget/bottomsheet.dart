// import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newmo/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, description, imageurl, url) {
  showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
            title: title,
            description: description,
            imageurl: imageurl,
            url: url);
      });
}

// ignore: unused_element
_launcherURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomSheetImage(imageurl: imageurl, title: title),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                margin: const EdgeInsets.all(10),
                child: ModifiedText(
                    text: description, size: 14, color: Colors.white),
              ),
            ),
            Container(
              // height: 5,
              padding: const EdgeInsets.all(10),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launcherURL(url);
                        },
                      style: GoogleFonts.lato(color: Colors.blue.shade400))
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageurl, title;
  const BottomSheetImage(
      {Key? key, required this.imageurl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(imageurl), fit: BoxFit.cover)),
          ),
          Positioned(
              top: 200,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 330,
                child: BoldText(
                  color: Colors.white,
                  size: 16,
                  text: title,
                ),
              ))
        ],
      ),
    );
  }
}
