from dataclasses import dataclass
import os
import pathlib
import shutil
import subprocess

import copier
from rich.prompt import Confirm


@dataclass(frozen=True)
class Git:
    repo: str
    subdirectory: str
    vcs_ref: str | None = None


PROJECT_DIR = pathlib.Path(os.path.dirname(__file__)).parent.parent.absolute()
COPIER_CACHE = f"{PROJECT_DIR}/.copier"


DEPENDENCIES = {
    "ambientcg": Git(
        repo="gh:VenitStudios/AmbientCG",
        subdirectory="addons/ambientcg",
    ),
    "gevp": Git(
        repo="gh:DAShoe1/Godot-Easy-Vehicle-Physics",
        subdirectory="addons/gevp",
    ),
    "raytraced_audio": Git(
        repo="gh:WhoStoleMyCoffee/raytraced-audio",
        subdirectory="addons/raytraced_audio",
    ),
    "shaderV": Git(
        repo="gh:arkology/ShaderV",
        subdirectory="addons/shaderV",
    ),
    "quick_layout_changer": Git(
        repo="gh:mathrick/godot-quick-layout-changer",
        subdirectory="addons/quick_layout_changer",
    ),
    "SphynxMotionBlurToolkit": Git(
        repo="gh:sphynx-owner/JFA_driven_motion_blur_addon",
        subdirectory="addons/SphynxMotionBlurToolkit",
        vcs_ref="Godot-4.4",
    ),
}


subprocess.run(["dotnet", "godotenv", "addons", "install"], shell=True)


for name, git in DEPENDENCIES.items():
    normalize = os.path.normpath

    dependency = normalize(f"{COPIER_CACHE}/{name}")
    addon = normalize(f"{dependency}/{git.subdirectory}")
    target = normalize(f"{PROJECT_DIR}/addons/{name}")

    if not pathlib.Path(dependency).exists() or Confirm.ask(
        f"Update dependency {name}?"
    ):
        copier.run_copy(git.repo, dependency, vcs_ref=git.vcs_ref)

    try:
        subprocess.run(["mklink", "/j", target, addon], shell=True, capture_output=True)
    except PermissionError:
        if pathlib.Path(target).exists():
            shutil.rmtree(target)
        shutil.copytree(addon, target)
