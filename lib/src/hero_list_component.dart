import 'package:angular/angular.dart';
import 'package:angular_tour_of_heros/src/hero.dart';
import 'package:angular_tour_of_heros/src/hero_component.dart';
import 'package:angular_tour_of_heros/src/hero_services.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: "my-heroes",
  directives: [coreDirectives, HeroComponent],
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
)
class HeroListComponent implements OnInit {
  HeroServices _heroServices;

  HeroListComponent(this._heroServices);

  Hero selected;
  List<Hero> heroes;

  Future<void> _getHeroes() async{
  heroes = await _heroServices.allHeroes;
  }

  void ngOnInit() => _getHeroes();

  void onSelected(Hero hero) => selected = hero;
}
