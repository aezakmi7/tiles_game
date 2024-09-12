import 'package:flutter/material.dart';

class TopModalSheet extends StatelessWidget {
  const TopModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/modal_sheet_top.png',
      width: double.infinity,
      height: 157,
      fit: BoxFit.cover,
    );
  }
}
