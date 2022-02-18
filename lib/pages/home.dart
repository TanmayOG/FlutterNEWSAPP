import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newmo/services/api_function.dart';
import 'package:newmo/utils/colors.dart';
import 'package:newmo/utils/const.dart';
import 'package:newmo/widget/newsbox.dart';
import 'package:newmo/widget/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  // ignore: prefer_typing_uninitialized_variables
  var subscription;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    news = fetchNew();
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
              backgroundColor: Colors.amber,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("News",
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
                const SearchBar(),
                Expanded(
                    child: SizedBox(
                  width: w,
                  child: FutureBuilder<List>(
                    future: fetchNew(),
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
