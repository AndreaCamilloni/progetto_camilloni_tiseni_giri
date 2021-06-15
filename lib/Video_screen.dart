import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoScreen extends StatefulWidget{

  final String id;

  VideoScreen(this.id);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>{

  @override
  Widget build(BuildContext context){
    return Container(
        height:200,
        width:300,
        child:YoutubePlayer(
          controller:YoutubePlayerController(
            initialVideoId: widget.id,
            flags: YoutubePlayerFlags(
              hideControls: false,
              controlsVisibleAtStart: true,
              autoPlay: false,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
          onReady: (){
            print('Player is ready');
          },
        )
    );
  }
}