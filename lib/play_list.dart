import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
  AudioFile('B12_speaker', 'assets/audio/B12_speaker.mp3'),
  AudioFile('Drone_memory', 'assets/audio/Drone_memory.mp3'),
  AudioFile('meca-in', 'assets/audio/meca-in.mp3'),
  AudioFile('meca-out', 'assets/audio/meca-out.mp3'),
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
        title: const Text('Play List'),
      ),
      body: audioFiles.isNotEmpty
          ? ListView.builder(
              itemCount: audioFiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(audioFiles[index].name),
                    onTap: () {
                      if (audioStatus[index]) {
                        setState(() {
                          audioStatus[index] = false;
                        });
                        audioPlayer.pause();
                      } else {
                        setState(() {
                          audioStatus.fillRange(0, audioStatus.length, false);
                          audioStatus[index] = true;
                        });
                        audioPlayer.setAsset(audioFiles[index].path);
                        audioPlayer
                            .play()
                            .whenComplete(() => print('not as expect'));
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
