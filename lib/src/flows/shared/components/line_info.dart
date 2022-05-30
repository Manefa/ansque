import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/dimens.dart';

class LineInfo extends StatelessWidget {
  const LineInfo({Key? key, required this.title, required this.value}) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: AppColors.grey
          ),
        ),
        const SizedBox(width: Dimens.regularSpace),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}