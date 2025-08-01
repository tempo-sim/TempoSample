# TempoSample

![overlay_sweeper_cropped](https://github.com/user-attachments/assets/a1433caf-60fd-4db0-b6ab-ebdd0d3e2dc5)

A sample Unreal project intended to be a reference for recommended settings and project organization when using [Tempo](https://github.com/tempo-sim/Tempo).

Looking for some help? Find us on [![Discord](https://img.shields.io/badge/Discord-Join%20Server-5865F2?logo=discord&logoColor=white)](https://discord.gg/bKa2hnGYnw)

## Getting Started
You can use this as a [template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) repo and rename the project with `Scripts/Rename.sh`.

> [!Warning]
> The Rename script is only intended to rename a freshly-cloned TempoSample project. It will not help you rename your project after you've started making changes and adding files.

Follow the instructions from the [Getting Started](https://github.com/tempo-sim/Tempo?tab=readme-ov-file#getting-started) video and instructions in Tempo.

> [!Warning]
> Don't forget to recurse submodules (so you get the Tempo plugins) when cloning:
`git clone <your_repo> --recurse-submodules`
> 
> If you do forget, run a `git submodule update --init Plugins/Tempo` to fix it

Refer to the [Compatibility](https://github.com/tempo-sim/Tempo/tree/release#compatibility), [Prerequisites](https://github.com/tempo-sim/Tempo/tree/release?tab=readme-ov-file#prerequisites), and [Environment Variables](https://github.com/tempo-sim/Tempo/tree/release?tab=readme-ov-file#environment-variables) sections from Tempo.

## Content
This project includes some free ([Creative Commons License](https://creativecommons.org/licenses/by/4.0/)) content for demonstration, the default environment, robot dog, and street sweeper. Most Tempo projects start by replacing that with domain-specific content.

The robot dog uses the [Locomotor](https://dev.epicgames.com/community/learning/tutorials/EkxO/unreal-engine-procedural-animation-with-a-locomotor) plugin, which was introduced in 5.6. If you are using 5.6 you can use it by:
- Enabling the Locomotor plugin for you project
- Add one `Content/UnitreeGo2/Blueprints/BP_Unitree_Go2` to your level, replacing the street sweeper
- Change the `RobotClass` field of your game mode to `BP_Unitree_Go2`

## Code
This project contains very little code. For an example of how you can write your own RPCs and expose them to Python using Tempo, check out the [Greeter](https://github.com/tempo-sim/Greeter/) example plugin. You can follow the same patterns in project code.

## Python API
To try out the Tempo Python API (after running `Plugins/Tempo/Setup.sh` and `Scripts/Build.sh`):
- Run `source ./TempoEnv/bin/activate` to activate the included virtual environment
- `pip install jupyter` and run `jupyter lab`
- Open `Content/Python/ExampleClients/TempoSimExamples.ipynb`

## Convenience Scripts
- Run `Scripts/Clean.sh` (from the project root) to remove previous build artifacts.
- Run `Scripts/Build.sh` (from the project root) to build the project.
- Run `Scripts/Run.sh` (from the project root) to open the project in the Unreal Editor.
- Run `Scripts/Package.sh` (from the project root) to package into a standalone executable. It will end up in a folder `Packaged/<platform>` under the project root.
