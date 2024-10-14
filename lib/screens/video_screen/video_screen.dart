import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/my_app_exports.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final YoutubePlayerController _controller;
  late final PlayerState _playerState;
  late final YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'nPt8bK2gbaU',
      flags: const YoutubePlayerFlags(
        mute: false,
        controlsVisibleAtStart: true,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: CustomScrollView(
          // shrinkWrap: true,
          slivers: [
            SliverAppBar(
              expandedHeight: size.height * 0.61,
              //61
              snap: false,
              floating: false,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // youtube player widget
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: AppColors.white,
                    aspectRatio: 16 / 9,
                    width: double.infinity,
                    progressColors: const ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                      bufferedColor: Colors.grey,
                      backgroundColor: Colors.black12,
                    ),
                    onReady: () {
                      _controller.addListener(listener);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.appHPadding10,
                        vertical: AppDimens.appVPadding10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // video title
                        Text(
                          'Empathy ,Ecstasy,Enterprise | Shantanu Naidu | TEDxMithibaiCollege',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Gap(height: 3),
                        // views and posted time
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "130K views",
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Gap(width: 5),
                            const Text(
                              '1 year ago',
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                        Gap(height: 5),
                        // channel details with action
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            Gap(width: size.width * 0.040),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Sundaramoorthy Kuppuswamy",
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
                            ),
                            Gap(width: size.width * 0.015),
                            const Text(
                              "90.9K",
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                            Gap(width: size.width * 0.020),
                            CustomElevatedButton(
                              text: 'Subscribe',
                              onPressed: () {},
                            ),
                            Gap(width: size.width * 0.015),
                            // ElevatedButton(
                            //     onPressed: () {}, child: Text('Join')),
                          ],
                        ),
                        Gap(height: 5),
                        // horizontal scrolling actions
                        SizedBox(
                          height: size.height * 0.060,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10, // Specify the number of items
                            itemBuilder: (context, index) {
                              return Container(
                                // width: 150, // Set width for each item
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade900,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50))),
                                // color: Colors.blue[(index % 9 + 1) * 100],
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint('Hello tap');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimens.appHPadding16,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          size: size.height * 0.020,
                                        ),
                                        Gap(width: size.height * 0.010),
                                        const Text(
                                          'Download',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Gap(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppDimens.appRadius10),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.appHPadding10,
                            vertical: AppDimens.appVPadding10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Comments',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                  ),
                                  Gap(width: 3),
                                  Text(
                                    '90',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Colors.grey.shade500,
                                        ),
                                  ),
                                ],
                              ),
                              Gap(height: 3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      height: size.height * 0.028,
                                      width: size.height * 0.028,
                                      child: Image.network(
                                        'https://yt3.ggpht.com/ytc/AIdro_nQFOjj2baePBWQGqL0lgv7SwxZ1uXYo8pg_hViDZb6DEsX=s240-c-k-c0x00ffffff-no-rj',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Gap(width: 10),
                                  const Expanded(
                                    flex: 7,
                                    child: Text(
                                      AppStrings.dummyComment,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              Gap(height: 3),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
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
            )
          ],
        ),
      ),
    );
  }
}
