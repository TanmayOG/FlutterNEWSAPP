import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newmo/utils/colors.dart';
import 'package:newmo/utils/text.dart';
import 'package:newmo/widget/bottomsheet.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, url, time, title, description;

  const NewsBox(
      {Key? key,
      required this.imageurl,
      required this.url,
      required this.time,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageurl, url);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: Bgmi.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: Bgmi.primary,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModifiedText(text: title, size: 16, color: Colors.white),
                    const SizedBox(
                      height: 5,
                    ),
                    ModifiedText(text: time, size: 12, color: Bgmi.lightwhite)
                  ],
                ))
              ],
            ),
          ),
        ),
        const Seperater()
      ],
    );
  }
}

class Seperater extends StatelessWidget {
  const Seperater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: const Divider(
        color: Colors.white,
      ),
    );
  }
}
