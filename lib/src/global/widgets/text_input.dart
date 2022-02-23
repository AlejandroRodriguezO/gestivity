import 'package:flutter/material.dart';
import 'package:gestivity/src/utils/app_colors.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.icon,
    required this.label,
    this.controller,
    this.validator,
  }) : super(key: key);

  final IconData? icon;
  final String label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: AppColors.backgroundColor,
              )
            : const SizedBox.shrink(),
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.backgroundColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
