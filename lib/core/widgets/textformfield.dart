import 'package:flutter/material.dart';
import 'package:supermarket/core/utils/app_colors.dart';

class MainTextFormField extends StatelessWidget {

  final BuildContext context;
  final String hintText;
  final IconData ?prefixIcon;
  final TextEditingController ?controller;
  final String? Function(String ?value)? validator;
  final bool obscure;
  final Widget? suffixIcon;
  final Color focusedErrorBorderColor = Colors.red;
  final Color focusedBorderColor = AppColors.primaryColor;
  final bool readOnly;
  final TextInputType? inputType;

  MainTextFormField({
    Key? key,
    required this.readOnly,
    required this.context,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    required this.obscure,
    this.suffixIcon,
    this.inputType}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double radius = 10;
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscure,
        validator: validator,
        controller: controller,
        readOnly: readOnly,
        cursorColor: Theme.of(context).primaryColorLight,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 20),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey.withOpacity(.5),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: focusedErrorBorderColor),
              borderRadius: BorderRadius.circular(radius)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: focusedErrorBorderColor),
              borderRadius: BorderRadius.circular(radius)),
          labelText: hintText,
          labelStyle: Theme.of(context).textTheme.subtitle1,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: focusedBorderColor),
              borderRadius: BorderRadius.circular(radius)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,

                  color:Theme.of(context).primaryColorLight
              ),
              borderRadius: BorderRadius.circular(radius)),
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).textTheme.subtitle1!.color,
          ),
        ),
      ),
    );
  }
}