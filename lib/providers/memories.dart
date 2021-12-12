import 'package:flutter/foundation.dart';
import 'package:my_memories/models/memory.dart';

class Memory with ChangeNotifier {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final String imageUrl;
  final List<String> images;
  bool isFavorite;

  Memory(
      {required this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.imageUrl,
      required this.images,
      this.isFavorite = false});

  void toggleFavorite() {
    print(isFavorite);
    isFavorite = !isFavorite;
    print(isFavorite);
    notifyListeners();
  }
}

class Memories with ChangeNotifier {
  List<Memory> _elements = [
    Memory(
        id: 'e1',
        title: 'Memory 1',
        date: DateTime.now().subtract(Duration(days: 1000)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://images.pexels.com/photos/374710/pexels-photo-374710.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        images: [
          'https://pix10.agoda.net/geo/city/318/1_318_02.jpg?',
          'https://pix10.agoda.net/geo/city/318/1_318_02.jpg?',
          'https://i.natgeofe.com/k/5b396b5e-59e7-43a6-9448-708125549aa1/new-york-statue-of-liberty.jpg',
          'https://worldstrides.com/wp-content/uploads/2015/07/iStock_000040849990_Large.jpg',
          'https://pix10.agoda.net/geo/city/318/1_318_02.jpg?',
        ]),
    Memory(
        id: 'e2',
        title: 'Memory 2',
        date: DateTime.now().subtract(Duration(days: 1500)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://www.tourmyindia.com/blog//wp-content/uploads/2020/11/Taj-Mahal-Agra-feature.jpg',
        images: [
          'http://www.tajmahal.gov.in/images/banners/1.jpg',
          'https://images.theconversation.com/files/228805/original/file-20180723-189308-12b3agf.jpg?',
        ]),
    Memory(
        id: 'e3',
        title: 'Memory 3',
        date: DateTime.now().subtract(Duration(days: 1800)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://vajiramandravi.s3.us-east-1.amazonaws.com/media/2021/1/16/11/44/59/STATUE_OF_UNITYY.jpg',
        images: [
          'https://assets.telegraphindia.com/telegraph/35ba88d9-1e03-4c46-90cb-ff5d06e2b1ad.jpg',
          'https://ihplb.b-cdn.net/wp-content/uploads/2018/12/blog.jpg',
          'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2013/10/31/1383234856303/Statue-of-Unity-planned-i-009.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=7ed3150921a3ce77162be432a82c34b0',
          'https://assets.telegraphindia.com/telegraph/35ba88d9-1e03-4c46-90cb-ff5d06e2b1ad.jpg',
        ]),
    Memory(
        id: 'e4',
        title: 'Memory 4',
        date: DateTime.now().subtract(Duration(days: 700)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://media.easemytrip.com/media/Blog/India/636989731119059291/636989731119059291QEwCcM.jpg',
        images: [
          'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2014/11/Alleppey-in-Kerala.jpg',
          'https://brillianceway.com/wp-content/uploads/2020/04/alappuzha-in-kerala.jpg'
              'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2014/11/Alleppey-in-Kerala.jpg',
        ]),
    Memory(
        id: 'e5',
        title: 'Memory 5',
        date: DateTime.now().subtract(Duration(days: 400)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://i0.wp.com/oneday.travel/wp-content/uploads/one-day-mumbai-local-sightseeing-tour-package-private-cab-header.jpg?',
        images: [
          'https://www.fabhotels.com/blog/wp-content/uploads/2018/09/places-vist-in-mumbai-600-1280x720.jpg',
          'https://www.fabhotels.com/blog/wp-content/uploads/2018/09/Marine-Drive-1.jpg',
          'https://cdn.cdnparenting.com/articles/2018/12/702408349-H.jpg'
        ]),
    Memory(
        id: 'e6',
        title: 'Memory 6',
        date: DateTime.now().subtract(Duration(days: 800)),
        description:
            'This was the time when I first tried XYZ and it gave me immense pleasure..',
        imageUrl:
            'https://www.planetware.com/photos-large/IND/india-top-attractions-varanasi.jpg',
        images: [
          'http://www.planetware.com/photos-large/IND/india-top-attractions-harmandir-sahib.jpg',
          'https://saundaryatourtravels.com/wp-content/uploads/2021/03/golden-temple-amritsar.jpg'
              'http://www.planetware.com/photos-large/IND/india-top-attractions-harmandir-sahib.jpg',
        ]),
  ];

  List<Memory> get elements {
    return [..._elements];
  }

  Memory findById(String id) {
    return _elements.firstWhere((element) => element.id == id);
  }

  List<Memory> _favList = [];
  // void addFav(Memory mem) {
  //   // final existingIndex = _favList.indexWhere((element) => element.id == id);
  //   final newProduct = Memory(
  //       id: mem.id,
  //       title: mem.title,
  //       date: mem.date,
  //       description: mem.description,
  //       imageUrl: mem.imageUrl);
  //   _favList.add(newProduct);
  //   print(_favList.length);
  //   // notifyListeners();
  // }

  List<Memory> get favEle {
    return _elements.where((element) => element.isFavorite).toList();
    // print("inLen");
    // print(_favList.length);
    // return _favList;
  }
}
