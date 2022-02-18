// ignore_for_file: avoid_print

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newmo/services/api_function.dart';
import 'package:newmo/utils/colors.dart';
import 'package:newmo/utils/const.dart';
import 'package:newmo/widget/newsbox.dart';


class Entertianment extends StatefulWidget {
  const Entertianment({Key? key}) : super(key: key);

  @override
  _EntertianmentState createState() => _EntertianmentState();
}

class _EntertianmentState extends State<Entertianment> {
  late Future<List> news;
  // ignore: prefer_typing_uninitialized_variables
  var subscription;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    news = fetchNewEn();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        setState(() {
          isConnected = false;
          print("No Internet");
        });
      } else {
        print(" moible data");
      }
    });
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return isConnected
        ? Scaffold(
            backgroundColor: Bgmi.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New",
                      style: GoogleFonts.lato(
                          color: Colors.orange, fontWeight: FontWeight.bold)),
                  Text("Mo",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ),
              elevation: 0.0,
              centerTitle: true,
            ),
            body: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const EnSearchBar(),
                Expanded(
                    child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchNewEn(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                // ignore: prefer_if_null_operators
                                imageurl: snapshot.data![index]['urlToImage'] ??
                                    Constant.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return Center(child: Lottie.asset("assets/loader.json"));
                    },
                  ),
                ))
              ],
            ))
        : SizedBox(
            child: Lottie.asset("assets/error.json"),
          );
  }
}

class EnSearchBar extends StatefulWidget {
  const EnSearchBar({Key? key}) : super(key: key);

  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _EnSearchBarState createState() => _EnSearchBarState();
}

Bgmi cs = Bgmi();

class _EnSearchBarState extends State<EnSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Bgmi.darkgrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  textInputAction: TextInputAction.search,
                  controller: EnSearchBar.searchcontroller,
                  decoration: InputDecoration(
                      hintText: 'Search a Keyword',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none),
                ))
              ],
            ),
          ),
        )),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchNewEn();
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const Entertianment()));

            print("searching EN");
          },
          child: Container(
            width: 45,
            height: 45,
            decoration:
                BoxDecoration(color: Bgmi.darkgrey, shape: BoxShape.circle),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
