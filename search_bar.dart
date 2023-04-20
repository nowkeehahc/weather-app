import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  const SearchBar({required this.onSubmitted});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter city name',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              widget.onSubmitted(_controller.text);
            },
          ),
        ),
        onSubmitted: (value) {
          widget.onSubmitted(value);
        },
      ),
    );
  }
}
