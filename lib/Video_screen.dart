//classe che implementa lo scrren per i video

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoScreen extends StatefulWidget{

  final String id;

  VideoScreen(this.id);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}
//classe per creare lo youtube player
class _VideoScreenState extends State<VideoScreen>{

  @override
  Widget build(BuildContext context){
    return Container(
        height:200,
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