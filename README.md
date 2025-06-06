<img src="https://raw.githubusercontent.com/Checkmarx/ci-cd-integrations/main/.images/PluginBanner.jpg">
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
    <img src="https://raw.githubusercontent.com/Checkmarx/ci-cd-integrations/main/.images/xIcon.jpg" alt="Logo" width="80" height="80" />
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
      <a href="#overview">Overview</a>
    </li>
    <li>
      <a href="#main-features">Main Features</a>
    </li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- Overview -->
# Overview

The **Checkmarx One** **GitHub Action** enables you to trigger Checkmarx One scans directly from the GitHub workflow. It provides a wrapper around the [Checkmarx One CLI Tool](https://checkmarx.com/resource/documents/en/34965-68620-checkmarx-one-cli-tool.html) which creates a zip archive from your source code repository and uploads it to Checkmarx One for scanning. The Github Action provides easy integration with GitHub while enabling scan customization using the full functionality and flexibility of the CLI tool.


The GitHub Action can be customized to trigger scans when particular actions (e.g., push, or pull request) occur on specific branches of your repo. You can also add pre and post scan steps to your workflow. For example, you can add a step to screen commits to verify if the changes
made warrant running a new scan.

The plugin code can be found [here](https://github.com/CheckmarxDev/ast-github-action).


> There is an alternative method for integrating GitHub with Checkmarx One which is done directly from Checkmarx One, see [GitHub
Cloud](https---checkmarx-com-resource-documents-en-34965-68678-github-cloud.html). That method is easier to implement but doesn’t enable full customization of the process.

## Main Features
-   Automatically trigger scans from the GitHub workflow, running all Checkmarx One scanners: CxSAST, CxSCA, IaC Security, Container Security, API Security, Secret Detection and Repository Health (OSSF Scorecard).


-   Supports use of CLI arguments to customize scan configuration, enabling you to:

    -   Customize filters to specify which folders and files are scanned

    -   Apply preset query configurations

    -   Customize SCA scans using [SCA Resolver](https://checkmarx.com/resource/documents/en/34965-19196-checkmarx-sca-resolver.html)

    -   Set thresholds to break build

-   Shows scan results summary in the GitHub build logs

-   Break build upon policy violation

-   Supports generating reports that are integrated into the GitHub
    Security alerts

-   Decorates pull requests with info about new vulnerabilities that were identified as well as vulnerabilities that were fixed by the code changes


## Prerequisites

-   The source code for your project is hosted on a GitHub repo (public or private)

-   You have a Checkmarx One account and you have an OAuth **Client ID** and **Client Secret** for that account. To create an OAuth client, see [Creating an OAuth Client for Checkmarx One Integrations](https://checkmarx.com/resource/documents/en/34965-118315-authentication-for-checkmarx-one-cli.html#UUID-a4e31a96-1f36-6293-e95a-97b4b9189060_UUID-4123a2ff-32d0-2287-8dd2-3c36947f675e).


## Getting Started

1.   Verify that all prerequisites are in place.

2.   Configure GitHub secrets for Checkmarx One authentication, as described [here](https://checkmarx.com/resource/documents/en/34965-68703-checkmarx-one-github-actions-initial-setup.html).

3.   Configure a GitHub Action with a Checkmarx One workflow, as described [here](https://checkmarx.com/resource/documents/en/34965-68704-configuring-a-github-action-with-a-checkmarx-one-workflow.html).


## Feedback
We’d love to hear your feedback! If you come across a bug or have a feature request, please let us know by submitting an issue in [GitHub Issues](https://github.com/Checkmarx/ast-github-action/issues).


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

© 2022 Checkmarx Ltd. All Rights Reserved.

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
