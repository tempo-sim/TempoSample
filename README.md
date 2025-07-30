# TempoSample

<img width="1914" height="975" alt="Screenshot 2025-07-30 at 9 24 15 AM" src="https://github.com/user-attachments/assets/f8422d2a-37d2-4e70-a418-f72537fd8d80" />

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
This project includes some free ([Creative Commons License](https://creativecommons.org/licenses/by/4.0/)) content for demonstration, the default environment and robot dog. Most Tempo projects start by replacing that with domain-specific content.

> [!Warning]
> The robot dog uses the [Locomotor](https://dev.epicgames.com/community/learning/tutorials/EkxO/unreal-engine-procedural-animation-with-a-locomotor) plugin, which was introduced in 5.6. You will have to disable that plugin (and the robot dog won't work) on 5.4 or 5.5.

## Code
This project contains very little code. For an example of how you can write your own RPCs and expose them to Python using Tempo, check out the [Greeter](https://github.com/tempo-sim/Greeter/) example plugin. You can follow the same patterns in project code.

## Convenience Scripts
- Run `Scripts/Clean.sh` (from the project root) to remove previous build artifacts.
- Run `Scripts/Build.sh` (from the project root) to build the project.
- Run `Scripts/Run.sh` (from the project root) to open the project in the Unreal Editor.
- Run `Scripts/Package.sh` (from the project root) to package into a standalone executable. It will end up in a folder `Packaged/<platform>` under the project root.
