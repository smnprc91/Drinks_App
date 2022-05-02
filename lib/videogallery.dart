import 'package:flutter/material.dart';
import 'package:progdrinks/widgets/myallpagesappbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoGallery extends StatefulWidget {
  const VideoGallery({Key? key}) : super(key: key);

  @override
  State<VideoGallery> createState() => _VideoGalleryState();
}

class _VideoGalleryState extends State<VideoGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAllPagesAppBar(
        child: Text('data'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: 'Gs069dndIYk',
                      flags: YoutubePlayerFlags(
                        hideThumbnail: false,
                        autoPlay: false,
                        mute: false,
                      ),
                    ),
                  ),
                  builder: (context, player) {
                    return Container(
                      child: player,
                    );
                  });
            }),
      ),
    );
  }
}
