import 'package:flutter/material.dart';

class BuildButtonForRow extends StatelessWidget {
  String label;
  Function onPressed;

  BuildButtonForRow({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width/3,
      child: ElevatedButton(
        onPressed: onPressed(),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
