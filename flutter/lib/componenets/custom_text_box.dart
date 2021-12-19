import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constans.dart';

class CustomTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? title, label;
  final Icon? decorationIcon;
  final bool? obscureText;
  final void Function(String)? onTextChanged;

  const CustomTextBox({
    Key? key,
    this.title,
    this.label,
    this.decorationIcon,
    this.obscureText = false,
    this.validator,
    this.onTextChanged,
    required this.controller,
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
          validator: widget.validator,
          obscureText: confirmObscured,
          onChanged: widget.onTextChanged,
          decoration: InputDecoration(
            prefixIcon: widget.decorationIcon,
            suffixIcon:
            widget.obscureText! ?
            IconButton(
              onPressed: () {
                setState(() {
                  confirmObscured =! confirmObscured;
                });
              },
              icon: confirmObscured ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
            ) : const SizedBox(),
            labelText: widget.label,
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