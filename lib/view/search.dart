import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchPage'),
      ),
      body: _bodySearch(),
    );
  }

  Widget _bodySearch() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              suffixIcon: InkWell(
                child: Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Search ',
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
