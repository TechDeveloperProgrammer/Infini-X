# Contributing to Infini-X

We welcome and appreciate contributions to the Infini-X project! Whether you're fixing a bug, adding a new feature, improving documentation, or suggesting an enhancement, your help is valuable. This guide outlines the process for contributing to Infini-X.

## Code of Conduct

Please review our [Code of Conduct](CODE_OF_CONDUCT.md) to ensure a positive and inclusive environment for everyone.

## How to Contribute

### 1. Find an Issue or Propose a Feature

-   **Existing Issues**: Check the [GitHub Issues](https://github.com/Infini-X/Infini-X/issues) to find open bugs or feature requests. Comment on an issue to indicate you're working on it.
-   **New Feature/Bug**: If you have a new idea or found a bug not listed, please open a new issue first to discuss it. This helps avoid duplicate work and ensures alignment with the project's goals.

### 2. Set Up Your Development Environment

Follow the instructions in the [Getting Started](docs/getting_started.md) guide to set up your development environment. Using the Dev Containers is highly recommended for a consistent setup.

### 3. Branching Strategy

We follow a simplified Git Flow or GitHub Flow model:

-   **`main` branch**: Represents the stable, production-ready version of the project. Only merge tested and reviewed code into `main`.
-   **`develop` branch**: The primary branch for ongoing development. All new features and bug fixes are branched off `develop`.
-   **Feature branches**: For new features or significant changes, create a new branch from `develop` (e.g., `feature/my-new-feature`).
-   **Bugfix branches**: For bug fixes, create a new branch from `develop` (e.g., `bugfix/fix-issue-123`).

### 4. Make Your Changes

-   **Code Style**: Adhere to the existing code style. Use `make fmt` and `make lint` before committing.
-   **Testing**: Write unit and integration tests for your changes. Ensure all existing tests pass (`make test`).
-   **Documentation**: Update relevant documentation in the `docs/` directory for any new features, changes, or bug fixes. If you add a new script or configuration, document its purpose and usage.

### 5. Commit Your Changes

Follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification for your commit messages. This helps in generating changelogs and understanding the purpose of each commit.

**Examples**:

-   `feat: add new AI model integration`
-   `fix: resolve issue with Calamares partitioning`
-   `docs: update getting started guide`
-   `chore: update Go dependencies`

```bash
git add .
git commit -m "feat: your concise commit message"
```

### 6. Create a Pull Request (PR)

Once your changes are complete, tested, and committed:

1.  **Push your branch** to your fork or the main repository:
    ```bash
git push origin feature/your-feature-name
    ```

2.  **Open a Pull Request** on GitHub from your branch to the `develop` branch.

3.  **Provide a detailed description** in your PR, including:
    -   A summary of the changes.
    -   The problem it solves or the feature it adds.
    -   How you tested it.
    -   Any relevant screenshots or GIFs for UI changes.
    -   Reference any related issues (e.g., `Closes #123`, `Fixes #456`).

4.  **Request reviews** from maintainers or other contributors.

### 7. Address Feedback

Be prepared to receive feedback on your PR. Address comments and make necessary changes. Once your PR is approved and all CI checks pass, it will be merged into the `develop` branch.

## Code Review Guidelines

When reviewing code, consider the following:

-   **Correctness**: Does the code do what it's supposed to do?
-   **Readability**: Is the code easy to understand?
-   **Maintainability**: Is it well-structured and easy to modify in the future?
-   **Performance**: Are there any obvious performance bottlenecks?
-   **Security**: Are there any potential security vulnerabilities?
-   **Tests**: Are there sufficient tests covering the changes?
-   **Documentation**: Is the documentation updated to reflect the changes?

Thank you for contributing to Infini-X!