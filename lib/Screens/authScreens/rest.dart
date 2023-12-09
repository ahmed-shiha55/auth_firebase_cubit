import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_firebasecubit/data/cubit/authCubit.dart';
import 'package:auth_firebasecubit/data/cubit/cubitState.dart';
import 'package:auth_firebasecubit/Screens/authScreens/signin.dart';
import 'package:auth_firebasecubit/Screens/authScreens/signup.dart';
import 'package:auth_firebasecubit/widget/custom_textformfiled.dart';

class Restpass extends StatelessWidget {
  const Restpass({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
 if (state is ResetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Check Your Email To Reset Your Password"),
                  backgroundColor: Colors.red,
                ),
              );
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Signin()) ,
                );
        } else if (state is ResetPasswordFailureState) {
        ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                  backgroundColor: Colors.red,
                ),
              );
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: authCubit.forgotPasswordFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                Text(
                  "Forget your password ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Lato",
                    color: const Color.fromARGB(255, 38, 78, 111),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Please enter the email address to reset password ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontFamily: "Lato",
                  ),
                ),
                CustomTextFormField(
                  suffixIcon: Icon(Icons.email),
                  labelText: "Email",
                  onChanged: (email) {
                    authCubit.emailAddress = email;
                  },
                ),
                     
                SizedBox(
                  height: 12,
                ),
                state is ResetPasswordLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 38, 78, 111),
                      ))
                    : MaterialButton(
                        onPressed: () async {
                          if (authCubit.forgotPasswordFormKey.currentState!.validate()) {
                            await authCubit.resetPasswordWithLink();
                          }
                        },
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        minWidth: double.infinity,
                        height: 24,
                        color: const Color.fromARGB(255, 38, 78, 111),
                        padding: EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      " Dont Have account ?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        "sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 38, 78, 111),
                        ),
                      ),
                    )
                  ],
                )
                        ],
                      ),
              ),
            ));
      },
    );
  }
}
