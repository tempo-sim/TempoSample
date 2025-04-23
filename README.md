# TempoSample
A sample Unreal project intended to be a reference for recommended settings, convenient scripts, code examples, and project organization when using [Tempo](https://github.com/tempo-sim/Tempo).

If you are starting an Unreal project from scratch with Tempo, you can use this as a [template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) repo and rename the project with `Scripts/Rename.sh`.

> [!Warning]
> The Rename script is only intended to rename a freshly-cloned TempoSample project. It will not help you rename your project after you've started making changes and adding files.

## Convenience Scripts
- Run `Scripts/Clean.sh` (from the project root) to remove previous build artifacts.
- Run `Scripts/Build.sh` (from the project root) to build the project.
- Run `Scripts/Run.sh` (from the project root) to open the project in the Unreal Editor.
- Run `Scripts/Package.sh` (from the project root) to package into a standalone executable. It will end up in a folder `Packaged/<platform>` under the project root.
