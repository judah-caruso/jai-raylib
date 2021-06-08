main :: () {
    width, height :: 800, 600;

    InitWindow(width, height, "Raylib 2D Test");
    SetTargetFPS(144);

    position := Vector2.{ -100, -100 };
    color := DARKBLUE;

    while !WindowShouldClose() {
        position = GetMousePosition();

        if IsMouseButtonPressed(.MOUSE_LEFT_BUTTON) {
            color = MAROON;
        } else if IsMouseButtonPressed(.MOUSE_MIDDLE_BUTTON) {
            color = LIME;
        } else if IsMouseButtonPressed(.MOUSE_RIGHT_BUTTON) {
            color = DARKBLUE;
        }

        BeginDrawing();
            ClearBackground(RAYWHITE);
            DrawCircleV(position, 40, color);
            DrawText("Hello, World", 10, 10, 24, BLACK);
            DrawFPS(10, 35);
        EndDrawing();
    }

    CloseWindow();
}

#load "../module.jai";

#import "Basic";
#import "Math";
