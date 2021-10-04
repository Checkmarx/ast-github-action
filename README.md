[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="">
    <img src="./logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">AST-CLI</h3>

<p align="center">
    Checkmarx CLI is a standalone Checkmarx tool.
<br />
    <a href="https://checkmarx.atlassian.net/wiki/spaces/AST/pages/3080454799/Quick+Start+Guide+-+CxAST+GitHub+Action"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Checkmarx/ast-github-action/issues/new/choose">Report Bug</a>
    ·
    <a href="https://github.com/Checkmarx/ast-github-action/issues/new/choose">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#setting-up">Setting Up</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This is a Wrapper to trigger scans to the latest version of AST through Docker to launch Checkmarx scans.


<!-- GETTING STARTED -->
## Getting Started

Installing the CLI tool is very simple.

### Prerequisites

There are no prerequisites, however we advise you to understand how Github Actions work

### Setting Up


Copy and paste the following snippet into your .yml file:
```
- name: Checkmarx AST Github Action
  uses: Checkmarx/ast-github-action@v0.28
```



## Usage

To see how you can use our tool, please refer to the [Documentation](https://checkmarx.atlassian.net/wiki/spaces/AST/pages/3080454799/Quick+Start+Guide+-+CxAST+GitHub+Action)


## Contribution

We appreciate feedback and contribution to the Github Action! Before you get started, please see the following:

- [Checkmarx contribution guidelines](docs/contributing.md)
- [Checkmarx Code of Conduct](docs/code_of_conduct.md)

** **

<!-- LICENSE -->
## License


Checkmarx GitHub Action

Copyright (C) 2021 Checkmarx

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.

<!-- CONTACT -->
## Contact

Checkmarx - AST Integrations Team

Project Link: [https://github.com/Checkmarx/ast-cli](https://github.com/Checkmarx/ast-github-action)


© 2021 Checkmarx Ltd. All Rights Reserved.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Checkmarx/ast-cli.svg?style=flat-square
[contributors-url]: https://github.com/Checkmarx/ast-cli/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Checkmarx/ast-cli.svg?style=flat-square
[forks-url]: https://github.com/Checkmarx/ast-cli/network/members
[stars-shield]: https://img.shields.io/github/stars/Checkmarx/ast-cli.svg?style=flat-square
[stars-url]: https://github.com/Checkmarx/ast-cli/stargazers
[issues-shield]: https://img.shields.io/github/issues/Checkmarx/ast-cli.svg?style=flat-square
[issues-url]: https://github.com/Checkmarx/ast-cli/issues
[license-shield]: https://img.shields.io/github/license/Checkmarx/ast-cli.svg?style=flat-square
[license-url]: https://github.com/Checkmarx/ast-cli/blob/master/LICENSE
[product-screenshot]: images/screenshot.png