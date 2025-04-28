import 'package:flutter/material.dart';
import 'package:iqra_library_app/Features/audiobook/presentation/views/auido_player_view.dart';

class AudioBookView extends StatelessWidget {
  const AudioBookView({super.key});

  @override
  Widget build(BuildContext context) {
    final String bookimage = 'assets/images/test_book2.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Audiobooks',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    bookimage,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.1,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 1,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'The Power Of Your Subconscious Mind',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                      fontSize: 16
                  ),
                ),
                subtitle: Text(
                  'Joseph Murphy',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                      fontSize: 12
                  ),
                ),

                trailing: Icon(
                  Icons.play_circle_fill,
                  size: 40,
                  color: Theme.of(context).iconTheme.color,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AudioPlayerView(
                            audioBooks: [
                              AudioBookModel(
                                title: 'The Power Of Your Subconscious Mind',
                                author: 'Joseph Murphy',
                                audioUrl: 'https://example.com/audio.mp3',
                                imagePath: bookimage,
                              ),
                              AudioBookModel(
                                title: 'Another Book',
                                author: 'Another Author',
                                audioUrl: 'https://example.com/audio2.mp3',
                                imagePath: bookimage,
                              ),
                            ],
                            initialIndex: 0,
                          ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
