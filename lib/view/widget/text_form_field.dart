import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/text_widget/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _errorStyleNoLabel = TextStyle(
  color: Colors.red,
  height: 0,
);

class TextFormFieldWidget {
  static Widget textHeight40(
    String hint, {
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String? initialValue,
    FocusNode? focusNode,
    VoidCallback? onEditingComplete,
    bool enable = true,
    TextInputType keyboardType = TextInputType.text,
    int? maxLines = 1,
    int? maxLength,
    EdgeInsets? contentPadding = const EdgeInsets.fromLTRB(10, 0, 10, 0),
    List<TextInputFormatter>? inputFormatters,
    TextStyle textStyle =
        const TextStyle(fontFamily: openSansRegular, fontSize: 14),
    bool? isObscureText,
    OutlineInputBorder? focusBorderColor,
    Function(String? value)? onChanged,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 40),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        obscureText: isObscureText ?? false,
        controller: controller,
        initialValue: initialValue,
        enableSuggestions: true,
        validator: validator,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        enabled: enable,
        style: textStyle.copyWith(color: Colors.black),
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: _Border._defaultInputDecoration(
          style: textStyle,
          contentPadding: contentPadding,
          focusBorderColor: focusBorderColor,
          enable: true,
          hint: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }

}

class _Border {
  //default border
  static OutlineInputBorder _defaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: ConstColors.gray30,
        width: .5,
      ),
    );
  }

  static OutlineInputBorder _focusedBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(
        color: ConstColors.blue30,
        width: .5,
      ),
    );
  }

  static OutlineInputBorder _enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: ConstColors.gray30,
        width: .5,
      ),
    );
  }

  static OutlineInputBorder _errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1.0,
      ),
    );
  }

  static InputDecoration _defaultInputDecoration({
    EdgeInsetsGeometry? contentPadding,
    String? hint,
    bool enable = true,
    OutlineInputBorder? focusBorderColor,
    required TextStyle style,
  }) {
    return InputDecoration(
      contentPadding: contentPadding,
      border: _Border._defaultBorder(),
      focusedBorder: focusBorderColor ?? _Border._focusedBorder(),
      enabledBorder: _Border._enabledBorder(),
      errorBorder: _Border._errorBorder(),
      errorStyle: _errorStyleNoLabel,
      filled: true,
      fillColor: enable ? Colors.white : ConstColors.gray20,
      hintText: hint,
      counterText: '',
    );
  }
}
