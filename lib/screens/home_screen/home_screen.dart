import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/common/common_widgets.dart';

import '../../my_app_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              suggestionOnTap: () {
                debugPrint("Suggestions");
              },
              explorerOnTap: () {
                Scaffold.of(context).openDrawer();
                debugPrint("Explorer");
              },
            ),
            SliverToBoxAdapter(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * 0.25,
                            color: Colors.white,
                          ),
                          Positioned(
                            right: size.height * 0.01,
                            bottom: size.height * 0.01,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 3),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade600,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: const Text(
                                '12:35:00',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: AppDimens.appHPadding10,
                            top: AppDimens.appVPadding10,
                            bottom: AppDimens.appVPadding10),
                        decoration: const BoxDecoration(
                          color: AppColors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              child: Image.network(
                                  height: size.height * 0.045,
                                  width: size.height * 0.045,
                                  fit: BoxFit.fill,
                                  'https://as2.ftcdn.net/v2/jpg/07/95/95/13/1000_F_795951374_QR1tADRPLjbh0NqrJqLPbzOTHJW5HjmY.jpg'),
                            ),
                            Gap(width: 15),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        'Google Coding Interview With normal Software Engineer',
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(height: 3),
                                  Wrap(
                                    children: [
                                      const Text(
                                        'Google Developers',
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      Gap(width: 5),
                                      const Text(
                                        '1.5M views',
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                      Gap(width: 5),
                                      const Text(
                                        '3 years ago',
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: CommonIconButton(
                                onTap: () {},
                                icon: Icons.more_vert_sharp,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
