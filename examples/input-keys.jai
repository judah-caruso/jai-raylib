WIDTH  :: 1280;
HEIGHT :: 720;

main :: () {
   rl.InitWindow(WIDTH, HEIGHT, "Hello, Raylib!");
   defer rl.CloseWindow();

   rl.SetTargetFPS(60);

   ball_pos := rl.Vec2.{ x = WIDTH / 2, y = HEIGHT / 2 };

   while !rl.WindowShouldClose() {
      dt := rl.GetFrameTime();

      if rl.IsKeyDown(.RIGHT) then ball_pos.x += 200 * dt;
      if rl.IsKeyDown(.LEFT)  then ball_pos.x -= 200 * dt;
      if rl.IsKeyDown(.UP)    then ball_pos.y -= 200 * dt;
      if rl.IsKeyDown(.DOWN)  then ball_pos.y += 200 * dt;

      rl.BeginEndDrawing(#code {
         rl.ClearBackground(rl.RAYWHITE);
         rl.DrawText("Move the ball with arrow keys", 10, 10, 24, rl.BLACK);
         rl.DrawCircleV(ball_pos, 50, rl.RED);
      });
   }
}

#import "Basic";

rl :: #import,file "../module.jai"(true);
