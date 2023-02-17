import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayListPage extends StatefulWidget {
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<String> audioFiles = [
    'assets/audio/B12_speaker.mp3',
    'assets/audio/Drone_memory.mp3',
    'assets/audio/meca-in.mp3',
    'assets/audio/meca-out.mp3'
  ];

  @override
  void initState() {
    super.initState();
    getAudioFiles();
  }

  void getAudioFiles() async {
    setState(() {});
  }

  void playAudio(String filePath) async {
    audioPlayer.setAsset(filePath);
    await audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play List'),
      ),
      body: audioFiles.length > 0
          ? ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(audioFiles[index].split('/').last),
                  onTap: () {
                    playAudio(audioFiles[index]);
                  },
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
