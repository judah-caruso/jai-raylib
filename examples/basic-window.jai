main :: () {
   rl.InitWindow(1280, 720, "Hello, Raylib!");
   defer rl.CloseWindow();

   rl.SetTargetFPS(60);

   while !rl.WindowShouldClose() {
      rl.BeginEndDrawing();

      rl.ClearBackground(rl.RAYWHITE);
      rl.DrawText("Hello, from Raylib!", 10, 10, 24, rl.BLACK);
   }
}

rl :: #import,file "../module.jai";
