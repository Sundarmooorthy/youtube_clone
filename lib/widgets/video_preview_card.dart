import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../my_app_exports.dart';

class VideoPreviewCard extends StatelessWidget {
  final String? channelImage;
  final String? videoThumbNail;
  final String? videoTitle;
  final String? videoTotalDuration;
  final String? channelName;
  final String? viewsCount;
  final String? postedTime;
  final Function()? moreOnTap;
  final Function()? onTap;

  const VideoPreviewCard({
    super.key,
    this.channelImage =
        'https://as2.ftcdn.net/v2/jpg/07/95/95/13/1000_F_795951374_QR1tADRPLjbh0NqrJqLPbzOTHJW5HjmY.jpg',
    this.videoTitle = 'Video Title Here',
    this.videoTotalDuration = '12:00',
    this.channelName = 'Sundar Flutter Dev',
    this.viewsCount = '100K',
    this.postedTime = '1 week ago',
    this.moreOnTap,
    this.onTap,
    this.videoThumbNail,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.25,
                color: Colors.white,
                child: Image.network(
                  videoThumbNail!,
                  fit: BoxFit.cover,
                  height: size.height * 0.25,
                  width: double.infinity,
                ),
              ),
              Positioned(
                right: size.height * 0.01,
                bottom: size.height * 0.01,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    videoTotalDuration!,
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              left: AppDimens.appHPadding10,
              top: AppDimens.appVPadding10,
              bottom: AppDimens.appVPadding10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.network(
                    height: size.height * 0.045,
                    width: size.height * 0.045,
                    fit: BoxFit.fill,
                    channelImage!,
                  ),
                ),
                Gap(width: 15),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Text(
                            videoTitle!,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Gap(height: 3),
                      Wrap(
                        children: [
                          Text(
                            channelName!,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                          Gap(width: 5),
                          Text(
                            viewsCount!,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                          Gap(width: 5),
                          Text(
                            postedTime!,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CommonIconButton(
                    onTap: moreOnTap,
                    icon: Icons.more_vert_sharp,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
