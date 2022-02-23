import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestivity/src/global/widgets/text_input.dart';
import 'package:gestivity/src/home/ui/home_page.dart';
import 'package:gestivity/src/login/controller/login_controller.dart';
import 'package:gestivity/src/register/ui/register_page.dart';
import 'package:gestivity/src/utils/app_colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginProvider>(context);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ListView(
          children: [
            Image.asset('assets/logo.png'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.primayColors,
                borderRadius: BorderRadius.circular(70),
              ),
              child: Column(
                children: [
                  // Consumer<LoginProvider>(
                  //   builder: (context, bloc, child) => GestureDetector(
                  //     onTap: () {
                  //       if (bloc.numAvatar == 8) {
                  //         bloc.numAvatar = 1;
                  //       } else {
                  //         bloc.numAvatar++;
                  //       }
                  //     },
                  //     child: Image.asset(
                  //       'assets/${bloc.numAvatar}.png',
                  //       width: 120,
                  //     ),
                  //   ),
                  // ),
                  TextInput(
                    controller: loginController.ctrlUsuario,
                    label: 'Usuario',
                    icon: Icons.person_outline,
                  ),
                  TextInput(
                    controller: loginController.ctrlPassword,
                    label: 'Contraseña',
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => loginController.login(context),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                    ),
                    child: const Text('Iniciar Sesión'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'o',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const RegisterPage(),
                        )),
                    child: const Text(
                      'Registrate',
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
