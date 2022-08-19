# ci-workflows

Repository for common CI workflows.

## Usage

Firstly, you need to clone this repository in your actions workflow as follows:

```yml
steps:
    - uses: actions/checkout@v3
      with:
        name: appex-org/ci-workflows
```

Then any workflow can be called as follows:

```yml
call-worflow:
    uses: ./.github/workflows/node-build-and-verify.yml
```
