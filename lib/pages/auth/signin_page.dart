import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/home/home_page.dart';
import 'package:flutter_app_3/pages/providers/auth_providers.dart';
import 'package:flutter_app_3/pages/widget/loading_button.dart';
import 'package:flutter_app_3/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController usernameController =
      TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          username: usernameController.text,
          password: passwordController.text)) {
        Navigator.pushNamed(context, '/main-page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: primaryColor,
            content: Text('GAGAL!', textAlign: TextAlign.center)));

        setState(() {
          isLoading = false;
        });

      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 129,
              ),
              Center(
                  child: Text(
                'Masuk',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0E2392),
                )),
              )),
              SizedBox(
                height: 85,
              ),
              Text(
                'Username',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Tulis username Anda'),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Password',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                )),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 43,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Tulis kata sandi Anda'),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Lupa Password?',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff0E2392)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed:
                      // () {
                      //   //TODO FORGOT PASSWORD SCREEN GOES HERE
                      // },
                      // Nyalain atas, atau bawah (salah satu)
                      handleLogin,
                  child: Text('Forgot Password',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color(0xff0E2392), fontSize: 12),
                      )),
                ),
              ),
              InkWell(
                onTap:
                    // () {
                    //   Navigator.pushNamed(context, '/main-page');
                    // },
                    handleLogin,
                child: isLoading? const LoadingButton():
                Container(
                  alignment: Alignment.center,
                  height: 56,
                  width: 363,
                  decoration: BoxDecoration(
                      color: Color(0xff0E2392),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Text('New User? Create Account')
            ],
          ),
        ));
  }
}
