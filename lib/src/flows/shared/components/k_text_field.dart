import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.obscureText = false,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.onTap,
    this.autofocus = false,
    this.autoValidateMode = AutovalidateMode.disabled,
  })  : isBorderless = false,
        super(key: key);

  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isBorderless;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;

  const KTextField.search({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.autofocus = false,
    this.readOnly = false,
    this.obscureText = false,
    bool? isBorderless,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.onTap,
    this.autoValidateMode,
  })  : isBorderless = isBorderless ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      textAlignVertical: TextAlignVertical.center,
      onTap: onTap,
      autovalidateMode: autoValidateMode,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: !isBorderless,
        fillColor: AppColors.primary.withOpacity(0.05),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusColor: Theme.of(context).colorScheme.secondary,
        hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );

    if (isBorderless) return child;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.grey),
          ),
        child,
      ],
    );
  }
}
