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

| Variable  | Example Value &nbsp;| Description &nbsp; |
| ------------- | ------------- | ------------- |
| base_uri | http://demo.ast-cloud.com | AST Portal URL 
| cx_tenant | Organization | Tenant for AST Portal
| cx_client_id | ${{ secrets.CX_CLIENT_ID }} | AST OAuth Client ID 
| cx_client_secret | ${{ secrets.CX_CLIENT_SECRET }} | AST OAuth Secret key 
| cx_apikey | ${{ secrets.CX_APIKEY }} | AST OAuth API KEY 
| scan_types | sast,kics | Scan engine for AST portal 
| project_name | ProjectName | Checkmarx Project 
| branch | Branch | Branch name - defaulted to ${{ github.ref }}
| additional_params | --sast-incremental false --sast-preset-name "Checkmarx Default"
| filter | "!*.md,.git/" | Source code directories/Files that get zipped and sent to AST server for scanning 


## Secrets

_Note: It is recommended to leverage secrets for any sensitive inputs_
* cx_client_id: ${{ secrets.CX_CLIENT_ID }}
* cx_client_secret: ${{ secrets.CX_CLIENT_SECRET }}
* cx_apikey: ${{ secrets.CX_APIKEY }}


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
          cx_tenant: Organization
          cx_client_id: ${{ secrets.CX_CLIENT_ID }}
          cx_client_secret: ${{ secrets.CX_CLIENT_SECRET }}
          scan_types: sast,kics
          
```

## Sample Workflow files

* [Github PUSH workflow for AST](sample-yml/checkmarx-ast-scan-push.yml)
* [Github PULL REQUEST workflow for AST](sample-yml/checkmarx-ast-scan-pull-request.yml)

## How To Contribute

We welcome [issues](https://github.com/checkmarxDev/ast-github-action/issues) to and [pull requests](https://github.com/checkmarxDev/ast-github-action/pulls) against this repository!

# License

Checkmarx Github Action

Copyright (C) 2021 Checkmarx

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see https://www.gnu.org/licenses/.
