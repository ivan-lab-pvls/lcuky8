import 'package:flutter/material.dart';
import 'package:lucky_8/csdcawea/luc_rules_uuu.dart';

import '../zxzwedcwed/luc_game_uuu.dart';
import 'luc_splash_uuu.dart';

final lucMaxLevelNotifierUuu = ValueNotifier<int>(lucPrefsUuu.getInt('lucMaxLevelUuu') ?? 1);
void lucIncrementMaxLevelUuu() {
  if (lucMaxLevelNotifierUuu.value == 10) return;
  lucPrefsUuu.setInt('lucMaxLevelUuu', lucMaxLevelNotifierUuu.value + 1);
  lucMaxLevelNotifierUuu.value = lucMaxLevelNotifierUuu.value + 1;
}

class LucLevelsUuu extends StatefulWidget {
  const LucLevelsUuu({super.key});

  @override
  State<LucLevelsUuu> createState() => _LucLevelsUuuState();
}

class _LucLevelsUuuState extends State<LucLevelsUuu> {
  int currentLevel = lucMaxLevelNotifierUuu.value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/luc_splash_uuu.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                const _LucAppBarUuu(),
                const SizedBox(height: 30),
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
                  child: Text(currentLevel.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      )),
                ),
                const SizedBox(height: 30),
                LucButtonUuu(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LucGameUuu(level: currentLevel),
                      ),
                    );
                  },
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(23, 205, 129, 1),
                      Color.fromRGBO(84, 193, 253, 1),
                      Color.fromRGBO(30, 208, 197, 1),
                    ],
                  ),
                  child: const Text(
                    'PLAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: LucButtonUuu(
                        onPressed: currentLevel == 1
                            ? null
                            : () {
                                setState(() => currentLevel--);
                              },
                        child: const Text(
                          'Previous',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: lucMaxLevelNotifierUuu,
                          builder: (context, value, _) {
                            return LucButtonUuu(
                              onPressed: currentLevel == value
                                  ? null
                                  : () {
                                      setState(() => currentLevel++);
                                    },
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LucAppBarUuu extends StatelessWidget {
  const _LucAppBarUuu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Expanded(
            child: Center(
          child: Text(
            'LEVELS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/luc_ellipse_uuu.png', width: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LucRulesUuu(),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/luc_ellipse_uuu.png', width: 50),
                    const Text(
                      '?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
