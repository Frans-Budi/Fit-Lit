import 'package:fit_lit/common/extension/double_extention.dart';
import 'package:fit_lit/common/utils/app_sizes.dart';
import 'package:fit_lit/common/utils/text_styles.dart';
import 'package:fit_lit/feature/games/models/game_model.dart';
import 'package:fit_lit/feature/games/widgets/custom_circular_percent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliverGames extends StatelessWidget {
  final Function(GameModel game) onTap;
  final RxList<GameModel> games;
  final Widget Function(int index) imageBuilder;

  const CustomSliverGames({
    super.key,
    required this.onTap,
    required this.games,
    required this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.s200),
          child: const Center(child: Text('Tidak Ada Permainan')),
        ),
      );
    }
    return SliverPadding(
      padding: EdgeInsets.only(
        left: AppSizes.s24,
        right: AppSizes.s24,
        top: AppSizes.s24,
        bottom: AppSizes.s50,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: AppSizes.s24,
          crossAxisSpacing: AppSizes.s24,
          childAspectRatio: 0.72, // Aspect ratio of grid items
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: games.length,
          (context, index) {
            return GestureDetector(
              onTap: () => onTap(games[index]),
              child: Hero(
                tag: 'container-${games[index].gameDetailId}',
                child: Material(
                  color: Colors.transparent,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: games[index].backgroundColor,
                      borderRadius: BorderRadius.circular(AppSizes.s24),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(AppSizes.s8),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(153, 255, 255, 255),
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.s24),
                                ),
                              ),
                              imageBuilder(index),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSizes.s15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  games[index].title,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: TextStyles.titleCard(
                                    color: games[index].foregroundColor,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              Obx(
                                () => CustomCircularPercent(
                                  foregroundColor: games[index].foregroundColor,
                                  percent: games[index].percent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSizes.s12.toVerticalSpace(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
