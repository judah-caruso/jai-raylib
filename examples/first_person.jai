Block :: struct {
    height: float;
    position: Vector3;
    color: Color;
}

randomize_blocks :: (blocks: []Block) {
    for *block: blocks {
        block.height = cast(float)GetRandomValue(1, 12);

        block.color.r = cast(u8)GetRandomValue(20, 255);
        block.color.g = cast(u8)GetRandomValue(10, 55);
        block.color.b = 30;
        block.color.a = 255;

        block.position.x = cast(float)GetRandomValue(-15, 15);
        block.position.y = block.height / 2;
        block.position.z = cast(float)GetRandomValue(-15, 15);
    }
}

main :: () {
    width, height :: 800, 600;

    camera := Camera3D.{
        position = Vector3.{ 4, 2, 4 },
        target   = Vector3.{ 0, 1.8, 0 },
        up       = Vector3.{ 0, 1, 0 },
        fovy     = 60,
        type     = .CAMERA_PERSPECTIVE
    };

    blocks: [20]Block;
    randomize_blocks(blocks);

    InitWindow(width, height, "Raylib 3D First Person Test");
    SetCameraMode(camera, .CAMERA_FIRST_PERSON);
    SetTargetFPS(144);

    while !WindowShouldClose() {
        UpdateCamera(*camera);

        if IsKeyReleased(.KEY_SPACE) randomize_blocks(blocks);

        BeginDrawing();
            ClearBackground(RAYWHITE);

            BeginMode3D(camera);
            {
                // Floor + 4 walls
                DrawPlane(Vector3.{}, Vector2.{ 32, 32 }, LIGHTGRAY);
                DrawCube(Vector3.{ -16, 2, 0 }, 1, 5, 32, BLUE);
                DrawCube(Vector3.{ 16, 2, 0 }, 1, 5, 32, LIME);
                DrawCube(Vector3.{ 0, 2, 16 }, 32, 5, 1, GOLD);
                DrawCube(Vector3.{ 0, 2, -16 }, 32, 5, 1, RED);

                for block: blocks {
                    DrawCube(block.position, 2.0, block.height, 2.0, block.color);
                    DrawCubeWires(block.position, 2.0, block.height, 2.0, BLACK);
                }
            }
            EndMode3D();

            DrawRectangle(10, 10, 220, 70, Fade(SKYBLUE, 0.5));
            DrawRectangleLines(10, 10, 220, 70, BLUE);

            DrawText("Controls:", 20, 20, 10, BLACK);
            DrawText("- Move: W, A, S, D", 40, 40, 10, DARKGRAY);
            DrawText("- Randomize: SPACE", 40, 60, 10, DARKGRAY);
        EndDrawing();
    }

    CloseWindow();
}

#load "../module.jai";

#import "Basic";
#import "Math";
