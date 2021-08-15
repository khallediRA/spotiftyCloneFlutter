import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: double.infinity,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/spotify_logo.png",
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideBarItem(
            icon: Icons.home,
            title: "Home",
            ontap: () => null,
          ),
          _SideBarItem(
            icon: Icons.search,
            title: "Search",
            ontap: () => null,
          ),
          _SideBarItem(
            icon: Icons.music_note,
            title: "Music",
            ontap: () => null,
          ),
          const SizedBox(
            height: 12.0,
          ),
          _LibraryPlayLists()
        ],
      ),
    );
  }
}

class _SideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback ontap;
  const _SideBarItem(
      {Key? key, required this.title, required this.icon, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 28.0,
      ),
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.grey[300],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      onTap: ontap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  const _LibraryPlayLists({Key? key}) : super(key: key);

  @override
  __LibraryPlayListsState createState() => __LibraryPlayListsState();
}

class __LibraryPlayListsState extends State<_LibraryPlayLists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawScrollbar(
        thumbColor: Colors.grey[300],
        radius: Radius.circular(20),
        thickness: 8,
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "YOUR LIBRARY",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: TextStyle(
                            color: Colors.grey[300],
                            letterSpacing: 1.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    "YOUR PLAYLIST",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map((e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: TextStyle(
                            color: Colors.grey[300],
                            letterSpacing: 1.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )))
                    .toList()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
