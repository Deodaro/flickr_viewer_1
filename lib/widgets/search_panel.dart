import 'package:flutter/material.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    return Column(
      children: [
        const Text(
          "What would you like\n to Find?",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          width: double.infinity,
          height: 50,

          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 228, 228, 228),
                contentPadding: const EdgeInsets.only(top: 5),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Color.fromARGB(255, 146, 146, 146),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none),
                hintText: "Search",
                hintStyle: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 131, 131, 131))),
          ),
          // SearchBar();
        ),
      ],
    );
    // )
  }
}
