import 'package:flutter/material.dart';
import 'package:tekblog/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividercolor,
      thickness: 1,
      indent: size.width / 5.5,
      endIndent: size.width / 5.5,
    );
  }
}
