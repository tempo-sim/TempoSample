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
> If you do forget, run a `git submodule update --init --recursive Plugins/Tempo` to fix it

Refer to the [Compatibility](https://github.com/tempo-sim/Tempo/tree/release#compatibility), [Prerequisites](https://github.com/tempo-sim/Tempo/tree/release?tab=readme-ov-file#prerequisites), and [Environment Variables](https://github.com/tempo-sim/Tempo/tree/release?tab=readme-ov-file#environment-variables) sections from Tempo.

## Content
This project includes some free ([Creative Commons License](https://creativecommons.org/licenses/by/4.0/)) content for demonstration, the default environment and street sweeper. Most Tempo projects start by replacing that with domain-specific content.

## Code
This project contains very little code. For an example of how you can write your own RPCs and expose them to Python using Tempo, check out the [Greeter](https://github.com/tempo-sim/Greeter/) example plugin. This plugin is included in the TempoSample project, but you can disable them (by editing the uproject file) or remove it once you get the idea. You can follow the same patterns to add services and RPCs to your own project code.

## TempoROS
[TempoROS](https://github.com/tempo-sim/TempoROS) is a standalone plugin, developed by the same authors, included in `Tempo` as a submodule. The `TempoROS` and `TempoROSBridge` plugins (the latter of which translates and forwards Tempo messages to and from ROS) are disabled by default in the `TempoSample` project. If you use ROS, enable them by by editing the uproject file.

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
