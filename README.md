# TempoSample
A sample Unreal project intended to be a reference for recommended settings, convenient scripts, code examples, and project organization when using the [Tempo](https://github.com/tempo-sim/Tempo) plugins.

If you are starting an Unreal project from scratch with Tempo, you can use this as a [template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) repo.

## Convenience Scripts
- Run `Scripts/Clean.sh` (from the project root) to remove previous build artifacts.
- Run `Scripts/Build.sh` (from the project root) to build the project.
- Run `Scripts/Run.sh` (from the project root) to open the project in the Unreal Editor.
- Run `Scripts/Package.sh` (from the project root) to package into a standalone executable. It will end up in a folder `Packaged/<platform>` under the project root.
> [!Note]
> On Windows, if you have the cross compile toolchain installed, you can specify the argument `Linux` to package for Linux.
