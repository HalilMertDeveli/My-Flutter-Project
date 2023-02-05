import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/default_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            buildEmailTextFormField(),
            SizedBox(
              height: 20,
            ),
            buildPasswordTextFormField(),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: Colors.amber,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                Text('Remember Me '),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // forgot password actions
                  },
                  child: Text(
                    'Forgot Password ? ',
                    style: TextStyle(color: Colors.amber, fontSize: 19),
                  ),
                )
              ],
            ),
            Column(
              children: List.generate(
                  errors.length, (index) => formErrorText(errors[index])),
            ),
            SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: 'Sign In',
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 15,
          width: 15,
        ),
        SizedBox(
          width: 10,
        ),
        Text(error)
      ],
    );
  }

  final String kEmailNullError = "Please Enter your email";
  final emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final kInvalidEmailError = "Please Enter Valid Email";

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        email = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(keepToString)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value != null) {
          if (value.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          } else if (!emailValidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.email),
        label: Text('Email'),
        hintText: 'Enter your email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains('Please Enter your password')) {
          setState(() {
            errors.remove('Please Enter your password');
          });
        } else if (value.length >= 8 &&
            errors.contains('password is too short')) {
          errors.remove('password is too short');
        }
        return null;
      },
      validator: (value) {
        if (value != null) {
          if (value.isEmpty && !errors.contains('Please Enter your password')) {
            setState(() {
              errors.add('Please Enter your password');
            });
          } else if (value.length < 8 &&
              !errors.contains('password is too short')) {
            setState(() {
              errors.add('password is too short');
            });
          }
        }
        return null;
      },
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
        labelText: 'Password',
        hintText: 'Enter Your password',
        suffixIcon: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }
}
