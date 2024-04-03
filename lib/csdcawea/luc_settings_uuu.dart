import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucky_8/csdcawea/luc_splash_uuu.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'luc_rules_uuu.dart';

final lucMusicNotifierUuu = ValueNotifier<bool>(lucPrefsUuu.getBool('lucMusicNotifierUuu') ?? true);
void lucToggleMusicUuu() {
  lucMusicNotifierUuu.value = !lucMusicNotifierUuu.value;
  lucPrefsUuu.setBool('lucMusicNotifierUuu', lucMusicNotifierUuu.value);
}

final lucNotificationNotifierUuu = ValueNotifier<bool>(lucPrefsUuu.getBool('lucNotificationNotifierUuu') ?? false);
void lucToggleNotificationUuu() {
  lucNotificationNotifierUuu.value = !lucNotificationNotifierUuu.value;
  lucPrefsUuu.setBool('lucNotificationNotifierUuu', lucNotificationNotifierUuu.value);
}

class LucSettingsUuu extends StatelessWidget {
  const LucSettingsUuu({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              children: [
                const _LucAppBarUuu(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ValueListenableBuilder(
                      valueListenable: lucMusicNotifierUuu,
                      builder: (context, value, child) {
                        return LucButtonUuu(
                          onPressed: () {
                            lucToggleMusicUuu();
                          },
                          child: Text(
                            'Sound: ${value ? 'ON' : 'OFF'}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 16),
                LucButtonUuu(
                  onPressed: () {
                    launchUrl(Uri.parse(lucPrivacyUuu));
                  },
                  child: const Text(
                    'PRIVACY POLICY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LucButtonUuu(
                  onPressed: () {
                    launchUrl(Uri.parse(lucTermsUuu));
                  },
                  child: const Text(
                    'TERMS OF USE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LucButtonUuu(
                  onPressed: () {
                    final rateMyApp = RateMyApp(
                      minDays: 0,
                      minLaunches: 0,
                      remindDays: 0,
                      remindLaunches: 0,
                    )..init();
                    rateMyApp.showRateDialog(context);
                  },
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(23, 205, 129, 1),
                      Color.fromRGBO(84, 193, 253, 1),
                      Color.fromRGBO(30, 208, 197, 1),
                    ],
                  ),
                  child: const Text(
                    'RATE US',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LucButtonUuu(
                  onPressed: () {
                    Share.share('Try this app!');
                  },
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(23, 205, 129, 1),
                      Color.fromRGBO(84, 193, 253, 1),
                      Color.fromRGBO(30, 208, 197, 1),
                    ],
                  ),
                  child: const Text(
                    'SHARE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
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
        Opacity(
          opacity: 0,
          child: IgnorePointer(
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
        ),
      ],
    );
  }
}
