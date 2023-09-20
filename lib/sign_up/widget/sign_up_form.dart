import 'package:fit_now/sign_up/bloc/PasswordField/password_field_bloc.dart';
import 'package:fit_now/sign_up/bloc/check_password/check_password_field_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_now/sign_up/Model/string_extensions.dart' show Validation;

class SignUpForm extends StatelessWidget {
   SignUpForm({super.key, required this.signUpFormKey});

  final GlobalKey signUpFormKey;

   String passWordValue = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Form(
        key: signUpFormKey,
        child: Column(
          children: [
            SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.blue),
                    validator: (value) {
                      if (value == null) {
                        return 'Required *';
                      } else if (value.isEmail(value.trim()) == false) {
                        return 'this is not an email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        border: InputBorder.none,
                        focusColor: Colors.blue,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blue),
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.06),
                        fillColor: Colors.blue.shade900.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: Colors.blue,
                    style: const TextStyle(color: Colors.blue),
                    obscureText:
                        context.watch<PasswordFieldBloc>().state.obsqure,
                    validator: (value) {
                      if (value == null) {
                        return 'Required *';
                      } else {
                        passWordValue = value;
                        return value.isStrongPassword(value);
                      }
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (context
                                  .read<PasswordFieldBloc>()
                                  .state
                                  .obsqure) {
                                context
                                    .read<PasswordFieldBloc>()
                                    .add(const PassWordVisibilityEvent(true));
                              } else {
                                context
                                    .read<PasswordFieldBloc>()
                                    .add(const PassWordVisibilityEvent(false));
                              }
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        suffixIconColor:
                            context.watch<PasswordFieldBloc>().state.color,
                        prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                        hintText: 'password',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.06),
                        fillColor: Colors.blue.shade900.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  TextFormField(
                    autofocus: true,
                    validator: (value) {
                      if (value == null) {
                        return 'Required *';
                      } else if (value != passWordValue) {
                        return 'does not match with password';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.blue),
                    obscureText:
                        context.watch<CheckPasswordFieldBloc>().state.obsqure,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (context
                                  .read<CheckPasswordFieldBloc>()
                                  .state
                                  .obsqure) {
                                context.read<CheckPasswordFieldBloc>().add(
                                    const CheckPassWordVisibilityEvent(true));
                              } else {
                                context.read<CheckPasswordFieldBloc>().add(
                                    const CheckPassWordVisibilityEvent(false));
                              }
                            },
                            icon: const Icon(Icons.remove_red_eye)),
                        suffixIconColor:
                            context.watch<CheckPasswordFieldBloc>().state.color,
                        prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                        hintText: 'conform',
                        hintStyle: TextStyle(fontSize: screenWidth * 0.06),
                        fillColor: Colors.blue.shade900.withOpacity(0.4)),
                  ),

                  
                ],
              ),
            )
          ],
        ));
  }
}
