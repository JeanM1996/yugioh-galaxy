import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/tokens.dart';
import 'package:yugiohgalaxy/core/presentation/utils/image_paths.dart';
import 'package:yugiohgalaxy/core/presentation/utils/routes.dart';
import 'package:yugiohgalaxy/features/theme_notifier.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _initTheme);
  }

  dynamic _initTheme() async {
    await ref.read(themeProvider.notifier).initTheme();
    await Future.delayed(const Duration(seconds: 1));
    context.go(
      Routes.homeRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePaths.imgBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              colors.background.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    duration: const Duration(seconds: 1),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      imagePaths.imgLogo,
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ), //app name
                  TweenAnimationBuilder(
                    duration: const Duration(seconds: 1),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (context, double value, child) {
                      return Opacity(
                        opacity: value,
                        child: child,
                      );
                    },
                    child: //gradient text  native impl
                        CustomText(
                      'Yugioh Galaxy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textColor: colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              //CircularProgressIndicator
              TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                //resize the indicator
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
