import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_firebasecubit/data/cubit/authCubit.dart';
import 'package:auth_firebasecubit/data/cubit/cubitState.dart';
import 'package:auth_firebasecubit/Screens/authScreens/rest.dart';
import 'package:auth_firebasecubit/Screens/authScreens/Home.dart';
import 'package:auth_firebasecubit/widget/custom_textformfiled.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HomePage())) //customReplacementNavigate(context, "/homeNavBar")
              :
              //showToast("Please Verify Your Account");
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please Verify your email'),
                    backgroundColor: const Color.fromARGB(255, 25, 8, 6),
                  ),
                );
        } else if (state is SigninFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: const Color.fromARGB(255, 41, 10, 8),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                      key: authCubit.signinFormKey,
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Text(
                        "Welcome back ... ",
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
                "${authCubit.fristName }",
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
                  height: 12,
                ),
                state is SigninLoadingState
                    ? Center(
                      child: CircularProgressIndicator(
                          color:  Color.fromARGB(255, 38, 78, 111),
                    ))
                    : MaterialButton(
                        onPressed: () async {
                          if (authCubit.signinFormKey.currentState!.validate()) {
                            await authCubit.sigInWithEmailAndPassword();
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
              SizedBox(height: 12,),
              
             Row(
                              children: [
                                Expanded(child: Container()),
                                Text("Forget password ?",style: TextStyle(color: Colors.grey),),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Restpass()),
                                    );
                                  },
                                  child: Text("Reset",style: TextStyle(    fontWeight: FontWeight.bold, color:   const Color.fromARGB(255, 38, 78, 111),),),
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
