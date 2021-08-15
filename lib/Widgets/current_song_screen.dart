import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';

class CurrentSongScreen extends StatelessWidget {
  const CurrentSongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrack>().selected;
    return selected == null
        ? const SizedBox.shrink()
        : TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 2, milliseconds: 30),
            builder: (BuildContext context, double _val, Widget? child) {
              return Opacity(
                opacity: _val,
                child: child,
              );
            },
            child: Container(
              height: 84,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        "assets/lofigirl.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selected.title,
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          selected.artist,
                          style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(),
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_outlined,
                          size: 20.0, color: Colors.white),
                    ),
                    const Spacer(),
                    _PlayerControllButtons(),
                    const Spacer(),
                    if (MediaQuery.of(context).size.width > 800)
                      _MoreControlls(),
                  ],
                ),
              ),
            ),
          );
  }
}

class _MoreControlls extends StatelessWidget {
  const _MoreControlls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.devices_outlined,
            size: 20.0,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.volume_up_outlined,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.fullscreen_outlined,
            size: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _PlayerControllButtons extends StatelessWidget {
  const _PlayerControllButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrack>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.shuffle,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous_outlined,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.play_circle_outline,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next_outlined,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.repeat,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text(
              "0:00",
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize: 14.0, color: Colors.grey[400]),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              selected?.duration ?? "0:00",
              style: Theme.of(context)
                  .textTheme
                  .overline!
                  .copyWith(fontSize: 14.0, color: Colors.grey[400]),
            ),
          ],
        )
      ],
    );
  }
}
