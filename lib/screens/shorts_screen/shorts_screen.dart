import 'package:flutter/material.dart';
import 'package:youtube_clone/my_app_exports.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  final PageController _pageController = PageController();

  List<String> images = [
    'https://as1.ftcdn.net/v2/jpg/07/63/71/86/1000_F_763718609_j3HL50AyQe2k8GwtdbfG3EdPZYhKtBmp.jpg',
    'https://as2.ftcdn.net/v2/jpg/10/05/76/35/1000_F_1005763507_J9K8jlQfduOmO5vz0d3sCNNbwoClX5iY.jpg',
    'https://as2.ftcdn.net/v2/jpg/10/05/76/47/1000_F_1005764795_dULOcEKJ81W0z7RNQIK7PhIqOlNalnv2.jpg',
    'https://as2.ftcdn.net/v2/jpg/10/05/74/91/1000_F_1005749143_F5baNTKBz9pXVlQ1C0HgzwkQr4YwhfVV.jpg',
    'https://as1.ftcdn.net/v2/jpg/10/05/74/70/1000_F_1005747051_CMZbGVP4fna9jM2HrtGrBG5bKwrBtaHy.jpg',
    'https://as2.ftcdn.net/v2/jpg/10/05/75/17/1000_F_1005751763_EYbDftzBEzRCqgBZSSQ6lZVl0sggD7Nu.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: images
                .map(
                  (e) => Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        e,
                        fit: BoxFit.fill,
                      ),
                      // action widgets
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonIconButton(
                            icon: Icons.thumb_up,
                            size: size.height * 0.045,
                            isLabel: true,
                            label: '9.8K',
                            onTap: () {},
                          ),
                          Gap(height: 10),
                          CommonIconButton(
                            icon: Icons.thumb_down,
                            size: size.height * 0.045,
                            isLabel: true,
                            label: 'Dislike',
                            onTap: () {},
                          ),
                          Gap(height: 10),
                          CommonIconButton(
                            icon: Icons.message,
                            size: size.height * 0.045,
                            isLabel: true,
                            label: '55',
                            onTap: () {},
                          ),
                          Gap(height: 10),
                          CommonIconButton(
                            icon: Icons.share,
                            size: size.height * 0.045,
                            isLabel: true,
                            label: 'Share',
                            onTap: () {},
                          ),
                          Gap(height: 10),
                          CommonIconButton(
                            icon: Icons.recycling_rounded,
                            size: size.height * 0.045,
                            isLabel: true,
                            label: '62K',
                            onTap: () {},
                          ),
                          Gap(height: 10),
                        ],
                      ),
                      // video details and info widget
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.appHPadding16,
                              vertical: AppDimens.appVPadding10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      height: size.height * 0.040,
                                      width: size.height * 0.040,
                                      child: Image.network(
                                        'https://yt3.ggpht.com/ytc/AIdro_nQFOjj2baePBWQGqL0lgv7SwxZ1uXYo8pg_hViDZb6DEsX=s240-c-k-c0x00ffffff-no-rj',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Gap(width: 5),
                                  Text(
                                    "@Raja-Rani-hef5v",
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Gap(width: 10),
                                  SizedBox(
                                    height: size.height * 0.050,
                                    child: CustomElevatedButton(
                                      backgroundColor: AppColors.white,
                                      foregroundColor: AppColors.black,
                                      text: 'Subscribe',
                                      onPressed: () {},
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                "Black background",
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Gap(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.music_note_outlined,
                                        // size: size.height * 0.020,
                                      ),
                                      Gap(width: size.height * 0.010),
                                      const Text(
                                        '0-100 Sidhu Moosewala',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(width: 10),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.appRadius10),
                                    child: SizedBox(
                                      height: size.height * 0.050,
                                      width: size.height * 0.050,
                                      child: Image.network(
                                        'https://yt3.ggpht.com/ytc/AIdro_nQFOjj2baePBWQGqL0lgv7SwxZ1uXYo8pg_hViDZb6DEsX=s240-c-k-c0x00ffffff-no-rj',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
