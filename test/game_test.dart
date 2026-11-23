import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_nota_karolari/oyun_nota_karolari.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(notaKarolariConfig.title.length, 33);
    expect(notaKarolariConfig.tagline.length, 33);
    for (final s in notaKarolariConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(notaKarolariConfig.gameId, notaKarolariId);
    expect(notaKarolariRules.gameId, notaKarolariId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(notaKarolariRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: notaKarolariId, optionalMechanics: notaKarolariRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(notaKarolariRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
