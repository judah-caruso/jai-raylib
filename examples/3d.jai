main :: () {
    width, height :: 800, 600;

    InitWindow(width, height, "Raylib 3D Test");
    SetTargetFPS(144);

    camera := Camera3D.{
        position = Vector3.{ 0, 10, 10 },
        up       = Vector3.{ 0, 1, 0 },
        fovy     = 45,
        type     = .CAMERA_PERSPECTIVE
    };

    position := Vector3.{};

    while !WindowShouldClose() {
        BeginDrawing();
            ClearBackground(RAYWHITE);

            BeginMode3D(camera);
                DrawCube(position, 2.0, 2.0, 2.0, BLACK);
                DrawCubeWires(position, 2.0, 2.0, 2.0, MAROON);
                DrawGrid(10, 1.0);
            EndMode3D();

            DrawText("Hello, World", 10, 40, 20, DARKGRAY);
            DrawFPS(10, 10);
        EndDrawing();
    }

    CloseWindow();
}

#load "../module.jai";

#import "Basic";
#import "Math";
