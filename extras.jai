// Auto-generated utility macros

BeginEndDrawing :: () #expand {
	BeginDrawing();
	`defer EndDrawing();
}
BeginEndDrawing :: (block: Code) #expand {
	BeginDrawing();
	#insert block;
	EndDrawing();
}

BeginEndMode2D :: (camera: Camera2D) #expand {
	BeginMode2D(camera);
	`defer EndMode2D();
}
BeginEndMode2D :: (camera: Camera2D, block: Code) #expand {
	BeginMode2D(camera);
	#insert block;
	EndMode2D();
}

BeginEndMode3D :: (camera: Camera3D) #expand {
	BeginMode3D(camera);
	`defer EndMode3D();
}
BeginEndMode3D :: (camera: Camera3D, block: Code) #expand {
	BeginMode3D(camera);
	#insert block;
	EndMode3D();
}

BeginEndTextureMode :: (target: RenderTexture2D) #expand {
	BeginTextureMode(target);
	`defer EndTextureMode();
}
BeginEndTextureMode :: (target: RenderTexture2D, block: Code) #expand {
	BeginTextureMode(target);
	#insert block;
	EndTextureMode();
}

BeginEndShaderMode :: (shader: Shader) #expand {
	BeginShaderMode(shader);
	`defer EndShaderMode();
}
BeginEndShaderMode :: (shader: Shader, block: Code) #expand {
	BeginShaderMode(shader);
	#insert block;
	EndShaderMode();
}

BeginEndBlendMode :: (mode: s32) #expand {
	BeginBlendMode(mode);
	`defer EndBlendMode();
}
BeginEndBlendMode :: (mode: s32, block: Code) #expand {
	BeginBlendMode(mode);
	#insert block;
	EndBlendMode();
}

BeginEndScissorMode :: (x: s32, y: s32, width: s32, height: s32) #expand {
	BeginScissorMode(x, y, width, height);
	`defer EndScissorMode();
}
BeginEndScissorMode :: (x: s32, y: s32, width: s32, height: s32, block: Code) #expand {
	BeginScissorMode(x, y, width, height);
	#insert block;
	EndScissorMode();
}

BeginEndVrStereoMode :: (config: VrStereoConfig) #expand {
	BeginVrStereoMode(config);
	`defer EndVrStereoMode();
}
BeginEndVrStereoMode :: (config: VrStereoConfig, block: Code) #expand {
	BeginVrStereoMode(config);
	#insert block;
	EndVrStereoMode();
}

