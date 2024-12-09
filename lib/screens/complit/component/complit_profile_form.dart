import 'package:flutter/material.dart';
import 'package:buybliss2/components/error_form.dart';
import 'package:buybliss2/components/my_button.dart';
import 'package:buybliss2/components/my_suffix_icon.dart';
import 'package:buybliss2/constant.dart';
import 'package:buybliss2/screens/otp/otp_screen.dart';
import 'package:buybliss2/sized_config.dart';

class completeForm extends StatefulWidget {

  const completeForm({super.key});

  @override
  State<completeForm> createState() => _completeFormState();
}

class _completeFormState extends State<completeForm> {
  String? firstName;

  String? LastName;

  String? phoneNumber;

  String? address;

  final _formKey = GlobalKey<FormState>();

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          firstNameField(),
          SizedBox(height: getPropScreenHeight(20),),
          lastNamefield(),
          SizedBox(height: getPropScreenHeight(20),),
          phoneNumberField(),
          SizedBox(height: getPropScreenHeight(20),),
          addresFormField(),
          SizedBox(height: getPropScreenHeight(20),),
          ErrorForm(errors: errors),
          SizedBox(height: getPropScreenHeight(20),),
          MyButton(text: "Continue", press: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }

            if (errors.isEmpty) {
              Navigator.pushNamed(context, OtpScreen.routesName);
            }
          }),
        ],
      )
      );
  }

  TextFormField addresFormField() {
    return TextFormField(
                onSaved: (newValue)  => address = newValue!,
                onChanged: (value){
              if (value.isNotEmpty && errors.contains(kAddressNullError)) {
                setState(() {
                  errors.remove(kAddressNullError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kAddressNullError)) {
                setState(() {
                  errors.add(kAddressNullError);
                });
              }
              return null;
            },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Addrest",
                  hintText: "Enter Your Addrest",
                  
                  floatingLabelBehavior: 
                  FloatingLabelBehavior.auto,
                  suffixIcon: 
                  CostumSuffixIcon(icon: "assets/icons/Location point.svg", width: 20,)
                  ),
                );
  }

  TextFormField phoneNumberField() {
    return TextFormField(
                onSaved: (newValue)  => phoneNumber = newValue!,
                onChanged: (value){
                if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
                  setState(() {
                    errors.remove(kPhoneNumberNullError);
                  });
                }
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
                  setState(() {
                    errors.add(kPhoneNumberNullError);
                  });
                }
                return null;
                },
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter Your First Name",
                  
                  floatingLabelBehavior: 
                  FloatingLabelBehavior.auto,
                  suffixIcon: 
                  CostumSuffixIcon(icon: "assets/icons/Phone.svg", width: 20,)
                  ),
                );
  }

  TextFormField lastNamefield() {
    return TextFormField(
                onSaved: (newValue)  => LastName = newValue!,
                onChanged: (value){
                if (value.isNotEmpty && errors.contains(kNameNullError)) {
                  setState(() {
                    errors.remove(kNameNullError);
                  });
                }
              },
              validator: (value) {
                  if (value!.isEmpty && !errors.contains(kNameNullError)) {
                    setState(() {
                      errors.add(kNameNullError);
                    });
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter Your First Name",
                  
                  floatingLabelBehavior: 
                  FloatingLabelBehavior.auto,
                  suffixIcon: 
                  CostumSuffixIcon(icon: "assets/icons/User.svg", width: 20,)
                  ),
                );
  }

  TextFormField firstNameField() {
    return TextFormField(
                onSaved: (newValue)  => firstName = newValue!,
                onChanged: (value){
                  if (value.isNotEmpty && errors.contains(kNameNullError)) {
                    setState(() {
                      errors.remove(kNameNullError);
                    });
                  }
                },
                validator: (value) {
                  if (value!.isEmpty && !errors.contains(kNameNullError)) {
                    setState(() {
                      errors.add(kNameNullError);
                    });
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter Your First Name",
                  
                  floatingLabelBehavior: 
                  FloatingLabelBehavior.auto,
                  suffixIcon: 
                  CostumSuffixIcon(icon: "assets/icons/User.svg", width: 20,)
                  ),
                );
  }
}