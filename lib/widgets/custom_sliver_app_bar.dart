import 'package:flutter/material.dart';

import '../my_app_exports.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Function()? castOnTap;
  final Function()? notificationOnTap;
  final Function()? searchOnTap;
  final Function()? explorerOnTap;
  final Function()? suggestionOnTap;

  CustomSliverAppBar(
      {super.key,
      this.castOnTap,
      this.notificationOnTap,
      this.searchOnTap,
      this.explorerOnTap,
      this.suggestionOnTap});

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: AppColors.black,
      leadingWidth: size.width * 0.30,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Image.asset(AppImages.youtubeLogoDark),
      ),
      actions: [
        CommonIconButton(
          onTap: castOnTap,
          icon: Icons.cast,
        ),
        CommonIconButton(
          onTap: notificationOnTap,
          icon: Icons.notifications_none,
        ),
        CommonIconButton(
          onTap: searchOnTap,
          icon: Icons.search,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: size * 0.05,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // app drawer icon
              GestureDetector(
                onTap: explorerOnTap,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.appPadding10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(
                      AppDimens.appRadius10,
                    ),
                  ),
                  child: const Icon(
                    Icons.explore_outlined,
                  ),
                ),
              ),

              const SizedBox(
                width: 10,
              ),
              // topic suggestion container
              SizedBox(
                height: 40,
                width: size.width - size.width * 0.18,
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SuggestionCard(
                      text: 'Movies',
                      onTap: suggestionOnTap,
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
