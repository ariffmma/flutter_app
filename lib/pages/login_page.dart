import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc.dart';
import 'package:flutter_app/models/login_request_model.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/utils/session_manager.dart';
import 'package:flutter_app/widgets/auth_button.dart';
import 'package:flutter_app/widgets/error_dialog.dart';
import 'package:flutter_app/widgets/login_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final paswordController = TextEditingController();
  bool isObscure = true;
  final sessionManager = SessionManager();

  void redirectToHomePage() {
    Navigator.pushReplacementNamed(context, MyRoute.home.name);
  }

  void checkLoginSession() async {
    final accessToken = await sessionManager.getAccessToken();
    if (accessToken.isNotEmpty) {
      redirectToHomePage();
    }
  }

  @override
  void initState() {
    checkLoginSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/login_image.svg',
                  height: 400,
                  semanticsLabel: 'Login Image',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 34),
                LoginTextfield(
                  labelText: 'Username',
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                LoginTextfield(
                  labelText: 'Password',
                  controller: paswordController,
                  keyboardType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  isObscure: isObscure,
                  hasSuffix: true,
                  onSuffixPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                const SizedBox(height: 34),
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      // navigate to homepage
                      Navigator.pushReplacementNamed(
                        context,
                        MyRoute.home.name,
                      );
                    } else if (state is LoginFailed) {
                      showDialog(
                        context: context,
                        builder: (_) => ErrorDialog(),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return CircularProgressIndicator();
                    }
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: AuthButton(
                        labelText: 'Login',
                        onPressed: () {
                          final requestBody = LoginRequestModel(
                            username: usernameController.text,
                            password: paswordController.text,
                            expiresInMins: 30,
                          );
                          context.read<LoginBloc>().add(Login(requestBody));
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Don\'t have an account ?',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    paswordController.dispose();
    super.dispose();
  }
}
