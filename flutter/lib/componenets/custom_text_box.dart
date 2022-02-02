import 'package:flutter/material.dart';
import 'package:vtys_kalite/utilities/constants.dart';

class CustomTextBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? title, label, hint;
  final Icon? decorationIcon;
  final bool? obscureText, readOnly;
  final bool? borderless;
  final void Function(String)? onTextChanged;
  final double customFontSize;
  final Color fillcolor;

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
    this.controller,
    this.borderless = false,
    this.customFontSize = 16,
    this.fillcolor = Colors.white,
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
        widget.title != null
            ? Text(widget.title!, style: kLabelStyle)
            : const SizedBox(height: 1),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly!,
          validator: widget.validator,
          obscureText: confirmObscured,
          onChanged: widget.onTextChanged,
          style: TextStyle(
            color: kTextFontColor,
            fontFamily: 'Comfortaa',
            fontSize: widget.customFontSize,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            prefixIcon: widget.decorationIcon,
            suffixIcon: (widget.obscureText!)
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
                : const SizedBox(),
            labelText: widget.label,
            hintText: widget.hint,
            border: !widget.borderless!
                ? OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(20),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
