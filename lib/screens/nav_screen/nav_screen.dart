import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

import '../../my_app_exports.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final MiniplayerController miniPlayerController = MiniplayerController();
  int selectedIndex = 0;
  bool isPaused = false;

  @override
  void dispose() {
    miniPlayerController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ShortsScreen(),
    const AddScreen(),
    const SubscriptionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double minHeight = size.height * 0.08;
    double closeHeight = 0;
    double miniPlayerHeight = 0;
    return Scaffold(
      body: Stack(
        // by this method when we switch to another tab our rendered details will be remembered instead of rebuild
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: selectedIndex != i,
                    child: screen,
                  ),
                ))
            .values
            .toList()
          ..add(
            Offstage(
              offstage: true, //false
              child: Miniplayer(
                valueNotifier:
                    ValueNotifier(MediaQuery.of(context).size.height),
                controller: miniPlayerController,
                minHeight: minHeight,
                maxHeight: size.height,
                builder: (height, percentage) {
                  if (height <= size.height * 0.08) {
                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.network(
                                  videos[1].thumbnailUrl,
                                  height: size.height * 0.08 - 4,
                                  width: size.height * 0.15,
                                  fit: BoxFit.cover,
                                ),
                                Gap(width: 6),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Wrap(
                                        children: [
                                          Text(
                                            videos[1].title,
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(height: 3),
                                      Text(
                                        videos[1].author.username,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                CommonIconButton(
                                  size: size.height * 0.04,
                                  onTap: () {
                                    setState(() {
                                      isPaused = !isPaused;
                                    });
                                  },
                                  icon:
                                      isPaused ? Icons.play_arrow : Icons.pause,
                                ),
                                CommonIconButton(
                                  size: size.height * 0.04,
                                  onTap: () {
                                    miniPlayerController.animateToHeight(
                                      state: PanelState.MIN,
                                    );
                                    setState(() {
                                      minHeight = closeHeight;
                                    });
                                  },
                                  icon: Icons.close,
                                )
                              ],
                            ),
                            const LinearProgressIndicator(
                              value: 0.4,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  // show video screen if size is greater
                  return const VideoScreen();
                },
              ),
            ),
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: AppColors.white,
            ),
            label: 'Home',
            tooltip: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: AppColors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection_outlined,
              color: AppColors.white,
            ),
            label: 'Shorts',
            tooltip: 'Shorts',
            activeIcon: Icon(Icons.video_collection_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              color: AppColors.white,
              size: 40,
            ),
            label: 'Add',
            tooltip: 'Add',
            activeIcon: Icon(
              Icons.add_circle_outlined,
              size: 40,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions_outlined,
              color: AppColors.white,
            ),
            label: 'Subscription',
            tooltip: 'Subscription',
            activeIcon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: AppColors.white,
            ),
            label: 'Profile',
            tooltip: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
