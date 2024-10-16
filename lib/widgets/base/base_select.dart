import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  final Map<String, String> option;
  final String hintText;
  final Function(String) onSelected;
  const BaseSelect(
      {super.key,
      required this.option,
      required this.hintText,
      required this.onSelected});

  @override
  BaseSelectState createState() => BaseSelectState();
}

class BaseSelectState extends State<BaseSelect> {
  String? selectedDay;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          value: selectedDay,
          hint: Text(widget.hintText),
          onChanged: (String? newValue) {
            setState(() {
              selectedDay = newValue;
            });
            widget.onSelected(newValue!);
          },
          items: widget.option.entries.map<DropdownMenuItem<String>>((select) {
            return DropdownMenuItem<String>(
              value: select.value,
              child: Text(select.key),
            );
          }).toList(),
        ));
  }
}
