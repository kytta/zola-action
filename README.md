# zola-build-pages

Builds a [Zola] website as an action.

This is an alternative to [shalzz/zola-deploy-action](https://github.com/shalzz/zola-deploy-action).
I didn't like the Dockerfile approach as it took to long to build the Dockerfile
on each workflow run.

This action is a [composite action](https://docs.github.com/en/actions/creating-actions/creating-a-composite-action).
As such, it doesn't require building a Dockerfile and is being run directly in
the runner.

## Usage

As for now, this action works **only** on `ubuntu-*` runners.

### Basic

```yaml
steps:
  - uses: actions/checkout@v3
  - uses: kytta/zola-build-pages@v1
    with:
      zola-version: "0.17.1"
```

`zola-version` is an optional input, but it is highly recommended to pin it
to become reproducible builds.

### Custom Workflow

This action was made for [publishing with a custom GitHub Actions workflow](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow).
To use it, you need to build the site, upload the built files as artifacts and
then deploy those artifacts to the GitHub Pages environment.
[See my personal website](https://github.com/kytta/www/blob/db05d458d9c0dff99108028c2a7b8cdf239d1300/.github/workflows/deploy.yml)
as example workflow.

Using this GitHub action (as opposed to shalzz/zola-deploy-action) reduced build
times from 1m30s to 30s.

### Inputs

The inputs of the action roughly resemble those of Zola.

| **Name**       | **Default value**  | **Description**                               |
| -------------- | ------------------ | --------------------------------------------- |
| `zola-version` | `0.17.1`           | Zola version to use.                          |
| `root`         | `.`                | Directory where the source files reside.      |
| `config`       | `config.toml`      | Path to a config file in the root of project. |
| `base-url`     | _from Zola config_ | Force the base URL to be that value.          |
| `output-dir`   | `./public`         | Outputs the generated site in the given path. |
| `drafts`       | `false`            | Include drafts when building the site.        |

## Licence

© 2023 [Nikita Karamov]\
Code licensed under the [ISC License].

---

This project is hosted on GitHub:
<https://github.com/kytta/zola-build-pages.git>

[isc license]: https://spdx.org/licenses/ISC.html
[nikita karamov]: https://www.kytta.dev/
[zola]: https://getzola.org/
