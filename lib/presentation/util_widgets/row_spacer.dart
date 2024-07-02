import 'package:flutter/material.dart';

class RowSpacer extends StatelessWidget {
  const RowSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class LargeRowSpacer extends StatelessWidget {
  const LargeRowSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class SmallRowSpacer extends StatelessWidget {
  const SmallRowSpacer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 5,
    );
  }
}
