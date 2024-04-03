import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucky_8/zxzwedcwed/luc_game_cubit_uuu.dart';
import 'package:lucky_8/zxzwedcwed/luc_tasks_uuu.dart';
import 'package:lucky_8/csdcawea/luc_levels_uuu.dart';
import 'package:lucky_8/csdcawea/luc_rules_uuu.dart';

class _LucAppBarUuu extends StatelessWidget {
  const _LucAppBarUuu();

  @override
  Widget build(BuildContext context) {
    final lives = context.select((LucGameCubitUuu cubit) => cubit.state.lives);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/luc_ellipse_uuu.png', width: 50),
                const Icon(Icons.arrow_back, color: Colors.white, size: 25),
              ],
            ),
          ),
          const Spacer(),
          _LucHeartUuu(lives >= 1),
          const SizedBox(width: 4),
          _LucHeartUuu(lives >= 2),
          const SizedBox(width: 4),
          _LucHeartUuu(lives >= 3),
        ],
      ),
    );
  }
}

class _LucHeartUuu extends StatelessWidget {
  const _LucHeartUuu(this.isFilled);

  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isFilled ? 'assets/images/luc_heart_uuu.png' : 'assets/images/luc_heart_empty_uuu.png',
      width: 40,
    );
  }
}

class _LucWinDialogUuu extends StatelessWidget {
  const _LucWinDialogUuu(this.level);
  final int level;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 222,
            width: 222,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(211, 71, 248, 0.2),
              border: Border.all(
                color: const Color.fromRGBO(211, 71, 248, 1),
                width: 3,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(level.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    )),
                const Text(
                  'LEVEL DONE!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LucButtonUuu(
              onPressed: () {
                lucIncrementMaxLevelUuu();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(23, 205, 129, 1),
                  Color.fromRGBO(84, 193, 253, 1),
                  Color.fromRGBO(30, 208, 197, 1),
                ],
              ),
              child: const Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: LucButtonUuu(
              onPressed: () {
                lucIncrementMaxLevelUuu();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.asset('assets/images/luc_girl_uuu.gif', width: double.infinity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LucLoseDialogUuu extends StatelessWidget {
  const _LucLoseDialogUuu(this.level);
  final int level;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 222,
            width: 222,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(211, 71, 248, 0.2),
              border: Border.all(
                color: const Color.fromRGBO(211, 71, 248, 1),
                width: 3,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(level.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    )),
                const Text(
                  'LEVEL FAILED!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LucButtonUuu(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(23, 205, 129, 1),
                  Color.fromRGBO(84, 193, 253, 1),
                  Color.fromRGBO(30, 208, 197, 1),
                ],
              ),
              child: const Text(
                'TRY AGAIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: LucButtonUuu(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Image.asset('assets/images/luc_girl_uuu.gif', width: double.infinity),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LucGameUuu extends StatelessWidget {
  const LucGameUuu({super.key, required this.level, this.isInfinite = false});

  final int level;
  final bool isInfinite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LucGameCubitUuu(level),
      child: MultiBlocListener(
        listeners: [
          BlocListener<LucGameCubitUuu, LucGameStateUuu>(
            listenWhen: (previous, current) {
              return current.currentTask >= current.tasks.length;
            },
            listener: (context, state) {
              if (isInfinite) {
                context.read<LucGameCubitUuu>().regenerateTasks();
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  useSafeArea: false,
                  barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
                  builder: (context) => _LucWinDialogUuu(level),
                );
              }
            },
          ),
          BlocListener<LucGameCubitUuu, LucGameStateUuu>(
            listenWhen: (previous, current) => current.lives == 0,
            listener: (context, state) {
              showDialog(
                context: context,
                useSafeArea: false,
                barrierColor: const Color.fromRGBO(0, 0, 0, 0.6),
                barrierDismissible: false,
                builder: (context) => _LucLoseDialogUuu(level),
              );
            },
          ),
        ],
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/luc_splash_uuu.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                const _LucAppBarUuu(),
                LucTasksUuu(
                  isInfinite: isInfinite,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, .5),
                  ),
                ),
                const SizedBox(height: 8),
                _LucGameBoardUuu(level: level),
                const _LucBottomUuu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LucBottomUuu extends StatelessWidget {
  const _LucBottomUuu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            bottom: -size.width * 0.3,
            child: Image.asset(
              'assets/images/luc_girl_uuu.gif',
              width: size.width / 2,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: size.width / 2,
            child: GestureDetector(
              onTap: () {
                context.read<LucGameCubitUuu>().regenerateFruits();
              },
              child: Image.asset(
                'assets/images/luc_chest_uuu.png',
                height: size.width * 0.35,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LucGameBoardUuu extends StatelessWidget {
  const _LucGameBoardUuu({
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16).copyWith(bottom: 0),
      shrinkWrap: true,
      itemCount: context.select((LucGameCubitUuu cubit) => cubit.state.fruits.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        return LucGameItemUuu(
          index: index,
        );
      },
    );
  }
}

class LucGameItemUuu extends StatelessWidget {
  const LucGameItemUuu({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final fruit = context.select((LucGameCubitUuu cubit) => cubit.state.fruits[index]);
    return GestureDetector(
      onTap: () {
        if (!fruit.isVisible) return;
        context.read<LucGameCubitUuu>().checkFruit(index);
      },
      child: GameItemsBorders(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: fruit.isVisible ? 1 : 0,
          child: Image.asset('assets/images/f/f${fruit.index}.png'),
        ),
      ),
    );
  }
}

class GameItemsBorders extends StatelessWidget {
  const GameItemsBorders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const List<Color> gradientColors = [
      Colors.transparent,
      Color.fromRGBO(221, 71, 248, 1),
      Color.fromRGBO(221, 71, 248, 1),
      Colors.transparent,
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, .5),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: child,
          ),
          // left
          const Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            width: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors,
                ),
              ),
            ),
          ),
          // right
          const Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            width: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors,
                ),
              ),
            ),
          ),
          // top
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradientColors,
                ),
              ),
            ),
          ),
          // bottom
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: gradientColors,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
