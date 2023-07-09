import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/pages/searchBar/filter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomSearchBar extends StatefulWidget {
  final bool filter;

  const CustomSearchBar({required this.filter, Key? key}) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late String search = "";
  final List<String> suggestions = [
    'cylinder',
    'small',
    '8kg',
    '10kg',
    'large',
  ];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: const BoxDecoration(
            color: Color(0xFFf3f3f3),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Center(
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _textEditingController,
                  autofocus: false,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: InputBorder.none,
                    hintText: "Search product",
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFBDBDBD),
                    ),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF212121),
                    ),
                  ),
                  onSubmitted: (value) {
                    final Map<String, String> jsonData = {
                      'search': _textEditingController.text
                    };
                    final jsonString = jsonEncode(jsonData);
                    setState(() {
                      search = jsonData["search"]!;
                    });
                    Navigator.pushNamed(context, "/gridPage",
                        arguments: jsonString);
                  }),
              suggestionsCallback: (pattern) {
                return suggestions
                    .where((name) =>
                        name.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion.toString()),
                );
              },
              onSuggestionSelected: (suggestion) {
                final Map<String, String> jsonData = {
                  'search': suggestion.toString()
                };
                final jsonString = jsonEncode(jsonData);
                setState(() {
                  search = jsonData["search"]!;
                  _textEditingController.text = suggestion.toString();
                });
                Navigator.pushNamed(context, "/gridPage",
                    arguments: jsonString);
              },
            ),
          ),
        ),
        if (widget.filter) Filter(search: search),
      ],
    );
  }
}
