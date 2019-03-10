import 'package:angular/angular.dart';
import 'package:angular_tour_of_heros/src/hero_services.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_tour_of_heros/src/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  template: '''
    <h1>{{title}}</h1>
    <nav>
        <a [routerLink]="RoutePaths.dashboard.toUrl()"
            [routerLinkActive]="'active'">DashBoard</a>
        <a [routerLink]="RoutePaths.heroes.toUrl()"
            [routerLinkActive]="'active'">Heroes
        </a>
    </nav>
    <router-outlet  [routes]="Routes.all"></router-outlet>
  ''',
  directives: [routerDirectives],
  providers: [ClassProvider(HeroServices)],
  exports: [Routes, RoutePaths],
)
class AppComponent {
  final String title = 'Tour of Heroes';
}
