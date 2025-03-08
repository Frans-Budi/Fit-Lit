import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TextInputPassword extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  const TextInputPassword({
    super.key,
    this.hintText = "",
    this.controller,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.textInputAction,
    this.focusNode,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  State<TextInputPassword> createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      cursorColor: AppColors.tealBlueLight,
      autocorrect: false,
      controller: widget.controller,
      obscureText: _isHidden,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: const TextStyle(
        color: AppColors.petrolBlueLight,
        fontWeight: FontWeight.w600,
        height: 1,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide:
              const BorderSide(color: AppColors.cyanBlueLight, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.redLight, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: AppColors.redLight, width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 0),
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.inputBlueBgColor,
        contentPadding: widget.contentPadding,
        hintStyle: const TextStyle(
          color: AppColors.hintTextColor,
          height: 1,
          fontWeight: FontWeight.normal,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: AppSizes.s10),
          child: IconButton(
            onPressed: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
            splashRadius: AppSizes.s25,
          ),
        ),
      ),
    );
  }
}
