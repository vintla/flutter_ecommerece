import 'package:ecommerce_app/app/common/blocs/button/button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FieldType {
  text,
  email,
  password;

  String errorMessage(String value) {
    switch (this) {
      case FieldType.password:
        if (value.isEmpty) {
          return "*This field is required!";
        }
        if (value.length < 6) {
          return "*This field must be at least 6 characters!";
        }
        return "";
      case FieldType.text:
        if (value.isEmpty) {
          return "*This field is required!";
        }
        if (value.length < 5) {
          return "*This field must be at least 5 characters!";
        }
        return "";
      case FieldType.email:
        if (value.isEmpty) {
          return "*This field is required!";
        }
        if (!value.contains("@")) {
          return "*This field must be an email!";
        }
        if (value.length < 6) {
          return "*This field must be at least 6 characters!";
        }
        return "";
      default:
        return "!-_-!";
    }
  }
}

class BasicTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FieldType type;
  const BasicTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
  });

  @override
  State<BasicTextField> createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final isActive = widget.controller.value.text.isNotEmpty;
      setState(() {
        isActive
            ? context.read<ButtonCubit>().enable()
            : context.read<ButtonCubit>().disable();
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.type == FieldType.password ? true : false,
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.type.errorMessage(widget.controller.value.text),
      ),
    );
  }

  // String errorText() {
  //   String text = widget.controller.value.text;
  //   FieldType type = widget.type;
  //   if (text.isEmpty) {
  //     return "*This field is required";
  //   }
  //   if (text.length < 6) {
  //     return "*This field must be at least 6 characters";
  //   }
  //
  //   return "";
  // }
}
