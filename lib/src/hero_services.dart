import 'package:angular_tour_of_heros/src/hero.dart';
import 'package:angular_tour_of_heros/src/mock_heroes.dart';

class HeroServices{
  Future <List<Hero>> get allHeroes async => mockHeroes;

  Future<Hero> get(int id) async{
    return (await allHeroes).firstWhere((Hero hero)=>id== hero.id);
  }
}