import 'package:flutter/material.dart';

class PrimaryDatePicker extends StatelessWidget {
  const PrimaryDatePicker({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.only(left: 12, right: 12),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff68696F)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("DD/MM/YYYY"),
            IconButton(
              onPressed: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2025),
              ),
              icon: const Icon(Icons.calendar_month_outlined),
            )
          ],
        ),
      ),
    );
  }
}
