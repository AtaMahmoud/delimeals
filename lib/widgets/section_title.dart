import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
