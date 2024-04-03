import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:lucky_8/csdcawea/luc_home_uuu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'luc_rules_uuu.dart';

late final SharedPreferences lucPrefsUuu;
bool firstTime = lucPrefsUuu.getBool('firstTime') ?? true;

class LucSplashUuu extends StatefulWidget {
  const LucSplashUuu({super.key});

  @override
  State<LucSplashUuu> createState() => _LucSplashUuuState();
}

class _LucSplashUuuState extends State<LucSplashUuu> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      lucPrefsUuu = await SharedPreferences.getInstance();
      if (firstTime) {
        lucPrefsUuu.setBool('firstTime', false);
      }

      Flame.device.fullScreen();
      Flame.device.setPortrait();
      Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => lucRulesNotifierUuu.value ? const LucHomeUuu() : const LucRulesUuu(),
          ),
        );
      });
    });
    super.initState();
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/luc_l8_uuu.png',
              width: 65,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
