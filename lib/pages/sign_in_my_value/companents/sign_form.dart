import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/default_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
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
            SizedBox(
              height: 20,
            ),
            DefaultButton(
              text: 'Sign In',
              press: () {},
            )
          ],
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

  TextFormField buildEmailTextFormField() {
    return TextFormField(
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
}
