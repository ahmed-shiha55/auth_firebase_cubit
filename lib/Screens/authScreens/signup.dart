import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_firebasecubit/data/cubit/authCubit.dart';
import 'package:auth_firebasecubit/data/cubit/cubitState.dart';
import 'package:auth_firebasecubit/Screens/authScreens/signin.dart';
import 'package:auth_firebasecubit/widget/custom_textformfiled.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Success please verfiy your Email"),
              backgroundColor: const Color.fromARGB(255, 25, 8, 6),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Signin()),
          );
        } else if (state is SignupFailureState) {
          // showToast(state.errMessage);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: const Color.fromARGB(255, 25, 8, 6),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome ",
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
                      "Sign up your account !",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontFamily: "Lato",
                      ),
                    ),
                    Form(
                      key: authCubit.signupFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            labelText: "First Name",
                            onChanged: (firstname) {
                              authCubit.fristName = firstname;
                            },
                          ),
                          CustomTextFormField(
                            labelText: "Last Name",
                            onChanged: (lastname) {
                              authCubit.lastName = lastname;
                            },
                          ),
                          CustomTextFormField(
                            suffixIcon: Icon(Icons.email),
                            labelText: "Email",
                            onChanged: (email) {
                              authCubit.emailAddress = email;
                            },
                          ),
                          CustomTextFormField(
                            obscureText: authCubit.obscurePasswordTextValue,
                            suffixIcon: IconButton(
                              icon: Icon(
                                authCubit.obscurePasswordTextValue!
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ),
                              onPressed: () {
                                authCubit.obscurePasswordText();
                              },
                            ),
                            labelText: "Password",
                            onChanged: (password) {
                              authCubit.password = password;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          state is SignupLoadingState
                              ? CircularProgressIndicator(
                                  color: const Color.fromARGB(255, 38, 78, 111),
                                )
                              : MaterialButton(
                                  onPressed: () async {
                                    if (authCubit.signupFormKey.currentState!
                                        .validate()) {
                                      await authCubit
                                          .signUpWithEmailAndPassword();
                                    }
                                  },
                                  child: Text(
                                    'Sign up',
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Text(
                                "Have an account ?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signin()),
                                  );
                                },
                                child: Text(
                                  "sign in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromARGB(255, 38, 78, 111),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // SizedBox(
                          //   height: 12,
                          // ),
                          // state is GoogleLoadingState
                          //     ? Center(
                          //         child: CircularProgressIndicator(),
                          //       )
                          //     : IconButton(
                          //         onPressed: () async {
                          //           print("object");
                          //          await authCubit.signInWithGoogle();
                          //         },
                          //         icon: Icon(Icons.face))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
