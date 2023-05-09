import 'package:flutter/material.dart';
import 'package:projeto_nw/util/app_colors.dart';

class TextFieldCustomizavel extends StatelessWidget {
  TextEditingController? controller;
  String? hintText;
  Icon? prefixIcon;
  String? labelText;
  String? validatorText;
  String? initialValue;
  final VoidCallback? modal;

  TextFieldCustomizavel(
      {this.controller,
      this.hintText,
      this.prefixIcon,
      this.labelText,
      this.validatorText,
        this.initialValue,
      this.modal});

  @override
  Widget build(BuildContext context) {

    if (initialValue != null) {
      controller = TextEditingController(text: initialValue);
    }




    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundDark2,
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        onTap: modal,
        controller: controller,
        style: TextStyle(color: AppColors.backgroundColor),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.backgroundColor.withOpacity(0.5)),
            prefixIcon: prefixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            // Define o padding com altura da label ajustada

            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: TextStyle(
                color: AppColors.backgroundColor.withOpacity(0.3)),
            // contentPadding: EdgeInsets.only(left: 20),
            labelText: labelText,
            labelStyle: TextStyle(color: AppColors.backgroundColor)),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }
}
