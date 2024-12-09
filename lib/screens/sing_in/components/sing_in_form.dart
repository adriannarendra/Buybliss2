import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/components/error_form.dart';
import 'package:buybliss2/components/my_button.dart';
import 'package:buybliss2/components/my_suffix_icon.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/screens/forgot/forgot_screen.dart';
import 'package:buybliss2/screens/login_succses/succses_screen.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/auth_provider.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  bool remember = false;
  String? password;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          //Email
          emailForm(),
          SizedBox(height: getPropScreenHeight(30)),
          //Password
          pwForm(),
          SizedBox(height: getPropScreenHeight(30)),
          //Remember
          rememberMe(),
          SizedBox(height: getPropScreenHeight(20)),
          // Error Form
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20)),
          //Login Button
          MyButton(
            text: "Sign In",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (errors.isEmpty) {
                Provider.of<AuthProvider>(context, listen: false)
                    .getMail(true, email: email);
                Navigator.pushNamed(context, SuccsesScreen.routesName);
              }
            },
          )
        ]));
  }

  Row rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: remember,
          onChanged: (value) {
            setState(() {
              remember = value!;
            });
          },
          activeColor: kPrimaryColor,
        ),
        Text(
          "Remember me",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotScreen.routesName);
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.black,
              ),
          ),
        ),
      ],
    );
  }

  TextFormField pwForm() {
    return TextFormField(
      onChanged: (value) {
        if (value.isEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value.length < 8 &&
            (!errors.contains(kPassNullError) &&
                !errors.contains(kShortPassError))) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter Your Password",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/Lock.svg",
            width: 20,
          )),
    );
  }

  TextFormField emailForm() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter Your Email",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: CostumSuffixIcon(
            icon: "assets/icons/Mail.svg",
            width: 25,
          )),
    );
  }
}
