import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spotify_ui/Widgets/widgets.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  const PlayListScreen({required this.playlist, Key? key}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  bool _showAppbar = true;
  bool isScrollingDown = false;
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController();
    _scrollController?.addListener(() {
      if (_scrollController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollController?.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            label: const Text("Rached Khalledi"),
          ),
          const SizedBox(
            width: 8.0,
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            color: ThemeData.dark().primaryColor,
            offset: Offset(20, 0),
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 30.0,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                child: Text(
                  "History",
                ),
              ),
              PopupMenuItem(
                height: 30.0,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                child: Text(
                  "Sign out",
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.3],
              colors: [Color(0xFF900C3F), Colors.transparent]),
        ),
        child: RawScrollbar(
          thumbColor: Colors.grey[400],
          thickness: 8,
          controller: _scrollController,
          isAlwaysShown: true,
          child: ListView(
            controller: _scrollController,
            children: [
              PlayListHeader(
                playlist: widget.playlist,
              ),
              TracksList(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrentTrack currentTrack = Provider.of<CurrentTrack>(context);
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        dataRowHeight: 54.0,
        dataTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        showCheckboxColumn: false,
        columns: [
          DataColumn(
            label: Text(
              'TITLE',
              style: TextStyle(
                  color: Colors.grey[300], letterSpacing: 1.0, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text('ARTIST',
                style: TextStyle(
                    color: Colors.grey[300],
                    letterSpacing: 1.0,
                    fontSize: 14.0)),
          ),
          DataColumn(
            label: Text('ALBUM',
                style: TextStyle(
                    color: Colors.grey[300],
                    letterSpacing: 0.0,
                    fontSize: 14.0)),
          ),
          DataColumn(
            label: Icon(
              Icons.access_time,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ],
        rows: tracks.map((track) {
          final selected =
              context.watch<CurrentTrack>().selected?.id == track.id;
          final textColor = TextStyle(
              color: selected ? Colors.greenAccent[400] : Colors.white);
          return DataRow(
              cells: [
                DataCell(
                  Text(
                    track.title,
                    style: textColor,
                  ),
                ),
                DataCell(
                  Text(
                    track.artist,
                    style: textColor,
                  ),
                ),
                DataCell(
                  Text(
                    track.album,
                    style: textColor,
                  ),
                ),
                DataCell(
                  Text(
                    track.duration,
                    style: textColor,
                  ),
                ),
              ],
              selected: selected,
              onSelectChanged: (_) {
                context.read<CurrentTrack>().selectSong(track);
              });
        }).toList(),
      ),
    );
  }
}
