import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_tour_of_heros/src/hero.dart';
import 'package:angular_tour_of_heros/src/hero_services.dart';
import 'package:angular_tour_of_heros/src/route_paths.dart';

@Component(
  selector: "my-hero",
  directives: [coreDirectives, formDirectives],
  styleUrls: ['hero_component.css'],
  template: '''<div *ngIf="hero!=null">
    <h2>{{hero.name}}</h2>
    <div><label>id: </label>{{hero.id}}</div>
    <div>
        <label>name: </label>
        <input [(ngModel)]="hero.name" placeholder="name" />
    </div>
    <button (click)="goBack()">Back</button>
</div>''',
)
class HeroComponent implements OnActivate {
  final HeroServices _heroServices;
  final Location _location;
  Hero hero;

  HeroComponent(this._heroServices, this._location);

  @override
  void onActivate(RouterState previous, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) {
      hero = await (_heroServices.get(id));
    }
  }

  void goBack() {
    _location.back();
  }
}
