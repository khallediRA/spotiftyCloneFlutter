import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                child: Image.asset(
                  playlist.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Playlist",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[300],
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(playlist.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(playlist.description,
                        style: TextStyle(
                          color: Colors.grey[300],
                          letterSpacing: 1.0,
                        ),
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Text("Created By " + playlist.creator + " - ",
                            style: TextStyle(
                              color: Colors.grey[300],
                              letterSpacing: 1.0,
                            ),
                            overflow: TextOverflow.ellipsis),
                        Text(
                          playlist.duration,
                          style: TextStyle(
                            color: Colors.grey[300],
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          PlaylistHeaderButtons(followers: playlist.followers)
        ],
      ),
    );
  }
}

class PlaylistHeaderButtons extends StatelessWidget {
  final String followers;

  const PlaylistHeaderButtons({Key? key, required this.followers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 48.0),
                  backgroundColor: Colors.greenAccent[400],
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  textStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 12.0, letterSpacing: 2.0)),
              child: Text("PLAY"),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                size: 30.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "FOLLOWERS",
                style: TextStyle(
                    color: Colors.grey[300],
                    letterSpacing: 1.0,
                    fontSize: 14.0),
              ),
              Text(
                followers,
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 12.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
