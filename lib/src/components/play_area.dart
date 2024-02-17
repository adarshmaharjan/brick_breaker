import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_labs/src/brick_breaker.dart';
import 'package:flutter/material.dart';

class PlayArea extends RectangleComponent with HasGameRef<BrickBreaker> {
  PlayArea()
      : super(
          paint: Paint()..color = const Color(0xfff2e8cf),
        );
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}