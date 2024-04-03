import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:lucky_8/csdcawea/luc_settings_uuu.dart';


class LucGameCubitUuu extends Cubit<LucGameStateUuu> {
  static const _initialFruitsCount = 25;
  static int _fruitsCount = _initialFruitsCount;

  final int level;
  LucGameCubitUuu(this.level)
      : super(
          LucGameStateUuu(
            tasks: _generateTasks(level),
            currentTask: 0,
            fruits: _generateFruits(level),
            lives: 3,
          ),
        );

  static List<GameFruit> _generateFruits(int level) {
    final length = switch (level) {
      1 || 2 => 6 * 4,
      3 || 4 || 5 => 6 * 5,
      6 || 7 || 8 => 6 * 6,
      _ => 6 * 7,
    };
    final fruits = <GameFruit>[];
    for (var i = 0; i < length; i++) {
      final random = Random().nextDouble();
      fruits.add(GameFruit(
        index: _getRandomFruit(),
        isVisible: random < 0.2,
      ));
    }
    return fruits;
  }

  static List<BlockTask> _generateTasks(int level) {
    _fruitsCount = _initialFruitsCount - 10 + level;
    final tasksLength = level + 2;
    final tasks = <BlockTask>[];
    for (var i = 0; i < tasksLength; i++) {
      tasks.add(
        BlockTask(
          taskFruits: _generateBlock(),
          isCompleted: false,
        ),
      );
    }
    return tasks;
  }

  static List<TaskFruit> _generateBlock() {
    final length = Random().nextDouble() < 0.8 ? 2 : 3;
    final tasksBlocks = <TaskFruit>[];
    for (var i = 0; i < length; i++) {
      tasksBlocks.add(
        TaskFruit(index: _getRandomFruit(), isPicked: false),
      );
    }
    return tasksBlocks;
  }

  static int _getRandomFruit() {
    //from 1 to 25
    return Random().nextInt(_fruitsCount) + 1;
  }

  bool isRegenerating = false;
  void regenerateFruits() async {
    if (isRegenerating) return;
    isRegenerating = true;
    if (lucMusicNotifierUuu.value) FlameAudio.play('luc_fruit_uuu.mp3');
    final fruit = [...state.fruits];
    for (var i = 0; i < fruit.length; i++) {
      fruit[i] = fruit[i].copyWith(isVisible: false);
    }
    emit(state.copyWith(fruits: fruit));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(fruits: _generateFruits(level)));
    await Future.delayed(const Duration(milliseconds: 300));
    isRegenerating = false;
  }

  void checkFruit(int index) {
    final currentTaskUnpickedFruits =
        state.tasks[state.currentTask].taskFruits.where((element) => element.isPicked == false).toList();
    final isCorrect = currentTaskUnpickedFruits.map((e) => e.index).contains(state.fruits[index].index);
    if (isCorrect) {
      if (lucMusicNotifierUuu.value) FlameAudio.play('luc_correct_uuu.mp3');
      //hiding picked fruit
      final fruits = [...state.fruits];
      fruits[index] = fruits[index].copyWith(isVisible: false);
      emit(state.copyWith(fruits: fruits));
      // manage task
      final newTasks = [...state.tasks];
      for (var i = 0; i < newTasks[state.currentTask].taskFruits.length; i++) {
        if (newTasks[state.currentTask].taskFruits[i].index == state.fruits[index].index &&
            !newTasks[state.currentTask].taskFruits[i].isPicked) {
          newTasks[state.currentTask].taskFruits[i] =
              newTasks[state.currentTask].taskFruits[i].copyWith(isPicked: true);
          break;
        }
      }
      emit(state.copyWith(tasks: newTasks));
      // check if task is completed
      if (newTasks[state.currentTask].taskFruits.every((element) => element.isPicked)) {
        emit(state.copyWith(currentTask: state.currentTask + 1));
      }
    } else {
      if (lucMusicNotifierUuu.value) FlameAudio.play('luc_wrong_uuu.mp3');
      emit(state.copyWith(lives: state.lives - 1));
    }
  }

  void regenerateTasks() {
    emit(state.copyWith(tasks: _generateTasks(level), currentTask: 0));
  }
}

class LucGameStateUuu {
  const LucGameStateUuu({
    required this.tasks,
    required this.currentTask,
    required this.fruits,
    required this.lives,
  });
  final List<BlockTask> tasks;
  final int currentTask;
  final List<GameFruit> fruits;
  final int lives;

  LucGameStateUuu copyWith({
    List<BlockTask>? tasks,
    int? currentTask,
    List<GameFruit>? fruits,
    int? lives,
  }) {
    return LucGameStateUuu(
      tasks: tasks ?? this.tasks,
      currentTask: currentTask ?? this.currentTask,
      fruits: fruits ?? this.fruits,
      lives: lives ?? this.lives,
    );
  }
}

class BlockTask {
  const BlockTask({
    required this.taskFruits,
    required this.isCompleted,
  });
  final List<TaskFruit> taskFruits;
  final bool isCompleted;
  BlockTask copyWith({
    List<TaskFruit>? taskFruits,
    bool? isCompleted,
  }) {
    return BlockTask(
      taskFruits: taskFruits ?? this.taskFruits,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TaskFruit {
  const TaskFruit({
    required this.index,
    required this.isPicked,
  });
  final int index;
  final bool isPicked;
  TaskFruit copyWith({
    int? index,
    bool? isPicked,
  }) {
    return TaskFruit(
      index: index ?? this.index,
      isPicked: isPicked ?? this.isPicked,
    );
  }
}

class GameFruit {
  const GameFruit({
    required this.index,
    required this.isVisible,
  });
  final int index;
  final bool isVisible;
  GameFruit copyWith({
    int? index,
    bool? isVisible,
  }) {
    return GameFruit(
      index: index ?? this.index,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
