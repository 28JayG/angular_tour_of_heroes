@TestOn('browser')
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';
import 'package:angular_tour_of_heros/src/hero_list_component.dart';
import 'package:angular_tour_of_heros/app_component.template.dart' as ng;

void main() {
  final testBed =
      NgTestBed.forComponent<HeroListComponent>(ng.AppComponentNgFactory);
  NgTestFixture<HeroListComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('heading', () {
    expect(fixture.text, contains('My First AngularDart App'));
  });

  // Testing info: https://webdev.dartlang.org/angular/guide/testing
}
