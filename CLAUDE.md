# CLAUDE.md — Checkmarx One GitHub Action

> Standardized Claude MD file for [ast-github-action](https://github.com/Checkmarx/ast-github-action)
> Following the Claude MD standardization template defined in epic [AST-146802](https://checkmarx.atlassian.net/browse/AST-146802).

---

## Project Overview

The **Checkmarx One GitHub Action** integrates Checkmarx One security scanning directly into GitHub CI/CD workflows. It wraps the Checkmarx One CLI inside a Docker container action, enabling developers to trigger scans, decorate pull requests with vulnerability findings, and generate results reports — all from a standard GitHub Actions workflow file.

**Key capabilities:**
- Run Checkmarx One scans (SAST, SCA, IaC Security / KICS) as part of any GitHub workflow
- Automatic PR decoration with scan results and vulnerability summaries
- Markdown results report published to the GitHub Actions step summary
- Support for both GitHub Cloud and GitHub Enterprise Server (on-premises)
- Multi-registry authentication for container image scanning
- Automatic scan cancellation when a workflow job is cancelled
- Configurable scan, utility, and results parameters with backward compatibility

**Supported environments:** GitHub Cloud, GitHub Enterprise Server
**Supported runners:** Linux (Docker-based action)

---

## Architecture

The action follows a **Docker container** architecture with a modular shell-script orchestration pattern.

```
┌──────────────────────────────────────────────────────────┐
│                    GitHub Actions Runner                   │
│  ┌─────────────────────────────────────────────────────┐  │
│  │           Docker Container (ast-cli base)           │  │
│  │                                                     │  │
│  │  entrypoint.sh (Orchestrator)                       │  │
│  │    │                                                │  │
│  │    ├── 1. Environment Detection                     │  │
│  │    │      (GitHub Cloud vs Enterprise Server)       │  │
│  │    │                                                │  │
│  │    ├── 2. scripts/auth.sh                           │  │
│  │    │      Multi-registry authentication setup       │  │
│  │    │                                                │  │
│  │    ├── 3. scripts/scan.sh                           │  │
│  │    │      cx scan create → output.log → scanId      │  │
│  │    │                                                │  │
│  │    ├── 4. scripts/pr_decoration.sh                  │  │
│  │    │      cx utils pr github (if PR context)        │  │
│  │    │                                                │  │
│  │    └── 5. scripts/results.sh                        │  │
│  │           cx results show → GITHUB_STEP_SUMMARY     │  │
│  │                                                     │  │
│  │  cleanup.sh (post-action, runs on cancellation)     │  │
│  │    └── cx scan cancel --scan-id <id>                │  │
│  └─────────────────────────────────────────────────────┘  │
│                         │                                  │
│                         ▼                                  │
│              /app/bin/cx (Checkmarx One CLI)               │
│              Communicates with Checkmarx One Platform      │
└──────────────────────────────────────────────────────────┘
```

**Key architectural decisions:**
- **Docker container action:** All logic runs inside a Docker container based on the official `checkmarx/ast-cli` image, ensuring a consistent and isolated runtime environment.
- **Modular scripts:** Each phase (auth, scan, PR decoration, results) is a separate shell script sourced by the entrypoint, enabling independent maintenance and clear separation of concerns.
- **Environment-aware:** The action detects GitHub Cloud vs. Enterprise Server via `GITHUB_SERVER_URL` and adjusts PR decoration behavior accordingly (auto-adds `--code-repository-url` for on-prem).
- **Parameter layering:** Global parameters (`global_params`) are combined with phase-specific parameters (`scan_params`, `utils_params`, `results_params`) allowing fine-grained control.
- **Backward compatibility:** The deprecated `additional_params` input is still supported and maps to `scan_params` when the latter is not provided.

---

## Repository Structure

```
ast-github-action/
├── action.yml                    # GitHub Action definition (inputs, outputs, Docker config)
├── Dockerfile                    # Docker image build (FROM checkmarx/ast-cli:<version>)
├── entrypoint.sh                 # Main orchestrator script
├── cleanup.sh                    # Post-action: cancels in-flight scans on job cancellation
├── scripts/
│   ├── auth.sh                   # Multi-registry authentication (auth.json creation)
│   ├── scan.sh                   # Scan creation and ID extraction
│   ├── pr_decoration.sh          # PR decoration via cx utils pr github
│   └── results.sh                # Results report generation (markdown → step summary)
├── sample-yml/                   # Example workflow files for users
│   ├── checkmarx-ast-scan-push.yml
│   ├── checkmarx-ast-scan-pull-request.yml
│   ├── checkmarx-ast-scan-push-windows-env.yml
│   └── checkmarx-ast-scan-sarif.yml
├── docs/
│   ├── contributing.md           # Contribution guidelines (fork-and-pull workflow)
│   └── code_of_conduct.md        # Contributor Covenant 2.0
├── .github/
│   ├── workflows/
│   │   ├── ci.yml                # Integration tests (run on every PR)
│   │   ├── release.yml           # Release publishing workflow
│   │   ├── checkmarx-one-scan.yml  # Self-scan (daily + manual)
│   │   ├── update-docker-image.yml # Automated CLI version bumps
│   │   ├── dependabot-auto-merge.yml
│   │   ├── auto-merge-pr.yml
│   │   ├── issue_automation.yml
│   │   └── release-drafter.yml
│   ├── ISSUE_TEMPLATE/           # Bug report and enhancement request templates
│   ├── PULL_REQUEST_TEMPLATE.md
│   ├── dependabot.yml
│   └── release-drafter.yml
├── images/                       # Branding images
├── CODEOWNERS                    # @greensd4 @AlvoBen
├── LICENSE                       # Apache 2.0
├── README.md                     # User-facing documentation
└── logo.png                      # Action branding logo
```

---

## Technology Stack

| Layer | Technology | Details |
|-------|-----------|---------|
| Language | Bash / Shell | All logic in shell scripts |
| Runtime | Docker | Container-based GitHub Action |
| Base Image | `checkmarx/ast-cli` | v2.3.47 (pinned with SHA256 digest) |
| Platform API | Checkmarx One CLI (`cx`) | Binary at `/app/bin/cx` inside container |
| CI/CD | GitHub Actions | Workflows for CI, release, and automation |
| Configuration | YAML | `action.yml` defines inputs, outputs, and Docker config |

---

## Development Setup

### Prerequisites

1. **Docker** installed locally (for building and testing the container)
2. **Bash** shell environment
3. **Checkmarx One account** with OAuth client credentials (`cx_client_id` + `cx_client_secret`)
4. A **GitHub repository** to test the action against

### Clone

```bash
git clone https://github.com/Checkmarx/ast-github-action.git
cd ast-github-action
```

### Local Testing

Since this is a Docker-based GitHub Action, local testing involves building and running the container:

```bash
# Build the Docker image
docker build -t ast-github-action .

# Run with required environment variables
docker run --rm \
  -e CX_BASE_URI="https://your-tenant.checkmarx.net" \
  -e CX_TENANT="your-tenant" \
  -e CX_CLIENT_ID="your-client-id" \
  -e CX_CLIENT_SECRET="your-client-secret" \
  -e PROJECT_NAME="test-project" \
  -e BRANCH="main" \
  -e SOURCE_DIR="." \
  -e GITHUB_OUTPUT="/dev/null" \
  -e GITHUB_STEP_SUMMARY="/dev/null" \
  -v $(pwd):/source \
  ast-github-action
```

For full integration testing, push changes to a branch and open a PR — the CI workflow (`.github/workflows/ci.yml`) will run the action against a real Checkmarx One instance using repository secrets.

---

## Coding Standards

- **Shell scripting:** All logic is written in Bash. Follow standard Bash best practices (quote variables, use `set -e` where appropriate, use arrays for parameter lists).
- **Parameter parsing:** Use `eval` for splitting space-separated parameter strings into arrays. Combine global params with phase-specific params before passing to CLI commands.
- **Output handling:** Write GitHub Actions outputs to `$GITHUB_OUTPUT` using the `key=value` format. Write step summaries to `$GITHUB_STEP_SUMMARY`.
- **Logging:** Use `echo` for informational messages. Prefix warnings with a warning emoji. Never log secrets or credentials.
- **Exit codes:** Propagate CLI exit codes via `${PIPESTATUS[0]}`. Non-zero exit codes should cause the action to fail.
- **File naming:** Shell scripts use snake_case (e.g., `pr_decoration.sh`). Workflow files use kebab-case (e.g., `update-docker-image.yml`).

---

## Project Rules

- **All PRs target `main`** unless explicitly coordinated otherwise.
- **Branch naming:**
  - Features: `feature/<issue#>-descriptive-name`
  - Hotfixes: `hotfix/<issue#>-descriptive-name`
- **PRs must be associated** with an accepted GitHub issue (enhancement or bug).
- **Never commit secrets.** Checkmarx credentials are injected via GitHub Actions secrets or environment variables at runtime — never hardcoded.
- **CLI version** is pinned in the `Dockerfile` (`FROM checkmarx/ast-cli:<version>@sha256:<digest>`). Updates are automated via the `update-docker-image.yml` workflow.
- **Code owners:** @greensd4 and @AlvoBen must approve all PRs.
- **PR size:** Keep PRs focused on a single concern. Fix functionality or address code style, not both.
- **Fork-and-pull workflow:** External contributors fork the repo, create a branch, and submit a PR back.

---

## Testing Strategy

### Test Types

| Type | Where | Runner | Purpose |
|------|-------|--------|---------|
| Integration (CI) | `.github/workflows/ci.yml` | GitHub Actions (ubuntu-latest) | End-to-end tests against a real Checkmarx One instance |
| Self-scan | `.github/workflows/checkmarx-one-scan.yml` | GitHub Actions | Scans this repo's own code daily |

### CI Test Scenarios

The CI workflow (triggered on every PR) runs the following integration tests:

1. **Empty credentials failure** — Verifies the action fails when `cx_client_id` and `cx_client_secret` are empty
2. **Valid scan** — Runs a full scan with `--file-include *.sh,Dockerfile --scan-types kics`, validates scan ID and CLI output are non-empty
3. **Invalid preset name** — Verifies the action fails when an invalid SAST preset name is provided
4. **Source directory** — Validates scanning a specific subdirectory via the `source_dir` input

### Required Secrets for CI

| Secret | Purpose |
|--------|---------|
| `CX_BASE_URI` | Checkmarx One portal URL |
| `CX_TENANT` | Tenant identifier |
| `CX_CLIENT_ID` | OAuth client ID |
| `CX_CLIENT_SECRET` | OAuth client secret |

---

## External Integrations

| Integration | Purpose | How |
|-------------|---------|-----|
| **Checkmarx One Platform** | Run scans, fetch results, PR decoration | Via Checkmarx CLI (`/app/bin/cx`) inside Docker container |
| **GitHub Actions** | CI/CD runtime, workflow triggers, secrets management | Native GitHub Actions integration via `action.yml` |
| **GitHub API** | PR decoration (posting scan results as PR comments) | Via `cx utils pr github` with `GITHUB_TOKEN` |
| **Docker Hub** | Base image hosting (`checkmarx/ast-cli`) | Pulled during Docker build |
| **Container Registries** | Multi-registry auth for image scanning | Configured via `auth.sh` using `REGISTRIES` env var |

---

## Deployment

### Release Process

Releases are managed via `.github/workflows/release.yml` (triggered manually via `workflow_dispatch`):

1. Extract CLI version from the Dockerfile
2. Create a git tag with the release version
3. Publish a GitHub Release with auto-generated changelog (via release-drafter)
4. Notify downstream systems

### CLI Version Updates

The CLI version is updated automatically via `.github/workflows/update-docker-image.yml`:

1. Detects new `checkmarx/ast-cli` releases on Docker Hub
2. Updates the `FROM` line and SHA256 digest in the `Dockerfile`
3. Creates a PR with the update for review

### Distribution

- **GitHub Marketplace:** Published as a GitHub Action on the GitHub Marketplace
- **Direct reference:** Users reference the action via `Checkmarx/ast-github-action@<version>` in their workflows

### Usage (End Users)

```yaml
- name: Checkmarx One Scan
  uses: Checkmarx/ast-github-action@main
  with:
    base_uri: ${{ secrets.CX_BASE_URI }}
    cx_tenant: ${{ secrets.CX_TENANT }}
    cx_client_id: ${{ secrets.CX_CLIENT_ID }}
    cx_client_secret: ${{ secrets.CX_CLIENT_SECRET }}
    scan_params: "--scan-types sast,sca,kics"
```

---

## Security & Access

- **OAuth authentication:** Users provide `cx_client_id` and `cx_client_secret` which are passed as environment variables to the Docker container. These must be stored as GitHub Actions secrets.
- **GitHub Token:** The `github_token` input defaults to the automatic `github.token` and is used for PR decoration. It is never logged.
- **No credentials in code:** All secrets are injected at runtime via GitHub Actions secrets and environment variables. Never commit API keys, client IDs, or client secrets.
- **TLS:** All communication with Checkmarx One is HTTPS, enforced by the CLI.
- **Docker isolation:** The action runs in an isolated Docker container, preventing interference with the host runner environment.
- **Registry credentials:** Multi-registry auth credentials are constructed in-memory as `auth.json` and never written to logs.

---

## Action Inputs & Outputs

### Inputs

| Input | Required | Default | Description |
|-------|----------|---------|-------------|
| `base_uri` | Yes | — | Checkmarx One portal URL |
| `cx_tenant` | Yes | — | Tenant identifier |
| `cx_client_id` | Yes | — | OAuth client ID |
| `cx_client_secret` | Yes | — | OAuth client secret |
| `project_name` | No | `github.repository` | Checkmarx project name |
| `branch` | No | `github.head_ref \|\| github.ref` | Branch name for the scan |
| `github_token` | No | `github.token` | GitHub API token for PR decoration |
| `source_dir` | No | `.` | Source directory to scan |
| `global_params` | No | `''` | Parameters applied to all `cx` commands |
| `scan_params` | No | `''` | Parameters for `cx scan create` only |
| `utils_params` | No | `''` | Parameters for `cx utils pr` only |
| `results_params` | No | `''` | Parameters for `cx results show` only |
| `additional_params` | No | `''` | **DEPRECATED** — use `scan_params` instead |
| `repo_name` | No | `github.event.repository.name` | Repository name for PR decoration |
| `namespace` | No | `github.repository_owner` | Organization name for PR comment |
| `pr_number` | No | `github.event.number` | PR number for decoration |

### Outputs

| Output | Description |
|--------|-------------|
| `cxcli` | Full CLI output from the scan |
| `cxScanID` | The scan ID created by Checkmarx One |

---

## Debugging Steps

### Action fails with authentication error

1. Verify `cx_client_id` and `cx_client_secret` are correctly set in GitHub Actions secrets
2. Confirm the OAuth client has the required roles on the Checkmarx One tenant
3. Check that `base_uri` and `cx_tenant` are correct

### Scan completes but no PR decoration

1. Confirm the workflow is triggered by a `pull_request` event (PR number must be available)
2. Check that `github_token` has permissions to write PR comments
3. For GitHub Enterprise Server, verify the action correctly detects on-prem and adds `--code-repository-url`

### Empty scan results / no step summary

1. Verify the scan ID was extracted successfully (check `cxScanID` output)
2. Ensure `results_params` does not conflict with the default `--report-format markdown`
3. Check the GitHub Actions log for CLI error messages

### Action hangs or times out

1. Check if the Checkmarx One platform is accessible from the runner
2. Verify network connectivity (firewalls, proxies) between the GitHub runner and `base_uri`
3. For large repositories, consider using `source_dir` to limit the scan scope or `--file-include`/`--file-exclude` filters

### Testing changes locally

1. Build the Docker image: `docker build -t ast-github-action .`
2. Run with mock environment variables to verify script logic
3. For full integration testing, push to a branch and open a PR to trigger CI

---

## Known Patterns & Conventions

- **Parameter splitting:** All parameter inputs (`global_params`, `scan_params`, etc.) are space-separated strings that get split into Bash arrays using `eval`. Users can pass multiple flags like `--scan-types sast,sca --file-include *.java`.
- **Scan ID extraction:** The scan ID is parsed from the CLI JSON output using `grep` and `cut` — it looks for the `"ID"` field in the JSON response.
- **Output file:** The scan output is tee'd to `./output.log`, which is also used by `cleanup.sh` to extract the scan ID for cancellation.
- **Global params inheritance:** `global_arr` is set once in `scan.sh` and reused by `pr_decoration.sh` and `results.sh` because all scripts are sourced (not executed as subprocesses).

---

