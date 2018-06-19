# IronRure-Batteries

[![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Windows.svg)](https://badge.fury.io/nu/IronRure.Batteries-Windows)
[![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Linux.svg)](https://badge.fury.io/nu/IronRure.Batteries-Linux)
[![NuGet version](https://badge.fury.io/nu/IronRure.Batteries-Darwin.svg)](https://badge.fury.io/nu/IronRure.Batteries-Darwin)
[![Build status](https://ci.appveyor.com/api/projects/status/662xbciv1k2hoddc?svg=true)](https://ci.appveyor.com/project/iwillspeak/IronRure-Batteries)
[![MIT License](https://img.shields.io/github/license/iwillspeak/IronRure-Batteries.svg)](https://github.com/iwillspeak/IronRure-Batteries/blob/master/LICENSE)

Nuget Package of Rust Regex C API.

This repository contains pre-built versions of the rust regex library for Windows, Linux and macOS. You shouldn't need to add a reference to these libraries yourself, they're referenced from [`IronRure`](https://github.com/iwillspeak/IronRure). It might come in useful if you need to target a new platform though.

## Windows Gotchas

The windows build requires the `vc140` redistributable to work. This means you need to have Visual Studio 2015 or the [Visual Studio 2015 C++ Runtime](https://www.microsoft.com/en-gb/download/details.aspx?id=48145) installed for it to load. If not you'll get an exception which claims that `rure.dll` can't be found.
