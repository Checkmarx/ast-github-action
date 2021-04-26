# Checkmarx AST Github Action ![Checkmarx](images/checkmarx.png) <img src="images/github.png" alt="Github" width="40" height="40">

[![License: GPL-3.0](https://img.shields.io/badge/License-GPL3.0-yellow.svg)](https://www.gnu.org/licenses)

[comment]: <> ([![Latest Release]&#40;https://img.shields.io/github/v/release/checkmarxDev/ast-github-action&#41;]&#40;https://github.com/checkmarxDev/ast-github-action/releases&#41;)
[![Open Issues](https://img.shields.io/github/issues-raw/checkmarxDev/ast-github-action)](https://github.com/checkmarxDev/ast-github-action/issues)

Checkmarx AST GitHub Action.

This is a Wrapper to trigger scans to the latest version of AST through Docker to launch Checkmarx SAST scans.

![Checkmarx](images/checkmarx-big.png)

* Checkmarx SAST (**CxSAST**) is an enterprise-grade flexible and accurate static analysis solution used to identify hundreds of security vulnerabilities in custom code. It is used by development, DevOps, and security teams to scan source code early in the SDLC, identify vulnerabilities and provide actionable insights to remediate them.
* Checkmarx AST (**AST**) is a SAST, SCA, KICS scan initiation and results manangement portal.

Please find more info in the official website: <a href="www.checkmarx.com">Checkmarx.com</a>

## Inputs

| Variable  | Example Value &nbsp;| Description &nbsp; | Type | Required | Default |
| ------------- | ------------- | ------------- |------------- | ------------- | ------------- |
| base_uri | http://demo.ast-cloud.com | AST Portal URL | String | Yes | http://demo.ast-cloud.com
| client_id | ${{ secrets.CLIENT_ID }} | AST OAuth Client ID | String | No | N/A
| secret | ${{ secrets.SECRET }} | AST OAuth Secret key | Secure String | No | N/A
| token | ${{ secrets.TOKEN }} | AST OAuth Token | Secure String | No | N/A
| project_type | SAST | Scan engine for AST portal | String | No | SAST |
| project_name | ProjectName | Checkmarx Project | String | No | Github repository name |
| preset_name | Checkmarx Default | Checkmarx Project preset name | String | No | Checkmarx Default |
| additional_params | --incremental false  | Additional parameters and scan options | String | No | N/A |
| github_token | ${{ secrets.GITHUB_TOKEN }} | GitHub API Token, used for PR Feedback or GitHub Issue Feedback | String | No | ${{ github.token }} |
| filter | "!*.md" | Source code directory/File filters to submit for scanning | String | No | "."(Includes all files) |


## Secrets

_Note: It is recommended to leverage secrets for any sensitive inputs_
* client_id: ${{ secrets.CLIENT_ID }}
* secret: ${{ secrets.SECRET }}
* token: ${{ secrets.TOKEN }}


## Example usage

```
    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
    # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
    - uses: actions/checkout@v2
    # Scan code with Checkmarx AST
    - name: Checkmarx AST CLI Action
        uses: checkmarxDev/ast-github-action@v0.26-alpha #Github Action version
        with:
          base_uri: http://demo.ast-cloud.com
          client_id: ${{ secrets.CLIENT_ID }}
          secret: ${{ secrets.SECRET }}
          
```

## Sample Workflow files

* [Github PUSH workflow for AST](sample-yml/checkmarx-ast-scan-push.yml)
* [Github PULL REQUEST workflow for AST](sample-yml/checkmarx-ast-scan-pull-request.yml)

## How To Contribute

We welcome [issues](https://github.com/checkmarxDev/ast-github-action/issues) to and [pull requests](https://github.com/checkmarxDev/ast-github-action/pulls) against this repository!

# License

Checkmarx Github Action

Copyright (C) 2020 Checkmarx

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.
