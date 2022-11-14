import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FiltersPokemon'),
      ),
      body: _bodyFilterPokemon(),
    );
  }

  Widget _bodyFilterPokemon() {
    return FilterChip(
      label: Text("text"),
      onSelected: (bool value) {
        print("selected");
      },
    );
  }
}
