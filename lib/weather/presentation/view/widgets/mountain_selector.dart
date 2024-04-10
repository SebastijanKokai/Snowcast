import 'package:flutter/material.dart';

class MountainSelector extends StatefulWidget {
  const MountainSelector({super.key});

  @override
  State<MountainSelector> createState() => _MountainSelectorState();
}

class _MountainSelectorState extends State<MountainSelector> {
  TextEditingController controller = TextEditingController();

  final mountainList = ['Zlatibor', 'Kopaonik', 'Jahorina'];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        dropdownMenuEntries: [1, 2, 3].map((e) {
      return DropdownMenuEntry(value: e, label: 'Hello $e');
    }).toList());
  }
}
