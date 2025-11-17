import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone_november_2025/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone_november_2025/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_november_2025/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone_november_2025/data/models/auth/create_user_req.dart';
import 'package:spotify_clone_november_2025/domain/usecases/auth/signup.dart';
import 'package:spotify_clone_november_2025/presentation/auth/pages/signin.dart';
import 'package:spotify_clone_november_2025/presentation/root/pages/root.dart';
import 'package:spotify_clone_november_2025/service_locator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              _registerText(),
              SizedBox(height: 50),
              _fullNameField(context),
              const SizedBox(height: 20),
              _emailField(context),
              const SizedBox(height: 20),
              _passwordField(context),
              const SizedBox(height: 20),
              BasicAppButton(
                onPressed: () async {
                  var result = await s1<SignUpUseCase>().call(
                    params: CreateUserReq(
                      fullName: _fullNameController.text.toString(),
                      email: _emailController.text.toString(),
                      password: _passwordController.text.toString(),
                    ),
                  );
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RootPage();
                          },
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                title: 'Create Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullNameController,
      decoration: InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do You Have An Account?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInPage(),
                ),
              );
            },
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
