import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/distributor.dart';

class DistributorsPage extends StatefulWidget {
  const DistributorsPage({super.key});

  @override
  _DistributorsPage createState() => _DistributorsPage();
}

void onDistributorTap(Distributor distributor) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String encodedDistributor = jsonEncode(distributor.toJson());
  await prefs.setString('LpgDistributor', encodedDistributor);
}

class _DistributorsPage extends State<DistributorsPage> {
  List<Distributor> distributors = [];
  @override
  void initState() {
    super.initState();
    fetchDistributorsFromPrefs();
  }

  Future<void> fetchDistributorsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? encodedDistributors = prefs.getStringList('LpgDistributors');
    if (encodedDistributors != null) {
      setState(() {
        distributors = encodedDistributors
            .map((encoded) => Distributor.fromJson(jsonDecode(encoded)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Map Page'),
      ),
      body: ListView.builder(
        itemCount: distributors.length,
        itemBuilder: (context, index) {
          Distributor distributor = distributors[index];
          return ListTile(
            title: Text(distributor.name),
            subtitle: Text(
                'Distance: ${distributor.distance.toStringAsFixed(2)} meters'),
            onTap: () {
              onDistributorTap(distributor);
            },
          );
        },
      ),
    );
  }
}
