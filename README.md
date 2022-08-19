# ci-workflows

Repository for common CI workflows.

## Installation

To install the library run one of the following commands:

`npm install @appex/typescript-coding-standards --save-dev`

or

`yarn add @appex/typescript-coding-standards -D`

## Usage

Once installed you can use the eslint configuration by adding the following to your `eslintrc.js`:

```ts
module.exports = {
    extends: ["@appex/typescript-coding-standards"]
};
```

To use the prettier configuration add the following to `prettierrc.js`:

```ts
module.exports = require("@appex/typescript-coding-standards/prettier.config");
```

## Publishing

To publish a new version of the package simply create a new release on through the GitHub UI. Once created,
the `publish-package` GitHub action is kicked off. This workflow tags `main`with the provided semantic version and
the `package.json` file is updated with the tagged version through an automated commit.
