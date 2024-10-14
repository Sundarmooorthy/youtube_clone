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
            SliverPadding(
              padding: EdgeInsets.only(bottom: size.height * 0.08),
              sliver: SliverToBoxAdapter(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final video = videos[index];
                    return VideoPreviewCard(
                      onTap: () {},
                      videoThumbNail: video.thumbnailUrl,
                      channelImage: video.author.profileImageUrl,
                      channelName: video.author.username,
                      postedTime: UtilsMethods().timeAgo(video.timestamp),
                      videoTitle: video.title,
                      videoTotalDuration: video.duration,
                      viewsCount: video.viewCount,
                      moreOnTap: () {
                        debugPrint('More Pressed');
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
