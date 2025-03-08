import 'package:fit_lit/common/helper/text_input_style_helper.dart';
import 'package:fit_lit/common/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputBasic extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? inputFormatter;
  final bool? autoFocus;
  final String? prefixText;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final VoidCallback? onTapSearchBar;
  final TextInputStyle style;
  final Color? borderColor;

  const TextInputBasic({
    super.key,
    this.hintText = "",
    this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.autoFocus = false,
    this.prefixText = "",
    this.readOnly = false,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.onTapSearchBar,
    this.style = TextInputStyle.blue,
    this.borderColor,
  });

  @override
  State<TextInputBasic> createState() => _CustumTextState();
}

class _CustumTextState extends State<TextInputBasic> {
  final FocusNode _textFieldFocus = FocusNode();

  List<TextInputFormatter>? _inputFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.deny("\n")
  ];

  @override
  void initState() {
    if (widget.inputFormatter == "number") {
      _inputFormatter = <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ];
    } else if (widget.inputFormatter == "email") {
      _inputFormatter = <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9 @._-]"))
      ];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _textFieldFocus,
      cursorColor: TextInputStyleHelper.getForegroundColor(widget.style),
      autocorrect: false,
      autofocus: widget.autoFocus!,
      controller: widget.controller, // <-- Controller
      readOnly: widget.readOnly!, // <-- ReadOnly
      onChanged: widget.onChanged, // <-- OnChanged
      validator: widget.validator, // <-- validator
      keyboardType: widget.keyboardType,
      inputFormatters: _inputFormatter,
      onTap: widget.onTapSearchBar,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        color: TextInputStyleHelper.getForegroundColor(widget.style),
        fontWeight: FontWeight.w600,
        height: 1,
      ),
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.oceanTealLight,
            width: 1.5,
          ),
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
        hintStyle: const TextStyle(
          color: AppColors.hintTextColor,
          height: 1,
          fontWeight: FontWeight.normal,
        ),
        prefixText: widget.prefixText,
        contentPadding: widget.contentPadding,
        filled: true,
        fillColor: TextInputStyleHelper.getBackgroundColor(widget.style),
      ),
    );
  }
}
