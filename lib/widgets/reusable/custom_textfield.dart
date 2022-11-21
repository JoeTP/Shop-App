import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/config/variables.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? type;
  final String? label;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? prefixTap;
  final FormFieldValidator? validate;
  final bool autoFocus;
  // final TextAlign? textAlign;
  // final TextDirection textDecoration;
  // final TextDirection hintTextDirection;
  final int? maxLine;
  final int? maxLength;
  final MaxLengthEnforcement? enforceMax;
  final String? hintText;

  // final FloatingLabelAlignment floatingLabelAlignment;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool readOnly;
  final border;
  final List<TextInputFormatter>? digits;
  final Color? prefixColor;

  final VoidCallback? pressSuffix;
  final IconData? prefix;

  final IconData? suffix;
  final bool? counterText;
  final bool isPassword;
  final bool enable;
  final double? width;

  DefaultFormField({
    Key? key,
    required this.controller,
    this.label,
    this.type = TextInputType.text,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    // this.floatingLabelAlignment = FloatingLabelAlignment.center,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    // this.hintTextDirection = TextDirection.rtl,
    this.onSubmit,
    // this.textAlign,
    // this.textDecoration = TextDirection.rtl,
    this.maxLine = 1,
    this.maxLength,
    this.enforceMax,
    this.onChanged,
    this.validate,
    this.onTap,
    this.prefixTap,
    this.prefixColor,
    this.enable = true,
    this.hintText,
    this.border,
    this.digits,
    this.counterText = true,
    this.prefix,
    this.width,
    this.pressSuffix,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: TextFormField(
        enabled: enable,
        maxLength: maxLength,
        maxLengthEnforcement: enforceMax,
        maxLines: maxLine,
        autofocus: autoFocus,
        // textDirection: textDecoration,
        // textAlign: textAlign,
        readOnly: readOnly,
        controller: controller,
        obscureText: isPassword,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        onTap: onTap,
        inputFormatters: digits,
        decoration: InputDecoration(
            // counterText: '' ,
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(360)
            ),
            // hintTextDirection: TextDirection.rtl,
            hintText: hintText,
            // floatingLabelAlignment: floatingLabelAlignment,
            floatingLabelBehavior: floatingLabelBehavior,
            prefixIcon: IconButton(
              icon: Icon(prefix),
              onPressed: prefixTap,
              color: prefixColor,
            ),
            suffixIcon: IconButton(
              onPressed: pressSuffix,
              icon: Icon(suffix),
              padding: EdgeInsets.zero,
              splashRadius: 10,
              iconSize: 15,
            ),
          isDense: true
        ),
      ),
    );
  }
}
