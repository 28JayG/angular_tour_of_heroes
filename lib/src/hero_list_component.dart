import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_tour_of_heros/src/hero.dart';
import 'package:angular_tour_of_heros/src/hero_services.dart';
import 'package:angular_tour_of_heros/src/route_paths.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: "my-heroes",
  directives: [coreDirectives, commonPipes],
  styleUrls: ['hero_list_component.css'],
  templateUrl: 'hero_list_component.html',
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroServices _heroServices;
  final Router _router;

  HeroListComponent(this._heroServices, this._router);

  Hero selected;
  List<Hero> heroes;

  Future<void> _getHeroes() async {
    heroes = await _heroServices.allHeroes;
  }

  String _heroUrl(int id) {
    return RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
  }

  Future<NavigationResult> goToDetail() =>
      _router.navigate(_heroUrl(selected.id));

  void ngOnInit() => _getHeroes();

  void onSelected(Hero hero) => selected = hero;
}
