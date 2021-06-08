LIGHTGRAY  :: Color.{ 200, 200, 200, 255 };  // Light Gray
GRAY       :: Color.{ 130, 130, 130, 255 };  // Gray
DARKGRAY   :: Color.{ 80, 80, 80, 255 };     // Dark Gray
YELLOW     :: Color.{ 253, 249, 0, 255 };    // Yellow
GOLD       :: Color.{ 255, 203, 0, 255 };    // Gold
ORANGE     :: Color.{ 255, 161, 0, 255 };    // Orange
PINK       :: Color.{ 255, 109, 194, 255 };  // Pink
RED        :: Color.{ 230, 41, 55, 255 };    // Red
MAROON     :: Color.{ 190, 33, 55, 255 };    // Maroon
GREEN      :: Color.{ 0, 228, 48, 255 };     // Green
LIME       :: Color.{ 0, 158, 47, 255 };     // Lime
DARKGREEN  :: Color.{ 0, 117, 44, 255 };     // Dark Green
SKYBLUE    :: Color.{ 102, 191, 255, 255 };  // Sky Blue
BLUE       :: Color.{ 0, 121, 241, 255 };    // Blue
DARKBLUE   :: Color.{ 0, 82, 172, 255 };     // Dark Blue
PURPLE     :: Color.{ 200, 122, 255, 255 };  // Purple
VIOLET     :: Color.{ 135, 60, 190, 255 };   // Violet
DARKPURPLE :: Color.{ 112, 31, 126, 255 };   // Dark Purple
BEIGE      :: Color.{ 211, 176, 131, 255 };  // Beige
BROWN      :: Color.{ 127, 106, 79, 255 };   // Brown
DARKBROWN  :: Color.{ 76, 63, 47, 255 };     // Dark Brown
WHITE      :: Color.{ 255, 255, 255, 255 };  // White
BLACK      :: Color.{ 0, 0, 0, 255 };        // Black
BLANK      :: Color.{ 0, 0, 0, 0 };          // Blank (Transparent)
MAGENTA    :: Color.{ 255, 0, 255, 255 };    // Magenta
RAYWHITE   :: Color.{ 245, 245, 245, 255 };  // My own White (raylib logo)

using PixelFormat :: enum u32 {
    UNCOMPRESSED_GRAYSCALE :: 1;    // 8 bit per pixel (no alpha)
    UNCOMPRESSED_GRAY_ALPHA;        // 8*2 bpp (2 channels)
    UNCOMPRESSED_R5G6B5;            // 16 bpp
    UNCOMPRESSED_R8G8B8;            // 24 bpp
    UNCOMPRESSED_R5G5B5A1;          // 16 bpp (1 bit alpha)
    UNCOMPRESSED_R4G4B4A4;          // 16 bpp (4 bit alpha)
    UNCOMPRESSED_R8G8B8A8;          // 32 bpp
    UNCOMPRESSED_R32;               // 32 bpp (1 channel - float)
    UNCOMPRESSED_R32G32B32;         // 32*3 bpp (3 channels - float)
    UNCOMPRESSED_R32G32B32A32;      // 32*4 bpp (4 channels - float)
    COMPRESSED_DXT1_RGB;            // 4 bpp (no alpha)
    COMPRESSED_DXT1_RGBA;           // 4 bpp (1 bit alpha)
    COMPRESSED_DXT3_RGBA;           // 8 bpp
    COMPRESSED_DXT5_RGBA;           // 8 bpp
    COMPRESSED_ETC1_RGB;            // 4 bpp
    COMPRESSED_ETC2_RGB;            // 4 bpp
    COMPRESSED_ETC2_EAC_RGBA;       // 8 bpp
    COMPRESSED_PVRT_RGB;            // 4 bpp
    COMPRESSED_PVRT_RGBA;           // 4 bpp
    COMPRESSED_ASTC_4x4_RGBA;       // 8 bpp
    COMPRESSED_ASTC_8x8_RGBA;       // 2 bpp
}

using ConfigFlag :: enum u32 {
    FLAG_RESERVED           :: 1;
    FLAG_FULLSCREEN_MODE    :: 2;
    FLAG_WINDOW_RESIZABLE   :: 4;
    FLAG_WINDOW_UNDECORATED :: 8;
    FLAG_WINDOW_TRANSPARENT :: 16;
    FLAG_WINDOW_HIDDEN      :: 128;
    FLAG_WINDOW_ALWAYS_RUN  :: 256;
    FLAG_MSAA_4X_HINT       :: 32;
    FLAG_VSYNC_HINT         :: 64;
}

TraceLogType :: enum {
    LOG_ALL;
    LOG_TRACE;
    LOG_DEBUG;
    LOG_INFO;
    LOG_WARNING;
    LOG_ERROR;
    LOG_FATAL;
    LOG_NONE;
}

Color :: struct {
    r: u8;
    g: u8;
    b: u8;
    a: u8;
}

CameraType :: enum {
    CAMERA_PERSPECTIVE;
    CAMERA_ORTHOGRAPHIC;
}

CameraMode :: enum {
    CAMERA_CUSTOM;
    CAMERA_FREE;
    CAMERA_ORBITAL;
    CAMERA_FIRST_PERSON;
    CAMERA_THIRD_PERSON;
}

Camera :: Camera3D;

Camera2D :: struct {
    offset: Vector2;
    target: Vector2;
    rotation: float32;
    zoom: float32;
}

Camera3D :: struct {
    position: Vector3;
    target: Vector3;
    up: Vector3;
    fovy: float32;
    type: CameraType;
}

Image :: struct {
    data: *void;
    width: s32;
    height: s32;
    mipmaps: s32 = 1;
    format: PixelFormat;
}

Texture        :: Texture2D;
TextureCubemap :: Texture2D;

Texture2D :: struct {
    id: u32;
    width: s32;
    height: s32;
    mipmaps: s32;
    format: PixelFormat;
}

RenderTexture :: RenderTexture2D;

RenderTexture2D :: struct {
    id: u32;
    texture: Texture2D;
    depth: Texture2D;
    depthTexture: bool;
}

Ray :: struct {
    position: Vector3;
    direction: Vector3;
}

Rectangle :: struct {
    x: float32;
    y: float32;
    width: float32;
    height: float32;
}

Font :: struct {
    baseSize: s32;
    charsCount: s32;
    texture: Texture2D;
    recs: *Rectangle;
    chars: *CharInfo;
}

SpriteFont :: Font;

// Window-related functions
InitWindow               :: (width: s32, height: s32, title: *u8) #foreign raylib;
WindowShouldClose        :: () -> bool #foreign raylib;
CloseWindow              :: () #foreign raylib;
IsWindowReady            :: () -> bool #foreign raylib;
IsWindowMinimized        :: () -> bool #foreign raylib;
IsWindowResized          :: () -> bool #foreign raylib;
IsWindowHidden           :: () -> bool #foreign raylib;
IsWindowFullscreen       :: () -> bool #foreign raylib;
ToggleFullscreen         :: () #foreign raylib;
UnhideWindow             :: () #foreign raylib;
HideWindow               :: () #foreign raylib;
SetWindowIcon            :: (image: Image) #foreign raylib;
SetWindowTitle           :: (title: *u8) #foreign raylib;
SetWindowPosition        :: (x: s32, y: s32) #foreign raylib;
SetWindowMonitor         :: (monitor: s32) #foreign raylib;
SetWindowMinSize         :: (width: s32, height: s32) #foreign raylib;
SetWindowSize            :: (width: s32, height: s32) #foreign raylib;
GetWindowHandle          :: () -> *void #foreign raylib;
GetScreenWidth           :: () -> s32 #foreign raylib;
GetScreenHeight          :: () -> s32 #foreign raylib;
GetMonitorCount          :: () -> s32 #foreign raylib;
GetMonitorWidth          :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorHeight         :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorPhysicalWidth  :: (monitor: s32) -> s32 #foreign raylib;
GetMonitorPhysicalHeight :: (monitor: s32) -> s32 #foreign raylib;
GetWindowPosition        :: () -> Vector2 #foreign raylib;
GetMonitorName           :: (monitor: s32) -> *u8 #foreign raylib;
GetClipboardText         :: () -> *u8 #foreign raylib;
SetClipboardText         :: (text: *u8) #foreign raylib;

// Cursor-related functions
ShowCursor     :: () #foreign raylib;
HideCursor     :: () #foreign raylib;
IsCursorHidden :: () -> bool #foreign raylib;
EnableCursor   :: () #foreign raylib;
DisableCursor  :: () #foreign raylib;

// Drawing-related functions
ClearBackground  :: (color: Color) #foreign raylib;
BeginDrawing     :: () #foreign raylib;
EndDrawing       :: () #foreign raylib;
BeginMode2D      :: (camera: Camera2D) #foreign raylib;
EndMode2D        :: () #foreign raylib;
BeginMode3D      :: (camera: Camera3D) #foreign raylib;
EndMode3D        :: () #foreign raylib;
BeginTextureMode :: (target: RenderTexture2D) #foreign raylib;
EndTextureMode   :: () #foreign raylib;
BeginScissorMode :: (x: s32, y: s32, width: s32, height: s32) #foreign raylib;
EndScissorMode   :: () #foreign raylib;

GetMouseRay        :: (mousePosition: Vector2, camera: Camera) -> Ray #foreign raylib;
GetCameraMatrix    :: (camera: Camera) -> Matrix #foreign raylib;
GetCameraMatrix2D  :: (camera: Camera2D) -> Matrix #foreign raylib;
GetWorldToScreen   :: (position: Vector3, camera: Camera) -> Vector2 #foreign raylib;
GetWorldToScreenEx :: (position: Vector3, camera: Camera, width: s32, height: s32) -> Vector2 #foreign raylib;
GetWorldToScreen2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raylib;
GetScreenToWorld2D :: (position: Vector2, camera: Camera2D) -> Vector2 #foreign raylib;

// Timing-related functions
SetTargetFPS :: (fps: s32) #foreign raylib;
GetFPS       :: () -> s32 #foreign raylib;
GetFrameTime :: () -> float32 #foreign raylib;
GetTime      :: () -> float64 #foreign raylib;

// Color-related functions
ColorToInt          :: (color: Color) -> int #foreign raylib;
ColorNormalize      :: (color: Color) -> Vector4 #foreign raylib;
ColorFromNormalized :: (normalized: Vector4) -> Color #foreign raylib;
ColorToHSV          :: (color: Color) -> Vector3 #foreign raylib;
ColorFromHSV        :: (hsv: Vector3) -> Color #foreign raylib;
GetColor            :: (hexValue: s32) -> Color #foreign raylib;
Fade                :: (color: Color, alpha: float32) -> Color #foreign raylib;

// Misc. functions
SetConfigFlags      :: (flags: ConfigFlag) #foreign raylib;
SetTraceLogLevel    :: (logType: TraceLogType) #foreign raylib;
SetTraceLogExit     :: (logType: TraceLogType) #foreign raylib;
SetTraceLogCallback :: (callback: TraceLogType, text: *u8, varargs: *void) #foreign raylib;
TraceLog            :: (logType: TraceLogType, text: *u8, varargs: *void) #foreign raylib;
TakeScreenshot      :: (fileName: *u8) #foreign raylib;
GetRandomValue      :: (min: s32, max: s32) -> s32 #foreign raylib;

// Files management functions
LoadFileData          :: (fileName: *u8, bytesRead: *u8) -> *u8 #foreign raylib;
SaveFileData          :: (fileName: *u8, data: *void, bytesToWrite: u32) #foreign raylib;
LoadFileText          :: (fileName: *u8) -> *u8 #foreign raylib;
SaveFileText          :: (fileName: *u8, text: *u8) #foreign raylib;
FileExists            :: (fileName: *u8) -> bool #foreign raylib;
IsFileExtension       :: (fileName: *u8, ext: *u8) -> bool #foreign raylib;
DirectoryExists       :: (dirPath: *u8) -> bool #foreign raylib;
GetExtension          :: (fileName: *u8) -> *u8 #foreign raylib;
GetFileName           :: (filePath: *u8) -> *u8 #foreign raylib;
GetFileNameWithoutExt :: (filePath: *u8) -> *u8 #foreign raylib;
GetDirectoryPath      :: (filePath: *u8) -> *u8 #foreign raylib;
GetPrevDirectoryPath  :: (dirPath: *u8) -> *u8 #foreign raylib;
GetWorkingDirectory   :: () -> *u8 #foreign raylib;
GetDirectoryFiles     :: (dirPath: *u8, count: *s32) -> **u8 #foreign raylib;
ClearDirectoryFiles   :: () #foreign raylib;
ChangeDirectory       :: (dir: *u8) -> bool #foreign raylib;
IsFileDropped         :: () -> bool #foreign raylib;
GetDroppedFiles       :: (count: *s32) #foreign raylib;
ClearDroppedFiles     :: () #foreign raylib;
GetFileModTime        :: (fileName: *u8) -> float32 #foreign raylib;

CompressData   :: (data: *u8, dataLength: s32, compDataLength: *s32) -> *u8 #foreign raylib;
DecompressData :: (compData: *u8, compDataLength: s32, dataLength: *s32) -> *u8 #foreign raylib;

// Persistent storage management
SaveStorageValue :: (position: u32, value: s32) #foreign raylib;
LoadStorageValue :: (position: u32) -> s32 #foreign raylib;

OpenURL :: (url: *u8) #foreign raylib;

KeyboardKey :: enum {
    KEY_APOSTROPHE    :: 39;
    KEY_COMMA         :: 44;
    KEY_MINUS         :: 45;
    KEY_PERIOD        :: 46;
    KEY_SLASH         :: 47;
    KEY_ZERO          :: 48;
    KEY_ONE           :: 49;
    KEY_TWO           :: 50;
    KEY_THREE         :: 51;
    KEY_FOUR          :: 52;
    KEY_FIVE          :: 53;
    KEY_SIX           :: 54;
    KEY_SEVEN         :: 55;
    KEY_EIGHT         :: 56;
    KEY_NINE          :: 57;
    KEY_SEMICOLON     :: 59;
    KEY_EQUAL         :: 61;
    KEY_A             :: 65;
    KEY_B             :: 66;
    KEY_C             :: 67;
    KEY_D             :: 68;
    KEY_E             :: 69;
    KEY_F             :: 70;
    KEY_G             :: 71;
    KEY_H             :: 72;
    KEY_I             :: 73;
    KEY_J             :: 74;
    KEY_K             :: 75;
    KEY_L             :: 76;
    KEY_M             :: 77;
    KEY_N             :: 78;
    KEY_O             :: 79;
    KEY_P             :: 80;
    KEY_Q             :: 81;
    KEY_R             :: 82;
    KEY_S             :: 83;
    KEY_T             :: 84;
    KEY_U             :: 85;
    KEY_V             :: 86;
    KEY_W             :: 87;
    KEY_X             :: 88;
    KEY_Y             :: 89;
    KEY_Z             :: 90;
    // Function keys
    KEY_SPACE         :: 32;
    KEY_ESCAPE        :: 256;
    KEY_ENTER         :: 257;
    KEY_TAB           :: 258;
    KEY_BACKSPACE     :: 259;
    KEY_INSERT        :: 260;
    KEY_DELETE        :: 261;
    KEY_RIGHT         :: 262;
    KEY_LEFT          :: 263;
    KEY_DOWN          :: 264;
    KEY_UP            :: 265;
    KEY_PAGE_UP       :: 266;
    KEY_PAGE_DOWN     :: 267;
    KEY_HOME          :: 268;
    KEY_END           :: 269;
    KEY_CAPS_LOCK     :: 280;
    KEY_SCROLL_LOCK   :: 281;
    KEY_NUM_LOCK      :: 282;
    KEY_PRINT_SCREEN  :: 283;
    KEY_PAUSE         :: 284;
    KEY_F1            :: 290;
    KEY_F2            :: 291;
    KEY_F3            :: 292;
    KEY_F4            :: 293;
    KEY_F5            :: 294;
    KEY_F6            :: 295;
    KEY_F7            :: 296;
    KEY_F8            :: 297;
    KEY_F9            :: 298;
    KEY_F10           :: 299;
    KEY_F11           :: 300;
    KEY_F12           :: 301;
    KEY_LEFT_SHIFT    :: 340;
    KEY_LEFT_CONTROL  :: 341;
    KEY_LEFT_ALT      :: 342;
    KEY_LEFT_SUPER    :: 343;
    KEY_RIGHT_SHIFT   :: 344;
    KEY_RIGHT_CONTROL :: 345;
    KEY_RIGHT_ALT     :: 346;
    KEY_RIGHT_SUPER   :: 347;
    KEY_KB_MENU       :: 348;
    KEY_LEFT_BRACKET  :: 91;
    KEY_BACKSLASH     :: 92;
    KEY_RIGHT_BRACKET :: 93;
    KEY_GRAVE         :: 96;
    // Keypad keys
    KEY_KP_0          :: 320;
    KEY_KP_1          :: 321;
    KEY_KP_2          :: 322;
    KEY_KP_3          :: 323;
    KEY_KP_4          :: 324;
    KEY_KP_5          :: 325;
    KEY_KP_6          :: 326;
    KEY_KP_7          :: 327;
    KEY_KP_8          :: 328;
    KEY_KP_9          :: 329;
    KEY_KP_DECIMAL    :: 330;
    KEY_KP_DIVIDE     :: 331;
    KEY_KP_MULTIPLY   :: 332;
    KEY_KP_SUBTRACT   :: 333;
    KEY_KP_ADD        :: 334;
    KEY_KP_ENTER      :: 335;
    KEY_KP_EQUAL      :: 336;
}

MouseButton :: enum {
    MOUSE_LEFT_BUTTON;
    MOUSE_RIGHT_BUTTON;
    MOUSE_MIDDLE_BUTTON;
}

// Input-related functions: keyboard
IsKeyPressed  :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyDown     :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyReleased :: (key: KeyboardKey) -> bool #foreign raylib;
IsKeyUp       :: (key: KeyboardKey) -> bool #foreign raylib;
SetExitKey    :: (key: KeyboardKey) #foreign raylib;
GetKeyPressed :: () -> KeyboardKey #foreign raylib;

// Input-related functions: gamepads
GamepadNumber :: enum {
    GAMEPAD_PLAYER1;
    GAMEPAD_PLAYER2;
    GAMEPAD_PLAYER3;
    GAMEPAD_PLAYER4;
}

GamepadButton :: enum {
    GAMEPAD_BUTTON_UNKNOWN;

    // This is normally a DPAD
    GAMEPAD_BUTTON_LEFT_FACE_UP;
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT;
    GAMEPAD_BUTTON_LEFT_FACE_DOWN;
    GAMEPAD_BUTTON_LEFT_FACE_LEFT;

    // This normally corresponds with PlayStation and Xbox controllers
    // XBOX: [Y,X,A,B]
    // PS3: [Triangle,Square,Cross,Circle]
    // No support for 6 button controllers though..
    GAMEPAD_BUTTON_RIGHT_FACE_UP;
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT;
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN;
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT;

    // Triggers
    GAMEPAD_BUTTON_LEFT_TRIGGER_1;
    GAMEPAD_BUTTON_LEFT_TRIGGER_2;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1;
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2;

    // These are buttons in the center of the gamepad
    GAMEPAD_BUTTON_MIDDLE_LEFT;     //PS3 Select
    GAMEPAD_BUTTON_MIDDLE;          //PS Button/XBOX Button
    GAMEPAD_BUTTON_MIDDLE_RIGHT;    //PS3 Start

    // These are the joystick press in buttons
    GAMEPAD_BUTTON_LEFT_THUMB;
    GAMEPAD_BUTTON_RIGHT_THUMB;
}

GamepadAxis :: enum {
    // This is here just for error checking
    GAMEPAD_AXIS_UNKNOWN;

    // Left stick
    GAMEPAD_AXIS_LEFT_X;
    GAMEPAD_AXIS_LEFT_Y;

    // Right stick
    GAMEPAD_AXIS_RIGHT_X;
    GAMEPAD_AXIS_RIGHT_Y;

    // Pressure levels for the back triggers
    GAMEPAD_AXIS_LEFT_TRIGGER;     // [1..-1] (pressure-level)
    GAMEPAD_AXIS_RIGHT_TRIGGER;    // [1..-1] (pressure-level)
}

IsGamepadAvailable      :: (gamepad: GamepadNumber) -> bool #foreign raylib;
IsGamepadName           :: (gamepad: GamepadNumber, name: *u8) -> bool #foreign raylib;
GetGamepadName          :: (gamepad: GamepadNumber) -> *u8 #foreign raylib;
IsGamepadButtonPressed  :: (gamepad: GamepadNumber, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonDown     :: (gamepad: GamepadNumber, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonReleased :: (gamepad: GamepadNumber, button: GamepadButton) -> bool #foreign raylib;
IsGamepadButtonUp       :: (gamepad: GamepadNumber, button: GamepadButton) -> bool #foreign raylib;
GetGamepadButtonPressed :: () -> GamepadButton #foreign raylib;
GetGamepadAxisCount     :: (gamepad: GamepadNumber) -> GamepadAxis #foreign raylib;
GetGamepadAxisMovement  :: (gamepad: GamepadNumber, axis: GamepadAxis) -> float32 #foreign raylib;

// Input-related functions: mouse
IsMouseButtonPressed  :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonDown     :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonReleased :: (button: MouseButton) -> bool #foreign raylib;
IsMouseButtonUp       :: (button: MouseButton) -> bool #foreign raylib;
GetMouseX             :: () -> s32 #foreign raylib;
GetMouseY             :: () -> s32 #foreign raylib;
GetMousePosition      :: () -> Vector2 #foreign raylib;
SetMousePosition      :: (x: s32, y: s32) #foreign raylib;
SetMouseOffset        :: (offsetX: s32, offsetY: s32) #foreign raylib;
SetMouseScale         :: (scaleX: float32, scaleY: float32) #foreign raylib;
GetMouseWheelMove     :: () -> s32 #foreign raylib;

// Input-related functions: touch
GetTouchX        :: () -> s32 #foreign raylib;
GetTouchY        :: () -> s32 #foreign raylib;
GetTouchPosition :: (index: s32) -> Vector2 #foreign raylib;

GestureType :: enum {
    GESTURE_NONE        :: 0;
    GESTURE_TAP         :: 1;
    GESTURE_DOUBLETAP   :: 2;
    GESTURE_HOLD        :: 4;
    GESTURE_DRAG        :: 8;
    GESTURE_SWIPE_RIGHT :: 16;
    GESTURE_SWIPE_LEFT  :: 32;
    GESTURE_SWIPE_UP    :: 64;
    GESTURE_SWIPE_DOWN  :: 128;
    GESTURE_PINCH_IN    :: 256;
    GESTURE_PINCH_OUT   :: 512;
}

// Gestures and Touch Handling Functions (Module: gestures)
SetGesturesEnabled     :: (gestureFlags: GestureType) #foreign raylib;
IsGestureDetected      :: (gesture: GestureType) -> bool #foreign raylib;
GetGestureDetected     :: () -> GestureType #foreign raylib;
GetTouchPointsCount    :: () -> s32 #foreign raylib;
GetGestureHoldDuration :: () -> float32 #foreign raylib;
GetGestureDragVector   :: () -> Vector2 #foreign raylib;
GetGestureDragAngle    :: () -> float32 #foreign raylib;
GetGesturePinchVector  :: () -> Vector2 #foreign raylib;
GetGesturePinchAngle   :: () -> float32 #foreign raylib;

SetCameraMode :: (camera: Camera, mode: CameraMode) #foreign raylib;
UpdateCamera  :: (camera: *Camera) #foreign raylib;

// SetCameraPanControl        :: (int panKey) #foreign raylib;
// SetCameraAltControl        :: (int altKey) #foreign raylib;
// SetCameraSmoothZoomControl :: (int szKey) #foreign raylib;
// SetCameraMoveControls      :: (int frontKey, int backKey, int rightKey, int leftKey, int upKey, int downKey) #foreign raylib;

// Basic shapes drawing functions
DrawPixel                 :: (posX: s32, posY: s32, color: Color) #foreign raylib;
DrawPixelV                :: (position: Vector2, color: Color) #foreign raylib;
DrawLine                  :: (startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) #foreign raylib;
DrawLineV                 :: (startPos: Vector2, endPos: Vector2, color: Color) #foreign raylib;
DrawLineEx                :: (startPos: Vector2, endPos: Vector2, thick: float32, color: Color) #foreign raylib;
DrawLineBezier            :: (startPos: Vector2, endPos: Vector2, thick: float32, color: Color) #foreign raylib;
DrawLineStrip             :: (points: *Vector2, numPoints: s32, color: Color) #foreign raylib;
DrawCircle                :: (centerX: s32, centerY: s32, radius: float32, color: Color) #foreign raylib;
DrawCircleSector          :: (center: Vector2, radius: float32, startAngle: s32, endAngle: s32, segments: s32, color: Color) #foreign raylib;
DrawCircleSectorLines     :: (center: Vector2, radius: float32, startAngle: s32, endAngle: s32, segments: s32, color: Color) #foreign raylib;
DrawCircleGradient        :: (centerX: s32, centerY: s32, radius: float32, color1: Color, color2: Color) #foreign raylib;
DrawCircleV               :: (center: Vector2, radius: float32, color: Color) #foreign raylib;
DrawCircleLines           :: (centerX: s32, centerY: s32, radius: float32, color: Color) #foreign raylib;
DrawEllipse               :: (centerX: s32, centerY: s32, radiusH: float32, radiusV: float32, color: Color) #foreign raylib;
DrawEllipseLines          :: (centerX: s32, centerY: s32, radiusH: float32, radiusV: float32, color: Color) #foreign raylib;
DrawRing                  :: (center: Vector2, innerRadius: float32, outerRadius: float32, startAngle: s32, endAngle: s32, segments: s32, color: Color) #foreign raylib;
DrawRingLines             :: (center: Vector2, innerRadius: float32, outerRadius: float32, startAngle: s32, endAngle: s32, segments: s32, color: Color) #foreign raylib;
DrawRectangle             :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) #foreign raylib;
DrawRectangleV            :: (position: Vector2, size: Vector2, color: Color) #foreign raylib;
DrawRectangleRec          :: (rec: Rectangle, color: Color) #foreign raylib;
DrawRectanglePro          :: (rec: Rectangle, origin: Vector2, rotation: float32, color: Color) #foreign raylib;
DrawRectangleGradientV    :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) #foreign raylib;
DrawRectangleGradientH    :: (posX: s32, posY: s32, width: s32, height: s32, color1: Color, color2: Color) #foreign raylib;
DrawRectangleGradientEx   :: (rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) #foreign raylib;
DrawRectangleLines        :: (posX: s32, posY: s32, width: s32, height: s32, color: Color) #foreign raylib;
DrawRectangleLinesEx      :: (rec: Rectangle, lineThick: s32, color: Color) #foreign raylib;
DrawRectangleRounded      :: (rec: Rectangle, roundness: float32, segments: s32, color: Color) #foreign raylib;
DrawRectangleRoundedLines :: (rec: Rectangle, roundness: float32, segments: s32, lineThick: s32, color: Color) #foreign raylib;
DrawTriangle              :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) #foreign raylib;
DrawTriangleLines         :: (v1: Vector2, v2: Vector2, v3: Vector2, color: Color) #foreign raylib;
DrawTriangleFan           :: (points: *Vector2, numPoints: s32, color: Color) #foreign raylib;
DrawTriangleStrip         :: (points: *Vector2, pointsCount: s32, color: Color) #foreign raylib;
DrawPoly                  :: (center: Vector2, sides: s32, radius: float32, rotation: float32, color: Color) #foreign raylib;
DrawPolyLines             :: (center: Vector2, sides: s32, radius: float32, rotation: float32, color: Color) #foreign raylib;

// Basic shapes collision detection functions
CheckCollisionRecs          :: (rec1: Rectangle, rec2: Rectangle) -> bool #foreign raylib;
CheckCollisionCircles       :: (center1: Vector2, radius1: float32, center2: Vector2, radius2: float32) -> bool #foreign raylib;
CheckCollisionCircleRec     :: (center: Vector2, radius: float32, rec: Rectangle) -> bool #foreign raylib;
GetCollisionRec             :: (rec1: Rectangle, rec2: Rectangle) -> Rectangle #foreign raylib;
CheckCollisionPointRec      :: (point: Vector2, rec: Rectangle) -> bool #foreign raylib;
CheckCollisionPointCircle   :: (point: Vector2, center: Vector2, radius: float32) -> bool #foreign raylib;
CheckCollisionPointTriangle :: (point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) -> bool #foreign raylib;

// Image loading functions
LoadImage              :: (fileName: *u8) -> Image #foreign raylib;
LoadImageEx            :: (pixels: *Color, width: s32, height: s32) -> Image #foreign raylib;
LoadImagePro           :: (data: *void, width: s32, height: s32, format: s32) -> Image #foreign raylib;
LoadImageRaw           :: (fileName: *u8, width: s32, height: s32, format: s32, headerSize: s32) -> Image #foreign raylib;
UnloadImage            :: (image: Image) #foreign raylib;
ExportImage            :: (image: Image, fileName: *u8) #foreign raylib;
ExportImageAsCode      :: (image: Image, fileName: *u8) #foreign raylib;
GetImageData           :: (image: Image) -> *Color #foreign raylib;
GetImageDataNormalized :: (image: Image) -> *Vector4 #foreign raylib;

// Image generation functions
GenImageColor          :: (width: s32, height: s32, color: Color) -> Image #foreign raylib;
GenImageGradientV      :: (width: s32, height: s32, top: Color, bottom: Color) -> Image #foreign raylib;
GenImageGradientH      :: (width: s32, height: s32, left: Color, right: Color) -> Image #foreign raylib;
GenImageGradientRadial :: (width: s32, height: s32, density: float32, inner: Color, outer: Color) -> Image #foreign raylib;
GenImageChecked        :: (width: s32, height: s32, checksX: s32, checksY: s32, col1: Color, col2: Color) -> Image #foreign raylib;
GenImageWhiteNoise     :: (width: s32, height: s32, factor: float32) -> Image #foreign raylib;
GenImagePerlinNoise    :: (width: s32, height: s32, offsetX: float32, offsetY: float32, scale: float32) -> Image #foreign raylib;
GenImageCellular       :: (width: s32, height: s32, tileSize: s32) -> Image #foreign raylib;

// Image manipulation functions
ImageCopy             :: (image: Image) -> Image #foreign raylib;
ImageFromImage        :: (image: Image, rec: Rectangle) -> Image #foreign raylib;
ImageText             :: (text: *u8, fontSize: s32, color: Color) -> Image #foreign raylib;
ImageTextEx           :: (font: Font, text: *u8, fontSize: float32, spacing: float32, tint: Color) -> Image #foreign raylib;
ImageToPOT            :: (image: *Image, fillColor: Color) #foreign raylib;
ImageFormat           :: (image: *Image, newFormat: s32) #foreign raylib;
ImageAlphaMask        :: (image: *Image, alphaMask: Image) #foreign raylib;
ImageAlphaClear       :: (image: *Image, color: Color, threshold: float32) #foreign raylib;
ImageAlphaCrop        :: (image: *Image, threshold: float32) #foreign raylib;
ImageAlphaPremultiply :: (image: *Image) #foreign raylib;
ImageCrop             :: (image: *Image, crop: Rectangle) #foreign raylib;
ImageResize           :: (image: *Image, newWidth: s32, newHeight: s32) #foreign raylib;
ImageResizeNN         :: (image: *Image, newWidth: s32, newHeight: s32) #foreign raylib;
ImageResizeCanvas     :: (image: *Image, newWidth: s32, newHeight: s32, offsetX: s32, offsetY: s32, color: Color) #foreign raylib;
ImageMipmaps          :: (image: *Image) #foreign raylib;
ImageDither           :: (image: *Image, rBpp: s32, gBpp: s32, bBpp: s32, aBpp: s32) #foreign raylib;
ImageFlipVertical     :: (image: *Image) #foreign raylib;
ImageFlipHorizontal   :: (image: *Image) #foreign raylib;
ImageRotateCW         :: (image: *Image) #foreign raylib;
ImageRotateCCW        :: (image: *Image) #foreign raylib;
ImageColorTint        :: (image: *Image, color: Color) #foreign raylib;
ImageColorInvert      :: (image: *Image) #foreign raylib;
ImageColorGrayscale   :: (image: *Image) #foreign raylib;
ImageColorContrast    :: (image: *Image, contrast: float32) #foreign raylib;
ImageColorBrightness  :: (image: *Image, brightness: s32) #foreign raylib;
ImageColorReplace     :: (image: *Image, color: Color, replace: Color) #foreign raylib;
ImageExtractPalette   :: (image: Image, maxPaletteSize: s32, extractCount: *s32) -> *Color #foreign raylib;
GetImageAlphaBorder   :: (image: Image, threshold: float32) -> Rectangle #foreign raylib;

// Image drawing functions
ImageClearBackground    :: (dst: *Image, color: Color) #foreign raylib;
ImageDrawPixel          :: (dst: *Image, posX: s32, posY: s32, color: Color) #foreign raylib;
ImageDrawPixelV         :: (dst: *Image, position: Vector2, color: Color) #foreign raylib;
ImageDrawLine           :: (dst: *Image, startPosX: s32, startPosY: s32, endPosX: s32, endPosY: s32, color: Color) #foreign raylib;
ImageDrawLineV          :: (dst: *Image, start: Vector2, end: Vector2, color: Color) #foreign raylib;
ImageDrawCircle         :: (dst: *Image, centerX: s32, centerY: s32, radius: s32, color: Color) #foreign raylib;
ImageDrawCircleV        :: (dst: *Image, center: Vector2, radius: s32, color: Color) #foreign raylib;
ImageDrawRectangle      :: (dst: *Image, posX: s32, posY: s32, width: s32, height: s32, color: Color) #foreign raylib;
ImageDrawRectangleV     :: (dst: *Image, position: Vector2, size: Vector2, color: Color) #foreign raylib;
ImageDrawRectangleRec   :: (dst: *Image, rec: Rectangle, color: Color) #foreign raylib;
ImageDrawRectangleLines :: (dst: *Image, rec: Rectangle, thick: s32, color: Color) #foreign raylib;
ImageDraw               :: (dst: *Image, src: Image, srcRec: Rectangle, dstRec: Rectangle, tint: Color) #foreign raylib;
ImageDrawText           :: (dst: *Image, position: Vector2, text: *u8, fontSize: s32, color: Color) #foreign raylib;
ImageDrawTextEx         :: (dst: *Image, position: Vector2, font: Font, text: *u8, fontSize: float32, spacing: float32, color: Color) #foreign raylib;

// Texture loading functions
LoadTexture          :: (fileName:  *u8) -> Texture2D #foreign raylib;
LoadTextureFromImage :: (image: Image) -> Texture2D #foreign raylib;
LoadTextureCubemap   :: (image: Image, layoutType: s32) -> TextureCubemap #foreign raylib;
LoadRenderTexture    :: (width: s32, height: s32) -> RenderTexture2D #foreign raylib;
UnloadTexture        :: (texture: Texture2D) #foreign raylib;
UnloadRenderTexture  :: (target: RenderTexture2D) #foreign raylib;
UpdateTexture        :: (texture: Texture2D, pixels: *void) #foreign raylib;
GetTextureData       :: (texture: Texture2D) -> Image #foreign raylib;
GetScreenData        :: () -> Image #foreign raylib;

// Texture configuration functions
GenTextureMipmaps :: (texture: *Texture2D) #foreign raylib;
SetTextureFilter  :: (texture: Texture2D, filterMode: s32) #foreign raylib;
SetTextureWrap    :: (texture: Texture2D, wrapMode: s32) #foreign raylib;

NPatchInfo :: struct {
    sourceRec: Rectangle;
    left: s32;
    top: s32;
    right: s32;
    bottom: s32;
    type: s32;
}

// Texture drawing functions
DrawTexture       :: (texture: Texture2D, posX: s32, posY: s32, tint: Color) #foreign raylib;
DrawTextureV      :: (texture: Texture2D, position: Vector2, tint: Color) #foreign raylib;
DrawTextureEx     :: (texture: Texture2D, position: Vector2, rotation: float32, scale: float32, tint: Color) #foreign raylib;
DrawTextureRec    :: (texture: Texture2D, sourceRec: Rectangle, position: Vector2, tint: Color) #foreign raylib;
DrawTextureQuad   :: (texture: Texture2D, tiling: Vector2, offset: Vector2, quad: Rectangle, tint: Color) #foreign raylib;
DrawTexturePro    :: (texture: Texture2D, sourceRec: Rectangle, destRec: Rectangle, origin: Vector2, rotation: float32, tint: Color) #foreign raylib;
DrawTextureNPatch :: (texture: Texture2D, nPatchInfo: NPatchInfo, destRec: Rectangle, origin: Vector2, rotation: float32, tint: Color) #foreign raylib;

// Image/Texture misc functions
GetPixelDataSize  :: (width: s32, height: s32, format: s32) -> s32 #foreign raylib;

CharInfo :: struct {
    value: s32;
    offsetX: s32;
    offsetY: s32;
    advanceX: s32;
    image: Image;
}

// Font loading/unloading functions
GetFontDefault    :: () -> Font #foreign raylib;
LoadFont          :: (fileName: *u8) -> Font #foreign raylib;
LoadFontEx        :: (fileName: *u8, fontSize: s32, fontChars: *s32, charsCount: s32) -> Font #foreign raylib;
LoadFontFromImage :: (image: Image, key: Color, firstChar: s32) -> Font #foreign raylib;
LoadFontData      :: (fileName: *u8, fontSize: s32, fontChars: *s32, charsCount: s32, type: s32) -> *CharInfo #foreign raylib;
GenImageFontAtlas :: (chars: *CharInfo, recs: **Rectangle, charsCount: s32, fontSize: s32, padding: s32, packMethod: s32) -> Image #foreign raylib;
UnloadFont        :: (font: Font) #foreign raylib;

// Text drawing functions
DrawFPS           :: (posX: s32, posY: s32) #foreign raylib;
DrawText          :: (text: *u8, posX: s32, posY: s32, fontSize: s32, color: Color) #foreign raylib;
DrawTextEx        :: (font: Font, text: *u8, position: Vector2, fontSize: float32, spacing: float32, tint: Color) #foreign raylib;
DrawTextRec       :: (font: Font, text: *u8, rec: Rectangle, fontSize: float32, spacing: float32, wordWrap: bool, tint: Color) #foreign raylib;
DrawTextRecEx     :: (font: Font, text: *u8, rec: Rectangle, fontSize: float32, spacing: float32, wordWrap: bool, tint: Color, selectStart: s32, selectLength: s32, selectTint: Color, selectBackTint: Color) #foreign raylib;
DrawTextCodepoint :: (font: Font, codepoint: s32, position: Vector2, scale: float32, tint: Color) #foreign raylib;

// Text misc. functions
MeasureText   :: (text: *u8, fontSize: s32) -> s32 #foreign raylib;
MeasureTextEx :: (font: Font, text: *u8, fontSize: float32, spacing: float32) -> Vector2 #foreign raylib;
GetGlyphIndex :: (font: Font, codepoint: s32) -> s32 #foreign raylib;

// Text strings management functions (no utf8 strings, only byte chars)
TextCopy      :: (dst: *u8, src: *u8) -> s32 #foreign raylib;
TextIsEqual   :: (text1: *u8, text2: *u8) -> bool #foreign raylib;
TextLength    :: (text: *u8) -> u32 #foreign raylib;
TextFormat    :: (text: *u8, va_list: *void) -> *u8 #foreign raylib;
TextSubtext   :: (text: *u8, position: s32, length: s32) -> *u8 #foreign raylib;
TextReplace   :: (text: *u8, replace: *u8, by: *u8) -> *u8 #foreign raylib;
TextInsert    :: (text: *u8, insert: *u8, position: s32) -> *u8 #foreign raylib;
TextJoin      :: (textList: **u8, count: s32, delimiter: *u8) -> *u8 #foreign raylib;
TextSplit     :: (text: *u8, delimiter: u8, count: *s32) -> **u8 #foreign raylib;
TextAppend    :: (text: *u8, append: *u8, position: *s32) #foreign raylib;
TextFindIndex :: (text: *u8, find: *u8) -> s32 #foreign raylib;
TextToUpper   :: (text: *u8) -> *u8 #foreign raylib;
TextToLower   :: (text: *u8) -> *u8 #foreign raylib;
TextToPascal  :: (text: *u8) -> *u8 #foreign raylib;
TextToInteger :: (text: *u8) -> s32 #foreign raylib;
TextToUtf8    :: (codepoints: *s32, length: s32) -> *u8 #foreign raylib;

// UTF8 text strings management functions
GetCodepoints      :: (text: *u8, count: *s32) -> *u32 #foreign raylib;
GetCodepointsCount :: (text: *u8) -> u32 #foreign raylib;
GetNextCodepoint   :: (text: *u8, bytesProcessed: *s32) -> u32 #foreign raylib;
CodepointToUtf8    :: (codepoint: s32, byteLength: *s32) -> *u8 #foreign raylib;

// Basic geometric 3D shapes drawing functions
DrawLine3D        :: (startPos: Vector3, endPos: Vector3, color: Color) #foreign raylib;
DrawPoint3D       :: (position: Vector3, color: Color) #foreign raylib;
DrawCircle3D      :: (center: Vector3, radius: float32, rotationAxis: Vector3, rotationAngle: float32, color: Color) #foreign raylib;
DrawCube          :: (position: Vector3, width: float32, height: float32, length: float32, color: Color) #foreign raylib;
DrawCubeV         :: (position: Vector3, size: Vector3, color: Color) #foreign raylib;
DrawCubeWires     :: (position: Vector3, width: float32, height: float32, length: float32, color: Color) #foreign raylib;
DrawCubeWiresV    :: (position: Vector3, size: Vector3, color: Color) #foreign raylib;
DrawCubeTexture   :: (texture: Texture2D, position: Vector3, width: float32, height: float32, length: float32, color: Color) #foreign raylib;
DrawSphere        :: (centerPos: Vector3, radius: float32, color: Color) #foreign raylib;
DrawSphereEx      :: (centerPos: Vector3, radius: float32, rings: s32, slices: s32, color: Color) #foreign raylib;
DrawSphereWires   :: (centerPos: Vector3, radius: float32, rings: s32, slices: s32, color: Color) #foreign raylib;
DrawCylinder      :: (position: Vector3, radiusTop: float32, radiusBottom: float32, height: float32, slices: s32, color: Color) #foreign raylib;
DrawCylinderWires :: (position: Vector3, radiusTop: float32, radiusBottom: float32, height: float32, slices: s32, color: Color) #foreign raylib;
DrawPlane         :: (centerPos: Vector3, size: Vector2, color: Color) #foreign raylib;
DrawRay           :: (ray: Ray, color: Color) #foreign raylib;
DrawGrid          :: (slices: s32, spacing: float32) #foreign raylib;

Mesh :: struct {
    vertexCount: s32;
    triangleCount: s32;
    vertices: *float32;
    texcoords: *float32;
    texcoords2: *float32;
    normals: *float32;
    tangents: *float32;
    colors: *u8;
    indices: *s16;
    animVertices: *float32;
    animNormals: *float32;
    boneIds: *s32;
    boneWeights: *float32;
    vaoId: u32;
    vboId: *u32;
}

Shader :: struct {
    id: u32;
    locs: *s32;
}

MaterialMap :: struct {
    texture: Texture2D;
    color: Color;
    value: float32;
}

Material :: struct {
    shader: Shader;
    maps: *MaterialMap;
    params: *float;
}

Transform :: struct {
    translation: Vector3;
    rotation: Quaternion;
    scale: Vector3;
}

RayHitInfo :: struct {
    hit: bool;
    distance: float32;
    position: Vector3;
    normal: Vector3;
}

BoneInfo :: struct {
    name: [32]u8;
    parent: s32;
}

BoundingBox :: struct {
    min, max: Vector3;
}

Model :: struct {
    transform: Matrix;
    meshCount: s32;
    meshes: *Mesh;
    materialCount: s32;
    materials: *Material;
    meshMaterial: *s32;
    boneCount: s32;
    bones: BoneInfo;
    bindPose: *Transform;
}

ModelAnimation :: struct {
    boneCount: s32;
    bones: *BoneInfo;
    frameCount: s32;
    framePoses: **Transform;
}

// Model loading/unloading functions
LoadModel         :: (fileName: *u8) -> Model #foreign raylib;
LoadModelFromMesh :: (mesh: Mesh) -> Model #foreign raylib;
UnloadModel       :: (model: Model) #foreign raylib;

// Mesh loading/unloading functions
LoadMeshes :: (fileName: *u8, meshCount: *s32) -> *Mesh #foreign raylib;
ExportMesh :: (mesh: Mesh, fileName: *u8) #foreign raylib;
UnloadMesh :: (mesh: Mesh) #foreign raylib;

// Material loading/unloading functions
LoadMaterials        :: (fileName: *u8, materialCount: *s32) -> *Material #foreign raylib;
LoadMaterialDefault  :: () -> Material #foreign raylib;
UnloadMaterial       :: (material: Material) #foreign raylib;
SetMaterialTexture   :: (material: *Material, mapType: s32, texture: Texture2D) #foreign raylib;
SetModelMeshMaterial :: (model: *Model, meshId: s32, materialId: s32) #foreign raylib;

// Model animations loading/unloading functions
LoadModelAnimations   :: (fileName: *u8, animsCount: *s32) -> *ModelAnimation #foreign raylib;
UpdateModelAnimation  :: (model: Model, anim: ModelAnimation, frame: s32) #foreign raylib;
UnloadModelAnimation  :: (anim: ModelAnimation) #foreign raylib;
IsModelAnimationValid :: (model: Model, anim: ModelAnimation) -> bool #foreign raylib;

// Mesh generation functions
GenMeshPoly       :: (sides: s32, radius: float32) -> Mesh #foreign raylib;
GenMeshPlane      :: (width: float32, length: float32, resX: s32, resZ: s32) -> Mesh #foreign raylib;
GenMeshCube       :: (width: float32, height: float32, length: float32) -> Mesh #foreign raylib;
GenMeshSphere     :: (radius: float32, rings: s32, slices: s32) -> Mesh #foreign raylib;
GenMeshHemiSphere :: (radius: float32, rings: s32, slices: s32) -> Mesh #foreign raylib;
GenMeshCylinder   :: (radius: float32, height: float32, slices: s32) -> Mesh #foreign raylib;
GenMeshTorus      :: (radius: float32, size: float32, radSeg: s32, sides: s32) -> Mesh #foreign raylib;
GenMeshKnot       :: (radius: float32, size: float32, radSeg: s32, sides: s32) -> Mesh #foreign raylib;
GenMeshHeightmap  :: (heightmap: Image, size: Vector3) -> Mesh #foreign raylib;
GenMeshCubicmap   :: (cubicmap: Image, cubeSize: Vector3) -> Mesh #foreign raylib;

// Mesh manipulation functions
MeshBoundingBox :: (mesh: Mesh) -> BoundingBox #foreign raylib;
MeshTangents    :: (mesh: *Mesh) #foreign raylib;
MeshBinormals   :: (mesh: *Mesh) #foreign raylib;

// Model drawing functions
DrawModel        :: (model: Model, position: Vector3, scale: float32, tint: Color) #foreign raylib;
DrawModelEx      :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float32, scale: Vector3, tint: Color) #foreign raylib;
DrawModelWires   :: (model: Model, position: Vector3, scale: float32, tint: Color) #foreign raylib;
DrawModelWiresEx :: (model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: float32, scale: Vector3, tint: Color) #foreign raylib;
DrawBoundingBox  :: (box: BoundingBox, color: Color) #foreign raylib;
DrawBillboard    :: (camera: Camera, texture: Texture2D, center: Vector3, size: float, tint: Color) #foreign raylib;
DrawBillboardRec :: (camera: Camera, texture: Texture2D, sourceRec: Rectangle, center: Vector3, size: float32, tint: Color) #foreign raylib;

// Collision detection functions
CheckCollisionSpheres     :: (centerA: Vector3, radiusA: float32, centerB: Vector3, radiusB: float32) -> bool #foreign raylib;
CheckCollisionBoxes       :: (box1: BoundingBox, box2: BoundingBox) -> bool #foreign raylib;
CheckCollisionBoxSphere   :: (box: BoundingBox, center: Vector3, radius: float32) -> bool #foreign raylib;
CheckCollisionRaySphere   :: (ray: Ray, center: Vector3, radius: float32) -> bool #foreign raylib;
CheckCollisionRaySphereEx :: (ray: Ray, center: Vector3, radius: float32, collisionPoint: *Vector3) -> bool #foreign raylib;
CheckCollisionRayBox      :: (ray: Ray, box: BoundingBox) -> bool #foreign raylib;
GetCollisionRayModel      :: (ray: Ray, model: Model) -> RayHitInfo #foreign raylib;
GetCollisionRayTriangle   :: (ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) -> RayHitInfo #foreign raylib;
GetCollisionRayGround     :: (ray: Ray, groundHeight: float32) -> RayHitInfo #foreign raylib;

// Image generation functions
// RLAPI Image GenImageColor(int width, int height, Color color);                                           // Generate image: plain color
// RLAPI Image GenImageGradientV(int width, int height, Color top, Color bottom);                           // Generate image: vertical gradient
// RLAPI Image GenImageGradientH(int width, int height, Color left, Color right);                           // Generate image: horizontal gradient
// RLAPI Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);      // Generate image: radial gradient
// RLAPI Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);    // Generate image: checked
// RLAPI Image GenImageWhiteNoise(int width, int height, float factor);                                     // Generate image: white noise
// RLAPI Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);           // Generate image: perlin noise
// RLAPI Image GenImageCellular(int width, int height, int tileSize);                                       // Generate image: cellular algorithm. Bigger tileSize means bigger cells

// Shader functions
LoadShader     :: (vsFileName: *u8, fsFileName: *u8) -> Shader #foreign raylib;
LoadShaderCode :: (vsCode: *u8, fsCode: *u8) -> Shader #foreign raylib;
UnloadShader   :: (shader: Shader)  #foreign raylib;

// Shader functions
BeginShaderMode :: (shader: Shader)  #foreign raylib;
EndShaderMode   :: ()  #foreign raylib;
BeginBlendMode  :: (mode: s32)  #foreign raylib;
EndBlendMode    :: ()  #foreign raylib;

// Image manipulation functions
// RLAPI Image ImageCopy(Image image);                                                                      // Create an image duplicate (useful for transformations)
// RLAPI Image ImageFromImage(Image image, Rectangle rec);                                                  // Create an image from another image piece
// RLAPI Image ImageText(const char *text, int fontSize, Color color);                                      // Create an image from text (default font)
// RLAPI Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);         // Create an image from text (custom sprite font)
// RLAPI void ImageToPOT(Image *image, Color fillColor);                                                    // Convert image to POT (power-of-two)
// RLAPI void ImageFormat(Image *image, int newFormat);                                                     // Convert image data to desired format
// RLAPI void ImageAlphaMask(Image *image, Image alphaMask);                                                // Apply alpha mask to image
// RLAPI void ImageAlphaClear(Image *image, Color color, float threshold);                                  // Clear alpha channel to desired color
// RLAPI void ImageAlphaCrop(Image *image, float threshold);                                                // Crop image depending on alpha value
// RLAPI void ImageAlphaPremultiply(Image *image);                                                          // Premultiply alpha channel
// RLAPI void ImageCrop(Image *image, Rectangle crop);                                                      // Crop an image to a defined rectangle
// RLAPI void ImageResize(Image *image, int newWidth, int newHeight);                                       // Resize image (Bicubic scaling algorithm)
// RLAPI void ImageResizeNN(Image *image, int newWidth,int newHeight);                                      // Resize image (Nearest-Neighbor scaling algorithm)
// RLAPI void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);  // Resize canvas and fill with color
// RLAPI void ImageMipmaps(Image *image);                                                                   // Generate all mipmap levels for a provided image
// RLAPI void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);                            // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
// RLAPI void ImageFlipVertical(Image *image);                                                              // Flip image vertically
// RLAPI void ImageFlipHorizontal(Image *image);                                                            // Flip image horizontally
// RLAPI void ImageRotateCW(Image *image);                                                                  // Rotate image clockwise 90deg
// RLAPI void ImageRotateCCW(Image *image);                                                                 // Rotate image counter-clockwise 90deg
// RLAPI void ImageColorTint(Image *image, Color color);                                                    // Modify image color: tint
// RLAPI void ImageColorInvert(Image *image);                                                               // Modify image color: invert
// RLAPI void ImageColorGrayscale(Image *image);                                                            // Modify image color: grayscale
// RLAPI void ImageColorContrast(Image *image, float contrast);                                             // Modify image color: contrast (-100 to 100)
// RLAPI void ImageColorBrightness(Image *image, int brightness);                                           // Modify image color: brightness (-255 to 255)
// RLAPI void ImageColorReplace(Image *image, Color color, Color replace);                                  // Modify image color: replace color
// RLAPI Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount);                    // Extract color palette from image to maximum size (memory should be freed)
// RLAPI Rectangle GetImageAlphaBorder(Image image, float threshold);                                       // Get image alpha border rectangle

// Image drawing functions
// RLAPI void ImageClearBackground(Image *dst, Color color);                                                // Clear image background with given color
// RLAPI void ImageDrawPixel(Image *dst, int posX, int posY, Color color);                                  // Draw pixel within an image
// RLAPI void ImageDrawPixelV(Image *dst, Vector2 position, Color color);                                   // Draw pixel within an image (Vector version)
// RLAPI void ImageDrawLine(Image *dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color); // Draw line within an image
// RLAPI void ImageDrawLineV(Image *dst, Vector2 start, Vector2 end, Color color);                          // Draw line within an image (Vector version)
// RLAPI void ImageDrawCircle(Image *dst, int centerX, int centerY, int radius, Color color);               // Draw circle within an image
// RLAPI void ImageDrawCircleV(Image *dst, Vector2 center, int radius, Color color);                        // Draw circle within an image (Vector version)
// RLAPI void ImageDrawRectangle(Image *dst, int posX, int posY, int width, int height, Color color);       // Draw rectangle within an image
// RLAPI void ImageDrawRectangleV(Image *dst, Vector2 position, Vector2 size, Color color);                 // Draw rectangle within an image (Vector version)
// RLAPI void ImageDrawRectangleRec(Image *dst, Rectangle rec, Color color);                                // Draw rectangle within an image
// RLAPI void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);                   // Draw rectangle lines within an image
// RLAPI void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);             // Draw a source image within a destination image (tint applied to source)
// RLAPI void ImageDrawText(Image *dst, Vector2 position, const char *text, int fontSize, Color color);     // Draw text (default font) within an image (destination)
// RLAPI void ImageDrawTextEx(Image *dst, Vector2 position, Font font, const char *text, float fontSize, float spacing, Color color); // Draw text (custom sprite font) within an image (destination)

// Texture loading functions
// RLAPI Texture2D LoadTexture(const char *fileName);                                                       // Load texture from file into GPU memory (VRAM)
// RLAPI Texture2D LoadTextureFromImage(Image image);                                                       // Load texture from image data
// RLAPI TextureCubemap LoadTextureCubemap(Image image, int layoutType);                                    // Load cubemap from image, multiple image cubemap layouts supported
// RLAPI RenderTexture2D LoadRenderTexture(int width, int height);                                          // Load texture for rendering (framebuffer)
// RLAPI void UnloadTexture(Texture2D texture);                                                             // Unload texture from GPU memory (VRAM)
// RLAPI void UnloadRenderTexture(RenderTexture2D target);                                                  // Unload render texture from GPU memory (VRAM)
// RLAPI void UpdateTexture(Texture2D texture, const void *pixels);                                         // Update GPU texture with new data
// RLAPI Image GetTextureData(Texture2D texture);                                                           // Get pixel data from GPU texture and return an Image
// RLAPI Image GetScreenData(void);                                                                         // Get pixel data from screen buffer and return an Image (screenshot)

// Texture configuration functions
// RLAPI void GenTextureMipmaps(Texture2D *texture);                                                        // Generate GPU mipmaps for a texture
// RLAPI void SetTextureFilter(Texture2D texture, int filterMode);                                          // Set texture scaling filter mode
// RLAPI void SetTextureWrap(Texture2D texture, int wrapMode);                                              // Set texture wrapping mode

// Texture drawing functions
// RLAPI void DrawTexture(Texture2D texture, int posX, int posY, Color tint);                               // Draw a Texture2D
// RLAPI void DrawTextureV(Texture2D texture, Vector2 position, Color tint);                                // Draw a Texture2D with position defined as Vector2
// RLAPI void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);  // Draw a Texture2D with extended parameters
// RLAPI void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);         // Draw a part of a texture defined by a rectangle
// RLAPI void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);  // Draw texture quad with tiling and offset parameters
// RLAPI void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);       // Draw a part of a texture defined by a rectangle with 'pro' parameters
// RLAPI void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);  // Draws a texture (or part of it) that stretches or shrinks nicely

// Image/Texture misc functions
// RLAPI int GetPixelDataSize(int width, int height, int format);                                           // Get pixel data size in bytes (image or texture)

// Audio related functions
InitAudioDevice    :: ()  #foreign raylib;
CloseAudioDevice   :: ()  #foreign raylib;
IsAudioDeviceReady :: () -> bool #foreign raylib;
LoadWave           :: (fileName: *u8) -> Wave #foreign raylib;
LoadSound          :: (fileName: *u8) -> Sound #foreign raylib;
LoadSoundFromWave  :: (wave: Wave) -> Sound #foreign raylib;
UpdateSound        :: (sound: Sound, data: *void, samplesCount: s32)  #foreign raylib;
UnloadWave         :: (wave: Wave)  #foreign raylib;
UnloadSound        :: (sound: Sound)  #foreign raylib;
PlaySoundMulti     :: (sound: Sound)  #foreign raylib;
StopSoundMulti     :: ()  #foreign raylib;
GetSoundsPlaying   :: () -> s32 #foreign raylib;
IsSoundPlaying     :: (sound: Sound) -> bool #foreign raylib;
SetSoundVolume     :: (sound: Sound, volume: float)  #foreign raylib;
SetSoundPitch      :: (sound: Sound, pitch: float)  #foreign raylib;
PlaySound          :: (sound: Sound)  #foreign raylib;
StopSound          :: (sound: Sound)  #foreign raylib;
PauseSound         :: (sound: Sound)  #foreign raylib;
ResumeSound        :: (sound: Sound)  #foreign raylib;

Wave :: struct {
    sampleCount: u32;
    sampleRate: u32;
    sampleSize: u32;
    channels: u32;
    data: *void;
}

AudioStream :: struct {
    sampleRate: u32;
    sampleSize: u32;
    channels: u32;
    buffer: *rAudioBuffer;
}

Sound :: struct {
    sampleCount: u32;
    stream: AudioStream;
}

rAudioBuffer :: struct { /* only used as a pointer in this header */ }

#scope_file
Math       :: #import "Math";
Vector2    :: Math.Vector2;
Vector3    :: Math.Vector3;
Vector4    :: Math.Vector4;
Matrix     :: Math.Matrix4;
Quaternion :: Math.Quaternion;

#scope_export
#if OS == .WINDOWS {
    raylib :: #foreign_library "win/raylib";
} else #if OS == .LINUX {
} else #if OS = .MACOS {
}
