import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.hintText, required this.searchFieldController});
  final String hintText;
  final TextEditingController searchFieldController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchFieldController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Color(0xff70B9BE),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
