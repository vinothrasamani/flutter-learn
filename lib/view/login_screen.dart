import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/controller/utilities_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String phone = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLogin = true;
  bool canshowPassword = false, canshowConfirmPassword = false;

  void unFocus(v) {
    FocusScope.of(context).unfocus();
  }

  String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (!isLogin && confirmPassword != password) {
        password = '';
        confirmPassword = '';
        UtilitiesController.showSnackBar(
          context,
          'Password and Confirm Password must be same',
          backgroundColor: Colors.red,
        );
        setState(() {});
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: _size.height,
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                        if (!isLogin)
                          Positioned(
                            right: 0,
                            bottom: 10,
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  if (!isLogin)
                    Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Username'),
                            hintText: 'Enter Username',
                            suffix: Icon(Icons.person),
                          ),
                          onTapOutside: unFocus,
                          validator: validate,
                          onSaved: (newValue) {
                            username = newValue!;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Phone'),
                            hintText: 'Enter Your Phone No',
                            suffix: Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone,
                          onTapOutside: unFocus,
                          validator: validate,
                          onSaved: (newValue) {
                            phone = newValue!;
                          },
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('E-mail'),
                      hintText: 'Enter Your e-mail',
                      suffix: Icon(Icons.mail),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onTapOutside: unFocus,
                    validator: validate,
                    onSaved: (newValue) {
                      email = newValue!;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Password'),
                      hintText: 'Enter Password',
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            canshowPassword = !canshowPassword;
                          });
                        },
                        child: Icon(!canshowPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    obscureText: !canshowPassword,
                    onTapOutside: unFocus,
                    validator: validate,
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                  ),
                  if (!isLogin) SizedBox(height: 15),
                  if (!isLogin)
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Confirm Password'),
                        hintText: 'Enter confirm Password',
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              canshowConfirmPassword = !canshowConfirmPassword;
                            });
                          },
                          child: Icon(!canshowConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      obscureText: !canshowConfirmPassword,
                      onTapOutside: unFocus,
                      validator: validate,
                      onSaved: (newValue) {
                        confirmPassword = newValue!;
                      },
                    ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submit,
                      child: Text(
                        isLogin ? 'Sign In' : 'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(' OR '),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(10)),
                      label: Text(
                        isLogin ? 'Sign In With Google' : 'Sign Up With Google',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      icon: Image.asset(
                        'assets/images/google-logo.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily),
                      children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: isLogin ? ' Sign Up' : ' Sign In',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorDark,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
