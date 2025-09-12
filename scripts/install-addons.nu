def dep [repository, target] {
    pnpm giget $"($repository)/addons/($target)" $"addons/($target)" --force-clean
}

#? godotenv
dotnet godotenv addons install

#? Repository based dependencies
dep gh:Bonkahe/SunshineClouds2 SunshineClouds2
dep gh:DAShoe1/Godot-Easy-Vehicle-Physics gevp
dep gh:TokisanGames/Sky3D sky_3d
dep gh:WhoStoleMyCoffee/raytraced-audio raytraced_audio
dep gh:VenitStudios/AmbientCG ambientcg
# dep gh:sphynx-owner/JFA_driven_motion_blur_addon SphynxMotionBlurToolkit
# pnpm giget gh:arkology/ShaderV/addons/shaderV addons/shaderV --force-clean
