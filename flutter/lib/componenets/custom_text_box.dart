import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class CustomTextBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? title, label, hint;
  final Icon? decorationIcon;
  final bool? obscureText, readOnly;
  final void Function(String)? onTextChanged;
  final void Function(String?)? onSaved;

  const CustomTextBox({
    Key? key,
    this.title,
    this.label,
    this.hint,
    this.decorationIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.onTextChanged,
    this.onSaved,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  bool confirmObscured = false;
  @override
  void initState() {
    confirmObscured = widget.obscureText!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null ?
          Text(widget.title!, style: kLabelStyle)
          : const SizedBox(height: 1),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly!,
          validator: widget.validator,
          obscureText: confirmObscured,
          onChanged: widget.onTextChanged,
          onSaved: widget.onSaved,
          style: kTextThinStyle,
          decoration: InputDecoration(
            prefixIcon: widget.decorationIcon,
            suffixIcon:
            (widget.obscureText!) ?
            IconButton(
              onPressed: () {
                setState(() {
                  confirmObscured =! confirmObscured;
                });
              },
              icon: confirmObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            ) : const SizedBox(),
            labelText: widget.label,
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.purple),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}