import 'package:flutter/material.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/container_icon.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';

class InactiveRoute extends StatelessWidget {
  final String iconPath;
  const InactiveRoute({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.all(.05),
      child: Column(
        children: [
          Container(
            height: context.height(.75),
            padding: context.all(.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.whiteGrey.withOpacity(.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerIcon(
                        iconColor: colors.blue,
                        icon: iconPath,
                        color: colors.blue.withOpacity(.05),
                        size: 80),
                    const SizedBox(height: 20),
                    CustomText(
                      "Sin ruta activa",
                      textColor: colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Figtree",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      "Para más información comunícate con tu administrador.",
                      textColor: colors.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      height: 1.25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
