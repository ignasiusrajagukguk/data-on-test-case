import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/widget/button_widget.dart';
import 'package:data_on_test_case/view/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.dark50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget.mainMediumBold('REGISTER', color: ConstColors.white),
                SeparatorWidget.height16(),
                TextFormFieldWidget.textHeight40(
                  'email',
                  controller: _emailController,
                  validator: (value) => (value!.trim().isEmpty)
                      ? 'email tidak boleh kosong'
                      : null,
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                ),
                SeparatorWidget.height16(),
                TextFormFieldWidget.textHeight40(
                  'password',
                  isObscureText: true,
                  controller: _passwordController,
                  validator: (value) => (value!.trim().isEmpty)
                      ? 'password tidak boleh kosong'
                      : null,
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                ),
                SeparatorWidget.height20(),
                ButtonWidget.basic(context, 'Register', action: () {
                  final bool isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    Provider.of<UniversityListProvider>(context, listen: false)
                        .doRegisterUser(context,
                            email: _emailController.text,
                            password: _passwordController.text);
                  }
                }),
                SeparatorWidget.height20(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget.smallX("Already Have Account ?",
                        color: ConstColors.white),
                    SeparatorWidget.width18(),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget.smallX('Login',
                            color: ConstColors.blue30))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
