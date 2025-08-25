import 'package:flutter/material.dart';

class InlineSelect<T> extends StatelessWidget {
  final String? label;
  final T value;
  final List<Map<String, dynamic>> options;
  final void Function(T v) onChange;

  const InlineSelect({
    super.key,
    this.label,
    required this.value,
    required this.options,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      underline: Container(),
      onChanged: (v) {
        if (v != null) onChange(v);
      },
      items: options
          .map(
            (opt) => DropdownMenuItem<T>(
              value: opt["value"] as T,
              child: Text(opt["label"]),
            ),
          )
          .toList(),
    );
  }
}
