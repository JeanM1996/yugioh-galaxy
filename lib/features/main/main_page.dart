import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/core/presentation/utils/network_watcher.dart';
import 'package:yugiohgalaxy/features/main/widgets/navbar_bottom/navbar_bottom_page.dart';

/// Esta page envuelve cualquier widget que se le envíe cómo [child]
/// dentro de el [CustomAppBar] y el [NavigationBarHibridoPage]
/// Se puede omitir alguno de ellos si la vista lo requiere
class MainPage extends ConsumerWidget {
  const MainPage({
    required this.child,
    required this.pageState,
    required this.pageTitle,
    this.showNavigationBar = true,
    this.showAppBar = true,
    this.showBackButton = false,
    this.actionButton = const SizedBox(),
    this.showConfirmBottomSheet = false,
    this.confirmationButton = const SizedBox(),
    this.customTitle,
    this.centerContent = true,
    this.title = '',
    this.content = '',
    this.backToRoute,
    this.onBackButtonPressed,
    super.key,
  });

  /// Vista actual
  final Widget child;
  final bool showNavigationBar;
  final String? backToRoute;
  final bool showAppBar;
  final String pageTitle;
  final int pageState;
  final bool showBackButton;
  final Widget actionButton;
  //a function with context param
  final bool showConfirmBottomSheet;
  final Widget confirmationButton;
  final String title;
  final String content;
  final Widget? customTitle;
  final bool centerContent;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityStatusProvider = ref.watch(connectivityStatusProviders);

    return Scaffold(
      extendBody: true,
      backgroundColor: colors.whiteGrey.withOpacity(1),
      appBar: showAppBar
          ? AppBar(
              backgroundColor: colors.yellow,
              centerTitle: centerContent,
              title: customTitle ??
                  CustomText(
                    pageTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    textColor: colors.darkOverlay,
                    fontFamily: 'Figtree',
                    letterSpacing: -0.5,
                  ),
              automaticallyImplyLeading: false,
              leading: showBackButton
                  ? IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                      // ignore: prefer-extracting-callbacks, required logic
                      onPressed: onBackButtonPressed ??
                          () {
                            if (backToRoute == null) {
                              GoRouter.of(context).pop();
                            } else {
                              context.go(backToRoute!);
                            }
                          },
                    )
                  : null,
              actions: [actionButton],
              surfaceTintColor: Colors.white,
              elevation: 4,
              shadowColor: colors.shadowWhite.withOpacity(.3),
            )
          : null,
      bottomNavigationBar: showNavigationBar
          ? connectivityStatusProvider == ConnectivityStatus.isConnected
              ? NavbarBottomPage(pageState: pageState)
              : Stack(
                  children: [
                    NavbarBottomPage(pageState: pageState),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                )
          : null,
      body: SafeArea(
        top: false,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  child,
                ],
              ),
              if (connectivityStatusProvider ==
                  ConnectivityStatus.isDisonnected)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            iconsPaths.iconNoInternet,
                            height: 40,
                            colorFilter: ColorFilter.mode(
                              colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            'Sin conexión a internet',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            textColor: colors.black,
                          ),
                        ],
                      ),
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
