import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iqra_library_app/Features/audiobook/data/models/podcast_model.dart';
import 'package:iqra_library_app/core/utils/app_router.dart';

class PodcastItem extends StatelessWidget {
  final PodcastModel model;

  const PodcastItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kAudioPlayerView, extra: model);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  model.image.isNotEmpty
                      ? Image.network(
                        model.image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      )
                      : const Icon(Icons.podcasts, size: 70),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Text(
                  //   model.publisher,
                  //   style: TextStyle(
                  //     color: Colors.grey.shade600,
                  //     fontSize: 13,
                  //   ),
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
            const Icon(Icons.play_arrow, size: 28),
          ],
        ),
      ),
    );
  }
}
