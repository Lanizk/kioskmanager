import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kiosk_app/common/widgets/auth_text_field.dart';
import 'package:kiosk_app/common/widgets/primary_button.dart';
import 'package:kiosk_app/theme/pallete.dart';
import 'package:kiosk_app/theme/theme_notifier.dart';
import 'package:kiosk_app/feature/auth/controller/authcontroller.dart';


class LoginScreen extends ConsumerStatefulWidget{

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen>  createState()=> _LoginScreenState();
}

class  _LoginScreenState extends ConsumerState<LoginScreen>{

  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login(){
    ref.read(authControllerProvider.notifier).signInWithEmail(
        emailController.text.trim(),
        passwordController.text.trim());
  }

  void _loginWithGoogle(){
    ref.read(authControllerProvider.notifier).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(authControllerProvider)
        .isLoading;

    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(AppSpacing.lg),
      child: Center(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Welcome Back",
              style: AppTypography.h1.copyWith(
                color: Colors.black,
              ),
            textAlign: TextAlign.center,),

            const SizedBox(height: AppSpacing.xl),

            AuthTextField(
                controller: emailController,
                hintText: 'Email Address'),

            AuthTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,),

            const SizedBox(height: AppSpacing.lg),

            PrimaryButton(
              text: isLoading ? "Loading..." : "Login",
              onPressed: isLoading ? () {} : _login,
            ),

            const SizedBox(height: AppSpacing.md),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Don't have an account? Register"),
            ),

            const SizedBox(height: AppSpacing.lg),

            PrimaryButton(
              text: "Continue with Google",
              onPressed: _loginWithGoogle,
            ),

          ],),
        ),
      ),),
    );
  }
}