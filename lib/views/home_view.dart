import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff785547),
          title: Center(
            child: Text('Piano'),
          ),
        ),
        body: Row(
          children: [
            CustomNoteWidget(0.156, whiteButtonNumber: 1, blackButtonNumber: 4),
            CustomNoteWidget(0.14, whiteButtonNumber: 2, blackButtonNumber: 6),
            CustomNoteWidget(0.14, whiteButtonNumber: 3, blackButtonNumber: 5),
            CustomNoteWidget(0.14, whiteButtonNumber: 4, blackButtonNumber: 7),
            CustomNoteWidget(0.14, whiteButtonNumber: 5, blackButtonNumber: 3),
            CustomNoteWidget(0.14, whiteButtonNumber: 6, blackButtonNumber: 2),
            CustomNoteWidget(
              0.14,
              whiteButtonNumber: 7,
              blackButtonNumber: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNoteWidget extends StatelessWidget {
  const CustomNoteWidget(
    this.widthSize, {
    required this.whiteButtonNumber,
    required this.blackButtonNumber,
    super.key,
  });
  final int whiteButtonNumber;
  final int blackButtonNumber;
  final num? widthSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Material(
            child: InkWell(
              onTap: () {
                AudioPlayer().play(
                  AssetSource('notes/note_$whiteButtonNumber.wav'),
                );
              },
              splashColor: Colors.white.withOpacity(0.1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                width: MediaQuery.of(context).size.width * widthSize!,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          child: Material(
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.1),
              onTap: () {
                AudioPlayer().play(
                  AssetSource('notes/note_$blackButtonNumber.wav'),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.06,
                height: MediaQuery.of(context).size.height * 0.42,
              ),
            ),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
