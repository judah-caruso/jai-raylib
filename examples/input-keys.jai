WIDTH  :: 1280;
HEIGHT :: 720;

main :: () {
   rl.InitWindow(WIDTH, HEIGHT, "Hello, Raylib!");
   defer rl.CloseWindow();

   rl.SetTargetFPS(60);

   ball_pos := rl.Vector2.{ WIDTH / 2, HEIGHT / 2 };

   while !rl.WindowShouldClose() {
      dt := rl.GetFrameTime();

      if rl.IsKeyDown(xx rl.KeyboardKey.RIGHT) then ball_pos.x += 200 * dt;
      if rl.IsKeyDown(xx rl.KeyboardKey.LEFT)  then ball_pos.x -= 200 * dt;
      if rl.IsKeyDown(xx rl.KeyboardKey.UP)    then ball_pos.y -= 200 * dt;
      if rl.IsKeyDown(xx rl.KeyboardKey.DOWN)  then ball_pos.y += 200 * dt;

      rl.BeginEndDrawing(#code {
         rl.ClearBackground(rl.RAYWHITE);
         rl.DrawText("Move the ball with arrow keys", 10, 10, 24, rl.BLACK);
         rl.DrawCircleV(ball_pos, 50, rl.RED);
      });
   }
}

rl :: #import,file "../module.jai";
