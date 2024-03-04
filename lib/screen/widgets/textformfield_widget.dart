import 'package:flutter/material.dart';
import 'package:student_management/core/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.conroller,
      required this.labelText,
       this.validator,
      this.keyboardType});
  final TextEditingController conroller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
          keyboardType: keyboardType ?? TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: conroller,
          decoration: InputDecoration(
              label: Text(labelText),
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 50, 50, 50)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: kRadiu20, borderSide: side),
              enabledBorder: OutlineInputBorder(
                borderRadius: kRadiu10,
                borderSide: side,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: kRadiu10,
                borderSide: const BorderSide(
                    width: 2, color: Color.fromARGB(121, 255, 0, 0)),
              ),
              focusedErrorBorder: OutlineInputBorder(borderRadius: kRadiu10)),
          validator: validator),
    );
  }
}
