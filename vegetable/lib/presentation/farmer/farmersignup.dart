import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegetable/presentation/farmer/farmerauthservice.dart';
import 'package:vegetable/presentation/farmer/vegetabledetails.dart';

enum Auth {
  signin,
  signup,
}

// ignore: must_be_immutable
class Farmersignup extends StatefulWidget {
  const Farmersignup({super.key});

  @override
  State<Farmersignup> createState() => _FarmersignupState();
}

class _FarmersignupState extends State<Farmersignup> {

  
Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController villageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    stateController.dispose();
    districtController.dispose();
    placeController.dispose();
    villageController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      mobile: mobileController.text,
      address: addressController.text,
      state: stateController.text,
      district: districtController.text,
      place: placeController.text,
      village: villageController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
    Navigator.of(context).push(PageTransition(
        child: const Vegetabledetails(),
        type: PageTransitionType.rightToLeftWithFade,
        childCurrent: Container()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebecee),
      body: SingleChildScrollView(
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
                    activeColor:  Colors.black,
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
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'password',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: mobileController,
                            hintText: 'mobile',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: addressController,
                            hintText: 'address',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: stateController,
                            hintText: 'state',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: districtController,
                            hintText: 'district',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: placeController,
                            hintText: 'place',
                          ),
                           const SizedBox(height: 10),
                          CustomTextField(
                            controller: villageController,
                            hintText: 'village',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sign Up',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
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
                    activeColor: Colors.black,
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
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: 'Sign In',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
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
