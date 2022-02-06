import 'package:flutter/material.dart';

import '../../values/values.dart';

class Emptiness extends StatelessWidget {
  const Emptiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Sizes.WIDTH_0,
      height: Sizes.HEIGHT_30,
    );
  }
}
