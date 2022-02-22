import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestivity/src/login/controller/login_controller.dart';
import 'package:gestivity/src/task/ui/new_task.dart';
import 'package:gestivity/src/utils/app_colors.dart';
import 'package:provider/provider.dart';

class MyTask extends StatelessWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Text(
          'Mis Tareas',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const NewTask(),
                )),
            icon: const Icon(
              Icons.add_circle_outline_outlined,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              'Hola ${bloc.ctrlUsuario.text}, aqui podras encontrar tus tareas.',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
