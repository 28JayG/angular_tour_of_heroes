import 'package:angular/angular.dart';
import 'package:angular_tour_of_heros/src/hero_list_component.dart';
import 'package:angular_tour_of_heros/src/hero_services.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'my-app',
    template: '''
    <h1>{{title}}</h1>
    <my-heroes></my-heroes>
  ''',
    directives: [HeroListComponent],
    providers: [ClassProvider(HeroServices)])
class AppComponent {
  final String title = 'Tour of Heroes';
}
