import 'package:get/get.dart';

import '../Data/AllGames_Data.dart';
import '../favorite.dart';

class Fevorite_Remove extends GetxController {
  List<Map<String, dynamic>> allgame = [
    {
      'category': Topgames[0]['category'],
      'length': Topgames.length,
      'gameURL': Topgames,
    },
    {
      'category': PopularGame[0]['category'],
      'length': PopularGame.length,
      'gameURL': PopularGame,
    },
    {
      'category': GirlsGame[0]['category'],
      'length': GirlsGame.length,
      'gameURL': GirlsGame,
    },
    {
      'category': QuizGame[0]['category'],
      'length': QuizGame.length,
      'gameURL': QuizGame,
    },
    {
      'category': Racing[0]['category'],
      'length': Racing.length,
      'gameURL': Racing,
    },
    {
      'category': Cards[0]['category'],
      'length': Cards.length,
      'gameURL': Cards,
    },
    {
      'category': Sport[0]['category'],
      'length': Sport.length,
      'gameURL': Sport,
    },
  ];

  void Add_Remove(int indexList, int index) {
    if (AddGems().addGems.contains(allgame[indexList]['gameURL'][index])) {
      AddGems().addGems.remove(allgame[indexList]['gameURL'][index]);
    } else {
      AddGems().addGems.add(allgame[indexList]['gameURL'][index]);
    }
    update();
  }

  void ADDD(int addd) {
    addd++;
    update();
  }

  int Navigation(int navigation) {
    int currentIndex = 0;
    currentIndex = navigation;
    print(currentIndex);
    update();
    return currentIndex;
  }

  bool isProductsExits(String productId) {
    bool result = false;

    for (var product in AddGems().addGems) {
      if (product['GameName'] == productId) {
        result = true;
        break;
      } else {
        result = false;
      }
    }
    update();
    print(result);
    return result;
  }
}
