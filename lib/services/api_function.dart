import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newmo/pages/entertainment.dart';
import 'package:newmo/pages/sports.dart';
import 'package:newmo/pages/topheadline.dart';
import 'package:newmo/utils/key.dart' as k;
import 'package:newmo/widget/search.dart';

Future<List> fetchNew() async {
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=';

  // ignore: unused_local_variable
  final response = await http.get(
      Uri.parse(url + k.Key.key2 + '&q=' + SearchBar.searchcontroller.text));

  Map result = jsonDecode(response.body);

  return (result['articles']);
}

//  Entertainment

Future<List> fetchNewEn() async {
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&pageSize=100&apiKey=';

  // ignore: unused_local_variable
  final response = await http.get(
      Uri.parse(url + k.Key.key2 + '&q=' + EnSearchBar.searchcontroller.text));

  Map result = jsonDecode(response.body);

  return (result['articles']);
}

Future<List> fetchNewSp() async {
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&category=sports&pageSize=100&apiKey=';

  // ignore: unused_local_variable
  final response = await http.get(
      Uri.parse(url + k.Key.key2 + '&q=' + SportsSearchBar.searchcontroller.text));

  Map result = jsonDecode(response.body);

  return (result['articles']);
}

Future<List> fetchtopheadline() async {
  String url =
      'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=';

  // ignore: unused_local_variable
  final response = await http.get(Uri.parse(
    url + k.Key.key2 + '&q=' + TopSearchBar.searchcontroller.text,
  ));

  Map result = jsonDecode(response.body);

  return (result['articles']);
}
