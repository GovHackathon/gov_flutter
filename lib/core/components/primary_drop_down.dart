import 'package:flutter/material.dart';

class PrimaryDropDown extends StatelessWidget {
  const PrimaryDropDown({
    super.key,
    required this.title,
    required this.onChanged,
  });

  final String title;
  final Function(dynamic val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          items: const [
            DropdownMenuItem(
              child: Text(
                "Pilih Kategori",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            )
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
