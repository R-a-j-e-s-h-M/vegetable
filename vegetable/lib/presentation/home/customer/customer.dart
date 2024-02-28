import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegetable/presentation/main_page/bottomnavbar/screenmainpage.dart';





class Customerform extends StatefulWidget {
  const Customerform({super.key});
                                                                                 
  @override
  State<Customerform> createState() => _CustomerformState();
}

enum Auth {
  signin,
  signup,
}

class _CustomerformState extends State<Customerform> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _email1Controller = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _name1Controller = TextEditingController();
  TextEditingController mobile1Controller = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController state1Controller = TextEditingController();
  TextEditingController district1Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? Colors.white
                      : const Color(0xffebecee),
                  title: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: const Color.fromRGBO(235, 207, 29, 1),
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _name1Controller,
                            hintText: 'Name',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _email1Controller,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _password1Controller,
                            hintText: 'password',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: mobile1Controller,
                            hintText: 'mobile',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: address1Controller,
                            hintText: 'address',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: state1Controller,
                            hintText: 'state',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: district1Controller,
                            hintText: 'district',
                          ),
                        
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sign Up',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? Colors.white
                      : const Color(0xffebecee),
                  title: const Text(
                    'Sign-In.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: Radio(
                    activeColor: const Color.fromRGBO(235, 207, 29, 1),
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _email1Controller,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _password1Controller,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sign In',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                  Navigator.of(context).push(PageTransition(
                              child:  ScreenMainpage(),
                              type: PageTransitionType.bottomToTopJoined,
                              childCurrent: Container()));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.orange : Colors.black,
        ),
      ),
    );
  }
}
