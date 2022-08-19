# ci-workflows

Repository for common CI workflows.

## Usage

Aany workflow can be called as follows:

```yml
call-worflow:
    uses: appex-org/ci-workflows/.github/workflows/node-build-and-verify.yml@main
```

Parameters can be passed in as follows:

```yml
call-worflow:
    uses: appex-org/ci-workflows/.github/workflows/node-build-and-verify.yml@main
    with:
        node_version: 14
```