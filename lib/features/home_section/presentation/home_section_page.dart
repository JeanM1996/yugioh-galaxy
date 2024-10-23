import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/core/presentation/utils/image_paths.dart';

class HomeSectionPage extends ConsumerStatefulWidget {
  const HomeSectionPage({super.key});

  @override
  ConsumerState<HomeSectionPage> createState() => _HomeSectionPageState();
}

class _HomeSectionPageState extends ConsumerState<HomeSectionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getView(context);
  }

  //ignore: long-method, required this logic
  Widget _getView(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Stack(
        children: [
          Semantics(
            label: 'home_page',
            //Welcome to Y
            child: Container(
              height: context.height(.99) + 500,
              width: context.width(1),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePaths.imgBackground),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    colors.black.withOpacity(.5),
                    BlendMode.srcATop,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconsPaths.iconYugiohGalaxy,
                    colorFilter: ColorFilter.mode(
                      colors.yellow,
                      BlendMode.srcATop,
                    ),
                    height: 200,
                  ),
                  SizedBox(height: context.height(.4)),
                  CustomText(
                    'Bienvenido Duelista a',
                    fontSize: 20,
                    textColor: colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    'Yugi-oh Galaxy',
                    fontSize: 20,
                    textColor: colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
