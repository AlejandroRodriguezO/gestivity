import 'package:flutter/material.dart';
import 'package:gestivity/src/login/controller/login_controller.dart';
import 'package:gestivity/src/task/ui/my_task.dart';
import 'package:gestivity/src/utils/app_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final bloc = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: const BoxDecoration(
            color: AppColors.primayColors,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(70),
            ),
          ),
          child: ListTile(
            leading: Image.asset(
              'assets/${bloc.numAvatar}.png',
            ),
            title: Text(
              bloc.ctrlUsuario.text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Tienes 22 tareas pendientes',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(120),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GroupsTask(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyTask(),
                  )),
              icon: 'assets/time.png',
              title: 'Tareas',
              subtitle: '22 tareas ahora',
              color: AppColors.taskColor,
            ),
            GroupsTask(
              onTap: () {},
              icon: 'assets/group.png',
              title: 'Grupos',
              subtitle: '13 tareas ahora',
              color: AppColors.grupsColor,
            ),
            GroupsTask(
              onTap: () {},
              icon: 'assets/check.png',
              title: 'Terminado',
              subtitle: '5 tareas ahora',
              color: AppColors.terminateColor,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupsTask extends StatelessWidget {
  const GroupsTask({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              color: Colors.white,
              width: 35,
            ),
          ),
          Text(
            title,
            textScaleFactor: 0.8,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textScaleFactor: 0.8,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
