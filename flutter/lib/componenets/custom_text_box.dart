import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/style.dart';

class CustomTextBox extends StatefulWidget {
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label, hint;
  final Icon? decorationIcon;
  final bool? obscureBool, readOnly;
  final bool? borderless;
  final void Function(String)? onTextChanged;
  final double customFontSize;
  final Color? fillcolor, textColor;
  final int? maxLines, minLines, maxLength;
  final TextInputType? keyboardType;

  const CustomTextBox(
      {Key? key,
      this.label,
      this.hint,
      this.decorationIcon,
      this.obscureBool = false,
      this.readOnly = false,
      this.validator,
      this.onTextChanged,
      this.controller,
      this.borderless = false,
      this.customFontSize = 16,
      this.textColor,
      this.fillcolor,
      this.suffixWidget = const SizedBox(),
      this.maxLines,
      this.minLines,
      this.keyboardType,
      this.maxLength})
      : super(key: key);

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool confirmObscured = false;

  @override
  void initState() {
    confirmObscured = widget.obscureBool!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      //autofocus: true,
      //focusNode: FocusNode(),
      keyboardType: widget.keyboardType ?? TextInputType.multiline,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      controller: widget.controller,
      readOnly: widget.readOnly!,
      validator: widget.validator,
      obscureText: confirmObscured,
      onChanged: widget.onTextChanged,
      style: TextStyle(
        color: widget.textColor ?? blackColor,
        fontFamily: 'Comfortaa',
        fontSize: widget.customFontSize,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillcolor ?? whiteColor,
        prefixIcon: widget.decorationIcon,
        suffixIcon: (widget.obscureBool!)
            ? IconButton(
                onPressed: () {
                  setState(() {
                    confirmObscured = !confirmObscured;
                  });
                },
                icon: confirmObscured
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : widget.suffixWidget,
        labelText: widget.label,
        labelStyle: TextStyle(
          fontFamily: 'Comfortaa',
          fontSize: 16,
          color: blackColor,
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hint,
        border: !widget.borderless!
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            : null,
      ),
    );
  }
}
