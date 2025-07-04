
# Development Workflow

This document outlines the recommended development workflow for contributing to the Infini-X monorepo. Adhering to this workflow ensures code quality, consistency, and efficient collaboration.

## 1. Branching Strategy

We follow a simplified Git Flow or GitHub Flow model:

-   **`main` branch**: Represents the stable, production-ready version of the project. Only merge tested and reviewed code into `main`.
-   **`develop` branch**: The primary branch for ongoing development. All new features and bug fixes are branched off `develop`.
-   **Feature branches**: For new features or significant changes, create a new branch from `develop` (e.g., `feature/my-new-feature`).
-   **Bugfix branches**: For bug fixes, create a new branch from `develop` (e.g., `bugfix/fix-issue-123`).

## 2. Code Style and Linting

We enforce consistent code style and quality using linters and formatters. Before committing your changes, ensure they adhere to the project's standards.

-   **Go**: Use `go fmt` for formatting and `go vet` for linting. Consider `golangci-lint` for more comprehensive checks.
-   **Python**: Use `black` for formatting and `flake8` or `ruff` for linting.
-   **JavaScript/TypeScript (Web)**: Use `prettier` for formatting and `ESLint` for linting.
-   **Shell Scripts**: Ensure scripts are well-formatted and follow common shell scripting best practices.

Run the following `Makefile` commands before committing:

```bash
make fmt
make lint
```

## 3. Testing

All new features and bug fixes must be accompanied by appropriate tests. We encourage Test-Driven Development (TDD) where applicable.

-   **Unit Tests**: Test individual functions or components in isolation.
-   **Integration Tests**: Verify the interaction between multiple components.
-   **End-to-End Tests**: (Future) Test the entire system from a user's perspective.

Run tests using the `Makefile`:

```bash
make test
```

## 4. Committing Changes

Follow Conventional Commits for clear and consistent commit messages. This helps in generating changelogs and understanding the purpose of each commit.

Example commit message:

```
feat: add user management module

This commit introduces a new user management module in the core service.
It includes CRUD operations for users and basic authentication.

Closes #123
```

## 5. Pull Requests (PRs)

When your feature or bug fix is complete and thoroughly tested:

1.  **Push your branch** to the remote repository.
2.  **Create a Pull Request** from your feature/bugfix branch to the `develop` branch.
3.  **Provide a clear description** of your changes, including:
    -   What problem does it solve?
    -   How was it implemented?
    -   How was it tested?
    -   Any relevant screenshots or GIFs for UI changes.
4.  **Request reviews** from at least two team members.
5.  **Address feedback** and make necessary changes.
6.  Once approved, **merge your PR** into `develop`.

## 6. Documentation

Keep the documentation up-to-date. If your changes introduce new features, modify existing ones, or fix bugs, ensure the relevant documentation in the `docs/` directory is updated accordingly.

To build and preview the documentation locally:

```bash
make docs
```

## 7. CI/CD

Our GitHub Actions workflows (`.github/workflows/`) automatically run checks (lint, test, build) on every push and pull request. Ensure your changes pass all CI checks before merging.

## 8. Release Process

Releases are typically handled by maintainers. They involve merging `develop` into `main`, tagging the release, and triggering release workflows (e.g., ISO and GSI ROM builds).
