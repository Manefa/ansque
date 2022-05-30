import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hi_icons/flutter_hi_icons.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.title,
    this.onPressed,
    this.color,
    this.outline = true,
    this.defaultPosition,
    this.iconButton,
    this.isCircleButton
  }) : super(key: key);

  final String? title;
  final Color? color;
  final VoidCallback? onPressed;
  final bool outline;
  final bool? iconButton;
  final bool? defaultPosition;
  final bool? isCircleButton;

  const Button.primary({
    Key? key,
    title,
    required onPressed,
    outline,
  }) : this(
    key: key,
    title: title,
    onPressed: onPressed,
    color: AppColors.primary,
    outline: outline ?? false,
  );

  const Button.secondary({
    Key? key,
    title,
    VoidCallback? onPressed,
    outline,
  }) : this(
    key: key,
    title: title,
    onPressed: onPressed,
    color: AppColors.secondary,
    outline: outline ?? false,
  );

  const Button.withIcon({
    Key? key,
    title,
    VoidCallback? onPressed,
    required outline,
    required iconButton,
    defaultPosition,
  }) : this(
    key: key,
    title: title,
    onPressed: onPressed,
    color: AppColors.secondary,
    outline: outline,
    iconButton: iconButton,
    defaultPosition: defaultPosition,
  );

  const Button.circleButton({
    Key? key,
    VoidCallback? onPressed,
    required Color color,
    required isCircleButton,
  }) : this(
    key: key,
    onPressed: onPressed,
    color: color,
    isCircleButton: isCircleButton
  );

  @override
  Widget build(BuildContext context) {
    Widget child;

    if(isCircleButton == true){
      child = Material(
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.doublePadding),
          ),
          splashColor: Colors.black.withOpacity(0.2),
          highlightColor: Colors.black.withOpacity(0.1),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: Dimens.regularSpace * 6,
              width: Dimens.regularSpace * 6,
              decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle
              ),
              child: const Icon(
                HiIcons.add_bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    else if (outline) {
      child = Expanded(
        child: SizedBox(
          height: 50,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600, color: color),
            ),
          ),
        ),
      );
    } else if(iconButton == true){
      child = Expanded(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(defaultPosition == false)
                  Row(
                    children: const [
                      Icon(
                        HiIcons.left_1_light_outline,
                        color: Colors.white,
                      ),
                      SizedBox(width: Dimens.regularSpace),
                    ],
                  ),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                if(defaultPosition! == true)
                Row(
                  children: const [
                    SizedBox(width: Dimens.regularSpace),
                    Icon(
                      HiIcons.right_1_light_outline,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else{
      child = Expanded(
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: color ?? Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      );
    }
    return Row(
      children: [child],
    );
  }
}
