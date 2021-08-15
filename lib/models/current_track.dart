import 'package:flutter/cupertino.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectSong(Song song) {
    if (selected == song) {
      selected = null;
    } else {
      selected = song;
    }
    notifyListeners();
  }
}
