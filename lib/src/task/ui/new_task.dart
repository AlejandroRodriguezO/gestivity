import 'package:flutter/material.dart';
import 'package:gestivity/src/model/task_model.dart';
import 'package:gestivity/src/task/controller/task_controller.dart';
import 'package:gestivity/src/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TaskController>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            decoration: const BoxDecoration(
              color: AppColors.terminateColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  title: Text(
                    'Nueva tarea',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    'Creando nueva tarea',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Inserte aqui el titulo',
                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Inserte aqui la informacion adicional',
                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Ingrese la fecha',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Recordatorio',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Categoria',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<TaskController>(
            builder: (context, value, child) => Wrap(
              children: List.generate(
                1 + bloc.category.length,
                (index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            title: Text(
                              'Agregar Categoria',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                  controller: bloc.ctrlCategory,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre',
                                    labelStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Color',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Consumer<TaskController>(
                                  builder: (context, value, _) {
                                    return Row(
                                      children: List.generate(
                                        10,
                                        (index) => GestureDetector(
                                          onTap: () => value.numColor = index,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            width: value.numColor == index
                                                ? 20
                                                : 15,
                                            height: value.numColor == index
                                                ? 20
                                                : 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.primaries[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  bloc.ctrlCategory.clear();
                                  bloc.numColor = 0;
                                },
                                child: Text(
                                  'Cancelar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => bloc.submit(context),
                                child: Text(
                                  'Aceptar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text('Agregar cateogoria'),
                      ),
                    );
                  } else {
                    CategoryModel category = bloc.category[index - 1];
                    return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.primaries[category.color],
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        category.title,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: size.width,
            height: kToolbarHeight,
            decoration: const BoxDecoration(
              color: AppColors.primayColors,
            ),
            child: Center(
              child: Text(
                'Guardar',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
