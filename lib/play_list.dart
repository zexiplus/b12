import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class AudioFile {
  String path;
  String name;
  AudioFile(this.name, this.path);
}

List<AudioFile> audioFiles = [
  AudioFile('B12_speaker', 'audio/B12_speaker.mp3'),
  AudioFile('Drone_memory', 'audio/Drone_memory.mp3'),
  AudioFile('meca-in', 'audio/meca-in.mp3'),
  AudioFile('meca-out', 'audio/meca-out.mp3'),
];

class _PlayListPageState extends State<PlayListPage> {
  AudioPlayer audioPlayer = AudioPlayer();

  List<bool> audioStatus = audioFiles.map((f) => false).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play List 2'),
      ),
      body: audioFiles.isNotEmpty
          ? ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(audioFiles[index].name),
                    onTap: () async {
                      if (audioStatus[index]) {
                        setState(() {
                          audioStatus[index] = false;
                        });
                        await audioPlayer.pause();
                      } else {
                        setState(() {
                          audioStatus.fillRange(0, audioStatus.length, false);
                          audioStatus[index] = true;
                        });
                        await audioPlayer
                            .play(AssetSource(audioFiles[index].path));
                      }
                    },
                    trailing: audioStatus[index]
                        ? const Icon(Icons.stop)
                        : const Icon(Icons.play_circle));
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
