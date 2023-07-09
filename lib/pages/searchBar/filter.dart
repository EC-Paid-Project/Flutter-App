import 'dart:convert';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final String search;
  const Filter({Key? key, required this.search}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openFilterDialog(context, search);
      },
      child: const ListTile(
        leading: Icon(Icons.filter_alt_outlined),
        trailing: Text("Filter"),
      ),
    );
  }
}

void openFilterDialog(BuildContext context, String search) async {
  final List<String> sizeOptions = ['Small', 'Medium', 'Large'];
  final List<String> priceOptions = ['Min', 'Max'];
  String? selectedSize;
  String? selectedPrice;
  String selectedSearch = search;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text('Filter'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildDropdown(
                  'Size',
                  sizeOptions,
                  selectedSize,
                  (String? value) {
                    setState(() {
                      selectedSize = value;
                    });
                  },
                ),
                _buildDropdown(
                  'Price',
                  priceOptions,
                  selectedPrice,
                  (String? value) {
                    setState(() {
                      selectedPrice = value;
                    });
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  final Map<String, String?> selectedFilters = {
                    'size': selectedSize ?? '',
                    'price': selectedPrice ?? '',
                    'search': selectedSearch,
                  };

                  Navigator.pop(context, selectedFilters);
                },
                child: Text('Apply'),
              ),
            ],
          );
        },
      );
    },
  ).then((selectedFilters) {
    if (selectedFilters != null) {
      final encoded = jsonEncode(selectedFilters);
      Navigator.pushNamed(context, "/gridPage", arguments: encoded);
    }
  });
}

Widget _buildDropdown(
  String label,
  List<String> options,
  String? selectedOption,
  ValueChanged<String?> onChanged,
) {
  return DropdownButton<String>(
    hint: Text(label),
    value: selectedOption,
    onChanged: onChanged,
    items: options.map<DropdownMenuItem<String>>((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Text(option),
      );
    }).toList(),
  );
}
