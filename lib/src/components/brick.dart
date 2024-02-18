import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_labs/src/brick_breaker.dart';
import 'package:flame_labs/src/components/components.dart';
import 'package:flame_labs/src/config.dart';
import 'package:flutter/rendering.dart';

class Brick extends RectangleComponent
    with CollisionCallbacks, HasGameRef<BrickBreaker> {
  Brick(Vector2 position, Color color)
      : super(
          position: position,
          size: Vector2(brickWidth, brickHeight),
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
          children: [RectangleHitbox()],
        );

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();
    game.score.value++; // Add this line

    if (game.world.children.query<Brick>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}
