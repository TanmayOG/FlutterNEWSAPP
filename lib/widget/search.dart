import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newmo/pages/home.dart';
import 'package:newmo/services/api_function.dart';
import 'package:newmo/utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  static TextEditingController searchcontroller =
      TextEditingController(text: '');

  @override
  _SearchBarState createState() => _SearchBarState();
}

Bgmi cs = Bgmi();

class _SearchBarState extends State<SearchBar> {
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
                  controller: SearchBar.searchcontroller,
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
            fetchNew();
            setState(() {
              
            });
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
