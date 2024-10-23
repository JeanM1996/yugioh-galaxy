import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/circular_progress.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/tokens.dart';
import 'package:yugiohgalaxy/core/presentation/utils/dimens_extension.dart';
import 'package:yugiohgalaxy/core/presentation/utils/icons_paths.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/card_detail/card_detail_controller.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/card_detail/widgets/label_value_widget.dart';

//CardDetailPage: class to show the card detail page
class CardDetailPage extends ConsumerStatefulWidget {
  const CardDetailPage(this.information, {super.key});
  final Map information;
  @override
  ConsumerState<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends ConsumerState<CardDetailPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, _initData);
    super.initState();
  }

  // ignore: long-method, logic required for messages
  Future<void> _initData() async {
    const bool = true;

    if (bool) {
      final controller = ref.watch(cardDetailController.notifier);
      controller.setLoading(true);
      await controller.getCardById(widget.information['id']);
      controller.setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cardDetailController);
    final controller = ref.watch(cardDetailController.notifier);

    return Flexible(
      fit: FlexFit.tight,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: state.isLoading
                ? const CircularProgress()
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colors.yellow.withOpacity(.2),
                        ),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        padding: context.all(.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!state.showOriginalCard)
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: colors.paper.withOpacity(.999),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colors.black.withOpacity(.4),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: context.width(.9),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: colors.paper
                                                  .withOpacity(.999),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: colors.black
                                                      .withOpacity(.4),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5),
                                                ),
                                              ],
                                            ),
                                            child: CustomText(
                                              state.card.name,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w800,
                                              textColor: colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Image center
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: colors.shadowBlack
                                                  .withOpacity(.999),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: colors.black
                                                      .withOpacity(.4),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5),
                                                ),
                                              ],
                                            ),
                                            child: Image.network(
                                              state.card.cardImages[0]
                                                  .imageUrlCropped,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            'Made with Flutter - JPM',
                                            textColor: colors.black,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomText(
                                            state.card.id.toString(),
                                            textColor: colors.black,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: context.width(.9),
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color:
                                                  colors.paper.withOpacity(.2),
                                              border: Border.all(
                                                color: colors.wine,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                CustomText(
                                                  state.card.desc,
                                                  textAlign: TextAlign.justify,
                                                  fontWeight: FontWeight.w400,
                                                  textColor: colors.black,
                                                  fontSize: 12,
                                                ),
                                                //line
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: context.height(.02),
                                                    bottom: context.height(.02),
                                                  ),
                                                  height: 1,
                                                  color: colors.black,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: CustomText(
                                                              'ATK/${state.card.atk}',
                                                              textColor:
                                                                  colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: CustomText(
                                                              'DEF/${state.card.def}',
                                                              textColor:
                                                                  colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            if (state.showOriginalCard)
                              Column(
                                children: [
                                  Image.network(
                                    state.card.cardImages[0].imageUrl,
                                  ),
                                ],
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller.showOriginalCard(
                                      !state.showOriginalCard,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          !state.showOriginalCard
                                              ? 'Ver carta original'
                                              : 'Ver carta hecha con Flutter',
                                          textColor: colors.black,
                                          fontSize: 12,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          iconsPaths.iconReload,
                                          colorFilter: ColorFilter.mode(
                                            colors.black,
                                            BlendMode.srcIn,
                                          ),
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: context.height(.02),
                                bottom: context.height(.02),
                              ),
                              height: .09,
                              color: colors.white,
                            ),
                            //List of prioces
                            CustomText(
                              'Sets:',
                              fontWeight: FontWeight.bold,
                              textColor: colors.black,
                            ),
                            SizedBox(
                              height: context.height(.02),
                            ),
                            Column(
                              children: state.card.cardSets
                                  .map(
                                    (e) => Column(
                                      children: [
                                        LabelValueWidget(
                                          label: 'Nombre: ',
                                          value: e.setName,
                                        ),
                                        LabelValueWidget(
                                          label: 'Raridad: ',
                                          value: e.setRarity,
                                        ),
                                        LabelValueWidget(
                                          label: 'Precio: ',
                                          value: e.setPrice,
                                        ),
                                        SizedBox(
                                          height: context.height(.02),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
