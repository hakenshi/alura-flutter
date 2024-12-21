import 'package:flutter/material.dart';

import '../components/task.dart';

class WaifuInherited extends InheritedWidget {
  WaifuInherited({
    super.key,
    required super.child,
  });

  final List<Waifu> waifuList = [
    const Waifu(
      url: "https://w.wallhaven.cc/full/8o/wallhaven-8o65jo.jpg",
      title: "Ulrich Von Hutten",
      rating: 3,
    ),
    const Waifu(
      url: "https://img3.gelbooru.com/images/e9/5b/e95bd342bbea3562fb4b8292ffbb08c6.jpg",
      title: "Roon",
      rating: 5,
    ),
    const Waifu(
      url: "https://w.wallhaven.cc/full/q6/wallhaven-q6v6rd.png",
      title: "Prinz Eugen",
      rating: 4,
    ),
    const Waifu(
      url: "https://w.wallhaven.cc/full/wy/wallhaven-wy3ypp.jpg",
      title: "Deutschland",
      rating: 1,
    ),
    const Waifu(
      url: "https://w.wallhaven.cc/full/pk/wallhaven-pk8ozp.png",
      title: "Tirptz",
      rating: 2,
    ),
    const Waifu(
      url: "https://w.wallhaven.cc/full/x6/wallhaven-x6go5l.jpg",
      title: "Hindenburg",
      rating: 3,
    ),
    const Waifu(
      url: "https://w.wallhaven.cc/full/1p/wallhaven-1pp68v.jpg",
      title: "Ägir",
      rating: 5,
    ),
  ];

  void updateList(Waifu value) {
    waifuList
        .add(Waifu(title: value.title, rating: value.rating, url: value.url));
  }

  static WaifuInherited of(BuildContext context) {
    final WaifuInherited? result =
        context.dependOnInheritedWidgetOfExactType<WaifuInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(WaifuInherited oldWidget) {
    return oldWidget.waifuList.length != waifuList.length;
  }
}
