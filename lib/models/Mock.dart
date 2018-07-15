import 'package:flutter/material.dart';
import 'package:moonfm/models/CountryItem.dart';
import 'package:moonfm/models/HomeBar.dart';
import 'package:moonfm/models/PodcastItem.dart';
import 'package:moonfm/models/ProfileRow.dart';
import 'package:moonfm/models/RowItem.dart';

class Mock {
  static final List<RowItem> podcastTypes = [
    RowItem(title: "Art", icon: Icons.color_lens, iconColor: Colors.orange),
    RowItem(
        title: "Business", icon: Icons.business_center, iconColor: Colors.blue),
    RowItem(title: "Comedy", icon: Icons.toys, iconColor: Colors.pink),
    RowItem(title: "Education", icon: Icons.class_, iconColor: Colors.lime),
    RowItem(
        title: "Games & Hobbies", icon: Icons.games, iconColor: Colors.purple),
    RowItem(
        title: "Government & Organiztions",
        icon: Icons.free_breakfast,
        iconColor: Colors.blueAccent),
    RowItem(
        title: "Health", icon: Icons.insert_emoticon, iconColor: Colors.green),
    RowItem(
        title: "Kids & Family", icon: Icons.child_care, iconColor: Colors.red),
    RowItem(
        title: "Music",
        icon: Icons.library_music,
        iconColor: Colors.deepPurple),
    RowItem(
        title: "Neews & Politics",
        icon: Icons.new_releases,
        iconColor: Colors.redAccent),
    RowItem(
        title: "Technology",
        icon: Icons.bubble_chart,
        iconColor: Colors.lightBlue),
  ];

  static final List<CountryItem> countries = [
    CountryItem(title: "Andorra", imageName: "assets/images/flags/AD.png"),
    CountryItem(title: "Afghanistan", imageName: "assets/images/flags/AF.png"),
    CountryItem(
        title: "Antigua and Barbuda", imageName: "assets/images/flags/AG.png"),
    CountryItem(title: "Anguilla", imageName: "assets/images/flags/AI.png"),
    CountryItem(title: "Albania", imageName: "assets/images/flags/AL.png"),
    CountryItem(title: "Andorra", imageName: "assets/images/flags/AD.png"),
    CountryItem(title: "Afghanistan", imageName: "assets/images/flags/AF.png"),
    CountryItem(
        title: "Antigua and Barbuda", imageName: "assets/images/flags/AG.png"),
    CountryItem(title: "Anguilla", imageName: "assets/images/flags/AI.png"),
    CountryItem(title: "Albania", imageName: "assets/images/flags/AL.png"),
    CountryItem(title: "Andorra", imageName: "assets/images/flags/AD.png"),
    CountryItem(title: "Afghanistan", imageName: "assets/images/flags/AF.png"),
    CountryItem(
        title: "Antigua and Barbuda", imageName: "assets/images/flags/AG.png"),
    CountryItem(title: "Anguilla", imageName: "assets/images/flags/AI.png"),
    CountryItem(title: "Albania", imageName: "assets/images/flags/AL.png"),
    CountryItem(title: "Andorra", imageName: "assets/images/flags/AD.png"),
    CountryItem(title: "Afghanistan", imageName: "assets/images/flags/AF.png"),
    CountryItem(
        title: "Antigua and Barbuda", imageName: "assets/images/flags/AG.png"),
    CountryItem(title: "Anguilla", imageName: "assets/images/flags/AI.png"),
    CountryItem(title: "Albania", imageName: "assets/images/flags/AL.png"),
  ];

  static final List<PodcastItem> home = [
    PodcastItem(
        title: "民谣在路上",
        subtitle: "【赵美丽】Vol.134 黑夜让思念变得很简单",
        cover:
            "https://moon.fm/static/images/podcast/full/7133ba35457a23096278095ac3ea210f295091b0.jpg",
        auth: "民谣在路上Folk"),
    PodcastItem(
        title: "黑水公园",
        subtitle: "《超人总动员2》超级英雄们的家长里短",
        cover:
            "https://moon.fm/static/images/podcast/full/7fb97b859bffa955c832ead1506251ea9e1a72ee.jpg",
        auth: "Alvin"),
    PodcastItem(
        title: "Anyway.FM 设计杂谈",
        subtitle: "№67: 没有失落的秘符 · 动物世界",
        cover:
            "https://moon.fm/static/images/podcast/full/4c4593a4a1d91134d8d9099eb40599bc0cdbb107.jpg",
        auth: "JJ Ying & Leon Gao"),
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "一席live",
        subtitle: "一席表演嘉宾",
        cover:
            "https://moon.fm/static/images/podcast/full/581c3ab46ebfc5cc6089ce11afff147500a2fc77.jpg",
        auth: "一席"),
    PodcastItem(
        title: "民谣在路上",
        subtitle: "【赵美丽】Vol.134 黑夜让思念变得很简单",
        cover:
            "https://moon.fm/static/images/podcast/full/7133ba35457a23096278095ac3ea210f295091b0.jpg",
        auth: "民谣在路上Folk"),
    PodcastItem(
        title: "黑水公园",
        subtitle: "《超人总动员2》超级英雄们的家长里短",
        cover:
            "https://moon.fm/static/images/podcast/full/7fb97b859bffa955c832ead1506251ea9e1a72ee.jpg",
        auth: "Alvin"),
    PodcastItem(
        title: "Anyway.FM 设计杂谈",
        subtitle: "№67: 没有失落的秘符 · 动物世界",
        cover:
            "https://moon.fm/static/images/podcast/full/4c4593a4a1d91134d8d9099eb40599bc0cdbb107.jpg",
        auth: "JJ Ying & Leon Gao"),
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "一席live",
        subtitle: "一席表演嘉宾",
        cover:
            "https://moon.fm/static/images/podcast/full/581c3ab46ebfc5cc6089ce11afff147500a2fc77.jpg",
        auth: "一席"),
  ];

  static final List<PodcastItem> discoverPodcasts = [
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "民谣在路上",
        subtitle: "【赵美丽】Vol.134 黑夜让思念变得很简单",
        cover:
            "https://moon.fm/static/images/podcast/full/7133ba35457a23096278095ac3ea210f295091b0.jpg",
        auth: "民谣在路上Folk"),
    PodcastItem(
        title: "黑水公园",
        subtitle: "《超人总动员2》超级英雄们的家长里短",
        cover:
            "https://moon.fm/static/images/podcast/full/7fb97b859bffa955c832ead1506251ea9e1a72ee.jpg",
        auth: "Alvin"),
    PodcastItem(
        title: "Anyway.FM 设计杂谈",
        subtitle: "№67: 没有失落的秘符 · 动物世界",
        cover:
            "https://moon.fm/static/images/podcast/full/4c4593a4a1d91134d8d9099eb40599bc0cdbb107.jpg",
        auth: "JJ Ying & Leon Gao"),
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "一席live",
        subtitle: "一席表演嘉宾",
        cover:
            "https://moon.fm/static/images/podcast/full/581c3ab46ebfc5cc6089ce11afff147500a2fc77.jpg",
        auth: "一席"),
  ];

  static final List<PodcastItem> playlist = [
    PodcastItem(
        title: "民谣在路上",
        subtitle: "【赵美丽】Vol.134 黑夜让思念变得很简单",
        cover:
            "https://moon.fm/static/images/podcast/full/7133ba35457a23096278095ac3ea210f295091b0.jpg",
        auth: "民谣在路上Folk",
        audioUrl:
            "http://audio.xmcdn.com/group45/M00/AA/F3/wKgKjltAD3uTDp1sAJpgRL8jesI494.m4a"),
    PodcastItem(
        title: "大内密谈",
        subtitle: "vol.587 面对复杂 保持欢喜",
        cover:
            "http://cdn.lizhi.fm/podcast_cover/2018/06/11/2674520094527922247.jpg",
        auth: "民谣在路上Folk",
        audioUrl:
            "http://cdn.lizhi.fm/audio/2018/07/12/2680437694211579910_ud.mp3"),
    PodcastItem(
        title: "黑水公园",
        subtitle: "《超人总动员2》超级英雄们的家长里短",
        cover:
            "http://fdfs.xmcdn.com/group33/M08/0E/0E/wKgJnVmWZk-jWjmnAAMWCkhdCk4796.jpg",
        auth: "民谣在路上Folk",
        audioUrl:
            "http://audio.xmcdn.com/group45/M0B/54/04/wKgKlFtGwAOQew33AgtcRMza3lc361.m4a"),
  ];

  static final List<PodcastItem> discoverRadios = [
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "民谣在路上",
        subtitle: "【赵美丽】Vol.134 黑夜让思念变得很简单",
        cover:
            "https://moon.fm/static/images/podcast/full/7133ba35457a23096278095ac3ea210f295091b0.jpg",
        auth: "民谣在路上Folk"),
    PodcastItem(
        title: "黑水公园",
        subtitle: "《超人总动员2》超级英雄们的家长里短",
        cover:
            "https://moon.fm/static/images/podcast/full/7fb97b859bffa955c832ead1506251ea9e1a72ee.jpg",
        auth: "Alvin"),
    PodcastItem(
        title: "Anyway.FM 设计杂谈",
        subtitle: "№67: ���有失落的秘符 · 动物世界",
        cover:
            "https://moon.fm/static/images/podcast/full/4c4593a4a1d91134d8d9099eb40599bc0cdbb107.jpg",
        auth: "JJ Ying & Leon Gao"),
    PodcastItem(
        title: "【蛋解创业】",
        subtitle: "让梦想发声是我们的梦想！欢迎订阅蛋解创业",
        cover:
            "https://moon.fm/static/images/podcast/full/cba0a53ac6520ddd6ada31798b12aea31d037ede.jpg",
        auth: "【蛋解创业】"),
    PodcastItem(
        title: "一席live",
        subtitle: "一席表演嘉宾",
        cover:
            "https://moon.fm/static/images/podcast/full/581c3ab46ebfc5cc6089ce11afff147500a2fc77.jpg",
        auth: "一席"),
  ];

  static final List<PodcastItem> topCharts = [
    PodcastItem(
        title: "Aftereffect",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/2867b69e4b73e60c70e807ced62d140de6ba18f5.jpg",
        auth: "WNYC Studios"),
    PodcastItem(
        title: "Inside Jaws",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/efe26575026f69b253d2760c1f74b6e87a036361.jpg",
        auth: "Wondery"),
    PodcastItem(
        title: "This Sounds Serious",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/54c1eab62656642f3901fa2d438dfba97ce17589.jpg",
        auth: "Castbox  |  Kelly & Kelly"),
    PodcastItem(
        title: "Aftereffect",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/2867b69e4b73e60c70e807ced62d140de6ba18f5.jpg",
        auth: "WNYC Studios"),
    PodcastItem(
        title: "Aftereffect",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/2867b69e4b73e60c70e807ced62d140de6ba18f5.jpg",
        auth: "WNYC Studios"),
    PodcastItem(
        title: "Inside Jaws",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/efe26575026f69b253d2760c1f74b6e87a036361.jpg",
        auth: "Wondery"),
    PodcastItem(
        title: "This Sounds Serious",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/54c1eab62656642f3901fa2d438dfba97ce17589.jpg",
        auth: "Castbox  |  Kelly & Kelly"),
    PodcastItem(
        title: "Inside Jaws",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/efe26575026f69b253d2760c1f74b6e87a036361.jpg",
        auth: "Wondery"),
    PodcastItem(
        title: "This Sounds Serious",
        subtitle: "WNYC Studios",
        cover:
            "https://moon.fm/static/images/podcast/full/54c1eab62656642f3901fa2d438dfba97ce17589.jpg",
        auth: "Castbox  |  Kelly & Kelly"),
  ];

  static final List<List<ProfileRow>> profileSections = [
    [
      ProfileRow(icon: Icons.person, title: "Popeye"),
      ProfileRow(icon: Icons.email, title: "popeyelau@gmail.com"),
      ProfileRow(icon: Icons.person, title: "Logout")
    ],
    [
      ProfileRow(
          icon: Icons.favorite, title: "Favorites", iconColor: Colors.yellow),
      ProfileRow(
          icon: Icons.access_time, title: "History", iconColor: Colors.blue),
      ProfileRow(
          icon: Icons.cloud_download,
          title: "Downloads",
          iconColor: Colors.green)
    ],
    [
      ProfileRow(icon: Icons.camera_alt, title: "Scan QR Code"),
      ProfileRow(icon: Icons.settings, title: "Settings"),
    ],
  ];

  static final List<HomeBar> homeBanners = [
    HomeBar(
        title: "Subscriptions",
        icon: Icons.subscriptions,
        iconColor: Colors.blue),
    HomeBar(
        title: "Downloads",
        icon: Icons.cloud_download,
        iconColor: Colors.green),
    HomeBar(title: "Favorites", icon: Icons.favorite, iconColor: Colors.yellow),
    HomeBar(title: "History", icon: Icons.access_time, iconColor: Colors.blue)
  ];

  static final Map<String, List<RowItem>> settings = {
    "Theme": [RowItem(title: "Very White", icon: Icons.color_lens)],
    "User Interface Language": [
      RowItem(title: "Language: en", icon: Icons.language)
    ],
    "Feed Fetch Timeout": [
      RowItem(title: "10 seconds", icon: null),
      RowItem(title: "30 seconds", icon: null),
      RowItem(title: "60 seconds", icon: null)
    ],
    "Feedback": [
      RowItem(title: "Github Issue", icon: Icons.question_answer),
      RowItem(title: "Telegram Group Moon.FM", icon: Icons.chat_bubble),
      RowItem(title: "moonfm2017@gmail.com", icon: Icons.email)
    ],
  };

  static final actions = [
    RowItem(icon: Icons.play_arrow, title: "Play Now", iconColor: Colors.blue),
    RowItem(
        icon: Icons.skip_next, title: "Play Next", iconColor: Colors.lightBlue),
    RowItem(
        icon: Icons.filter_list, title: "Play Later", iconColor: Colors.blue),
    RowItem(
        icon: Icons.file_download,
        title: "Save Episode",
        iconColor: Colors.green),
    RowItem(icon: Icons.stars, title: "Favorite", iconColor: Colors.yellow),
    RowItem(
        icon: Icons.share, title: "Share Episode", iconColor: Colors.lightBlue),
  ];
}
