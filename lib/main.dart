import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController textEditingController = TextEditingController();
  final YoutubePlayerController youtubePlayerController =
      YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=fs7-8M1VbZU")!,
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: youtubePlayerController),
        builder: (context, player) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10,),
                      player,
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter video URL"),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            youtubePlayerController.load(
                              YoutubePlayer.convertUrlToId(
                                  textEditingController.text)!,
                            );
                          },
                          child: Text("Play Video"))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
