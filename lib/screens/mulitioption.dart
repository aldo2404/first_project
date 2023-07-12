import 'package:flutter/material.dart';

class MultiSelectDropdown<T> extends StatefulWidget {
  final List<T> options;
  final List<T> selectedValues;
  final String hintText;
  final void Function(T?)? onChanged;

  MultiSelectDropdown({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.hintText,
    required this.onChanged,
  });

  @override
  MultiSelectDropdownState<T> createState() => MultiSelectDropdownState<T>();
}

class MultiSelectDropdownState<T> extends State<MultiSelectDropdown<T>> {
  List<T> _selectedValues = [];

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      hint: Text(widget.hintText),
      value: null,
      onChanged: widget.onChanged,
      items: widget.options.map((option) {
        return DropdownMenuItem<T>(
          value: option,
          child: ListTile(
            title: Text(option.toString()),
            leading: Checkbox(
              value: _selectedValues.contains(option),
              onChanged: (value) {
                setState(() {
                  if (value != null && value) {
                    _selectedValues.add(option);
                  } else {
                    _selectedValues.remove(option);
                  }
                  widget.onChanged!(_selectedValues as T?);
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  List<String> _selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Selection Dropdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi-Selection Dropdown'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MultiSelectDropdown<String>(
              options: _options,
              selectedValues: _selectedValues,
              hintText: 'Select Options',
              onChanged: (values) {
                setState(() {
                  _selectedValues = values as List<String>;
                });
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print('Selected Values: $_selectedValues');
          },
          child: const Icon(Icons.check),
        ),
      ),
    );
  }
}
