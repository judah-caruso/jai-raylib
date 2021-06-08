main :: () {
    width, height :: 800, 600;

    camera := Camera3D.{
        position = Vector3.{ 0, 10, 10 },
        up       = Vector3.{ 0, 1, 0 },
        fovy     = 45,
        type     = .CAMERA_PERSPECTIVE
    };

    color    := BLACK;
    position := Vector3.{};

    InitWindow(width, height, "Raylib 3D Camera Test");
    SetCameraMode(camera, .CAMERA_FREE);
    SetTargetFPS(144);

    while !WindowShouldClose() {
        UpdateCamera(*camera);

        if IsMouseButtonPressed(.MOUSE_LEFT_BUTTON) {
            color = RED;
        } else if IsMouseButtonPressed(.MOUSE_MIDDLE_BUTTON) {
            color = GREEN;
        } else if IsMouseButtonPressed(.MOUSE_RIGHT_BUTTON) {
            color = BLUE;
        }

        BeginDrawing();
            ClearBackground(RAYWHITE);

            BeginMode3D(camera);
                DrawCube(position, 2.0, 2.0, 2.0, color);
                DrawCubeWires(position, 2.0, 2.0, 2.0, BLACK);
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
