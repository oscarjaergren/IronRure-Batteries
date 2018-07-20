# IronRure-Batteries

[![MIT License](https://img.shields.io/github/license/iwillspeak/IronRure-Batteries.svg)](https://github.com/iwillspeak/IronRure-Batteries/blob/master/LICENSE)


| Runtimes         | Nuget package | Build         |
| ---------------  | ------------- | ------------- |
| windows          | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Windows.svg)](https://badge.fury.io/nu/IronRure.Batteries-Windows)  | [![Build status](https://ci.appveyor.com/api/projects/status/github/iwillspeak/IronRure-Batteries?branch=master&svg=true)](https://ci.appveyor.com/project/iwillspeak/IronRure-Batteries)  |
| linux            | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Linux.svg)](https://badge.fury.io/nu/IronRure.Batteries-Linux)      |  [![Build status](https://ci.appveyor.com/api/projects/status/github/iwillspeak/IronRure-Batteries?branch=master&svg=true)](https://ci.appveyor.com/project/iwillspeak/IronRure-Batteries) |
| osx              | [![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Darwin.svg)](https://badge.fury.io/nu/IronRure.Batteries-Darwin)    |  [![Build status](https://api.travis-ci.org/iwillspeak/IronRure-Batteries.svg?branch=master&svg=true)](https://api.travis-ci.org/iwillspeak/IronRure-Batteries) |


Nuget Package of Rust Regex C API.

This repository contains pre-built versions of the rust regex library for Windows, Linux and macOS. You shouldn't need to add a reference to these libraries yourself, they're referenced from [`IronRure`](https://github.com/iwillspeak/IronRure). It might come in useful if you need to target a new platform though.

## Windows Gotchas

The windows build requires the `vc140` redistributable to work. This means you need to have Visual Studio 2015 or the [Visual Studio 2015 C++ Runtime](https://www.microsoft.com/en-gb/download/details.aspx?id=48145) installed for it to load. If not you'll get an exception which claims that `rure.dll` can't be found.
