import 'package:flutter/material.dart';
import 'package:mvvm_architecture/extensions/m_q_ext.dart';
import 'package:mvvm_architecture/extensions/num_extention.dart';
// import 'package:mvvm_architecture/resources/app_color.dart';
import 'package:mvvm_architecture/resources/components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);

  @override
  void dispose() {
    // TODO: implement dispose
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    super.dispose();
    print(".................disposed...........");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("login"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.FieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "email",
                      labelText: "email")),
              30.heightBox,
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: ".",
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                              print(value);
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: "password",
                          labelText: "password"));
                },
              ),
              // Container(
              //   color: Colors.green,
              //   // height: MediaQuery.of(context).size.height * .1,
              //   height: context.ScreenHeight * .085,
              // ),
              (context.ScreenHeight * .085).heightBox,
              RoundButton(
                  title: "login",
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage("enter your email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "enter your password", context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "password should be 6 letter", context);
                    } else {
                      print("..............api hit.............. ");
                      Navigator.pushNamed(context, RoutesName.home);
                    }
                  })
            ],
          ),
        ));
  }
}
