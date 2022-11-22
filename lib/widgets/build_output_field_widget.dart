import 'package:flutter/material.dart';

class BuildOutputField extends StatelessWidget {
  String label, output;
  BuildOutputField({required this.label, required this.output});



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 4,
          height: 30,
          color: Theme.of(context).primaryColor,
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: size.width / 4,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: Text(output),
        ),
      ],
    );
  }
}
