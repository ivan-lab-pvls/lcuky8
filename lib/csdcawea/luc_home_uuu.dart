import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucky_8/zxzwedcwed/luc_game_uuu.dart';
import 'package:lucky_8/csdcawea/luc_levels_uuu.dart';

import 'luc_rules_uuu.dart';
import 'luc_settings_uuu.dart';

class LucHomeUuu extends StatelessWidget {
  const LucHomeUuu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/luc_home_bg_uuu.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: topPadding),
            const _LucAppBarUuu(),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LucGameUuu(
                      level: 10,
                      isInfinite: true,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset('assets/images/luc_infinite_uuu.png', width: double.infinity),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LucLevelsUuu(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset('assets/images/luc_level_uuu.png', width: double.infinity),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -size.width * 0.2,
                    child: Image.asset('assets/images/luc_girl_uuu.gif', width: size.width),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LucAppBarUuu extends StatelessWidget {
  const _LucAppBarUuu();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LucSettingsUuu(),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/luc_ellipse_uuu.png', width: 50),
                const Icon(Icons.settings, color: Colors.white, size: 25),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/luc_l8_uuu.png',
                width: 80,
              ),
            ),
          ),
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
    );
  }
}
