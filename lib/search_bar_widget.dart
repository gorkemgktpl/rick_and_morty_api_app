import 'package:flutter/material.dart';

class SearchBarForm extends StatefulWidget {
  final Future<void> Function(String value) onSearch;
  final String titleText;
  const SearchBarForm(
      {super.key ,required this.titleText,required this.onSearch});

  @override
  SearchBarFormState createState() {
    return SearchBarFormState();
  }
}
class SearchBarFormState extends State<SearchBarForm> {
  final _formKey = GlobalKey<FormState>();
  String controller = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: widget.titleText,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else {
                    controller = value;
                    return null;
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    return await widget.onSearch(controller);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class SearchBarWidget extends StatelessWidget {
  final String labelText;
  final Future<void> Function(String value) onSearch;

  SearchBarWidget({super.key, required this.labelText, required this.onSearch});

  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    onSearch(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: labelText,
            ),
            onSubmitted: (value) {
              _onSearch();
            },
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: IconButton(
          tooltip: 'Search',
          icon: const Icon(Icons.search),
          onPressed: () {
            _onSearch();
          },
        ),
      ),
    ]);
  }
}




