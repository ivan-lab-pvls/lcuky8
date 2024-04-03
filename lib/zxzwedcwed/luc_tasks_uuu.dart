import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_8/zxzwedcwed/luc_game_cubit_uuu.dart';

class LucTasksUuu extends StatefulWidget {
  const LucTasksUuu({
    super.key,
    required this.isInfinite,
  });
  final bool isInfinite;

  @override
  State<LucTasksUuu> createState() => _LucTasksUuuState();
}

class _LucTasksUuuState extends State<LucTasksUuu> {
  final controller = ScrollController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<LucGameCubitUuu>().state.tasks;
    return BlocListener<LucGameCubitUuu, LucGameStateUuu>(
      listenWhen: (previous, current) {
        return current.currentTask >= current.tasks.length;
      },
      listener: (context, state) {
        controller.animateTo(
          controller.position.minScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: SizedBox(
        height: 65,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return _LucTasksItemUuu(
              task: tasks[index],
              currentTask: context.read<LucGameCubitUuu>().state.currentTask,
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class _LucTasksItemUuu extends StatelessWidget {
  const _LucTasksItemUuu({
    required this.task,
    required this.currentTask,
    required this.index,
  });
  final BlockTask task;
  final int currentTask;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 0, .5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: currentTask > index ? const Color.fromRGBO(27, 253, 77, 0.8) : const Color.fromRGBO(221, 71, 248, 1),
        ),
      ),
      child: Row(
        children: List.generate(
          task.taskFruits.length,
          (index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == task.taskFruits.length - 1 ? 0 : 4,
                  ),
                  child: Image.asset(
                    'assets/images/f/f${task.taskFruits[index].index}.png',
                    width: 25,
                  ),
                ),
                const Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset('assets/images/luc_ellipse_2_uuu.png', width: 15),
                    if (task.taskFruits[index].isPicked)
                      Positioned(
                        top: -4,
                        right: 0,
                        child: Image.asset(
                          'assets/images/luc_check_uuu.png',
                          width: 15,
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
