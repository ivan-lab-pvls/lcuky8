import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucky_8/csdcawea/luc_home_uuu.dart';
import 'package:lucky_8/csdcawea/luc_splash_uuu.dart';

final lucRulesNotifierUuu = ValueNotifier<bool>(lucPrefsUuu.getBool('lucRulesUuu') ?? false);
void lucSetRulesUuu() {
  lucPrefsUuu.setBool('lucRulesUuu', true);
  lucRulesNotifierUuu.value = true;
}

class LucRulesUuu extends StatelessWidget {
  const LucRulesUuu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.45,
              left: -size.width * 0.2,
              child: Image.asset(
                'assets/images/luc_girl_uuu.gif',
                width: size.width,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/luc_l8_uuu.png',
                        width: 80,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(
                        'assets/images/luc_rules_1_uuu.png',
                        width: double.infinity,
                      ),
                    ),
                    const Spacer(),
                    LucButtonUuu(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LucRules2Uuu(),
                          ),
                        );
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LucRules2Uuu extends StatelessWidget {
  const LucRules2Uuu({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.45,
              left: -size.width * 0.2,
              child: Image.asset(
                'assets/images/luc_girl_uuu.gif',
                width: size.width,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/luc_l8_uuu.png',
                        width: 80,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Image.asset(
                        'assets/images/luc_rules_2_uuu.png',
                        width: double.infinity,
                      ),
                    ),
                    const Spacer(),
                    LucButtonUuu(
                      onPressed: () {
                        lucSetRulesUuu();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LucHomeUuu(),
                          ),
                        );
                      },
                      child: const Text(
                        'START',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LucButtonUuu extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const LucButtonUuu({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width = double.infinity,
    this.height = 55,
    this.gradient = const LinearGradient(
      colors: [
        Color.fromRGBO(30, 157, 208, 1),
        Color.fromRGBO(115, 84, 253, 1),
        Color.fromRGBO(163, 23, 205, 1),
      ],
    ),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(22);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: onPressed == null ? const Color.fromRGBO(52, 29, 85, 1) : null,
        gradient: onPressed == null ? null : gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: onPressed == null ? 0.5 : 1,
          child: child,
        ),
      ),
    );
  }
}
