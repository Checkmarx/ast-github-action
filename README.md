<img src="https://raw.githubusercontent.com/Checkmarx/ci-cd-integrations/main/.images/banner.png">
<br />
<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

</div>

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/Checkmarx/ast-github-action">
    <img src="https://raw.githubusercontent.com/Checkmarx/ci-cd-integrations/main/.images/logo.png" alt="Logo" width="80" height="80" />
  </a>

<h3 align="center">AST-GITHUB-ACTIONS</h3>

<p align="center">
<br />
    <a href="https://checkmarx.com/resource/documents/en/34965-68702-checkmarx-one-github-actions.html"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Checkmarx/ast-github-action/issues/new/choose">Report Bug</a>
    ·
    <a href="https://github.com/Checkmarx/ast-github-action/issues/new/choose">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
<details>
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


### Prerequisites

There are no prerequisites, however we advise you to understand how Github Actions work

### Setting Up


Copy and paste the following snippet into your .yml file:
```
      - name: Checkmarx AST CLI Action
        uses: checkmarx/ast-github-action@main #Github Action version
        with:
          base_uri: https://ast.checkmarx.net/
          cx_tenant: your_tenant
          cx_client_id: ${{ secrets.CX_CLIENT_ID }}
          cx_client_secret: ${{ secrets.CX_CLIENT_SECRET }}
```



## Usage

To see how you can use our tool, please refer to the [Documentation](https://checkmarx.com/resource/documents/en/34965-68702-checkmarx-one-github-actions.html)


## Contribution

We appreciate feedback and contribution to the Github Action! Before you get started, please see the following:

- [Checkmarx contribution guidelines](docs/contributing.md)
- [Checkmarx Code of Conduct](docs/code_of_conduct.md)

<!-- LICENSE -->
## License
Distributed under the [Apache 2.0](LICENSE). See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

Checkmarx - AST Integrations Team

Project Link: [https://github.com/Checkmarx/ast-github-action](https://github.com/Checkmarx/ast-github-action)

Find more integrations from our team [here](https://github.com/Checkmarx/ci-cd-integrations#checkmarx-ast-integrations)

© 2024 Checkmarx Ltd. All Rights Reserved.

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Checkmarx/ast-github-action.svg
[contributors-url]: https://github.com/Checkmarx/ast-github-action/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Checkmarx/ast-github-action.svg
[forks-url]: https://github.com/Checkmarx/ast-github-action/network/members
[stars-shield]: https://img.shields.io/github/stars/Checkmarx/ast-github-action.svg
[stars-url]: https://github.com/Checkmarx/ast-github-action/stargazers
[issues-shield]: https://img.shields.io/github/issues/Checkmarx/ast-github-action.svg
[issues-url]: https://github.com/Checkmarx/ast-github-action/issues
[license-shield]: https://img.shields.io/github/license/Checkmarx/ast-github-action.svg
[license-url]: https://github.com/Checkmarx/ast-github-action/blob/master/LICENSE
