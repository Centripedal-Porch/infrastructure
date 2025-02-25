# GitHub Actions

This directory contains CI/CD configurations via
[GitHub Actions](https://github.com/features/actions).

GitHub workflows are written in YAML, and are consumed and run on a
pre-specified event (such as a push, or a pull request).

**NB:** GitHub does not implement all standard YAML structures. Tags and anchors
are noticeably missing, and should not appear in any YAML files, that get
consumed by GitHub, such as `dependabot.yml`.

## Recommended Software

* [GitHub CLI](https://cli.github.com/): Access GitHub from the commandline.
* [nektos/act](https://nektosact.com/): Run GitHub Actions locally.
* [yamllint](https://github.com/adrienverge/yamllint): Validate YAML files.

## Best Practices

Using actions from the GitHub marketplace can be less secure than than using
GitHub’s prebuilt actions (or writing your own, though there are steps one can
take to mitigate these risks.

### Documentation

In-line Github Action documentation should be fairly minimal, as each step with
a `uses` statement inherently points to its own documentation via the author,
repo, and commit or tag (ie: `uses: '{AUTHOR}/{REPO}@{COMMIT}'`).

To find the README for a step, convert the used image into one of the following
URL format: `https://github.com/{AUTHOR}/{REPO}/commit/{COMMIT}`.

### Config Files

If your action consumes a configuration file, then place that file
in the [.github/config](../config/README.md) directory. This avoids YAML config
files accidentally being consumed by GitHub Actions.

### Code Review

_Every marketplace GitHub Action is open source._ Make a good-faith effort to
review third-party actions before using them.

Consider:

* **Number of contributors.** Third-party actions with many contributors will
   have been reviewed by several peers, as opposed to one potential bad actor.
* **Popularity.** How many times has the action been starred?
* **How recently the action was updated.** Is it well-maintained?
* **Code review.** Perform your own review of the Action code.

### Hash-locking

While version-locking can be tempting, versions (and tags) can be over-written.
Instead, lock your actions to the commit hash of a specific version, rather than
a tag or release. Commit hashes are a SHA1 sum derived from the commit, commit
tree, and changed files. Commit hashes cannot (easily) be collided or modified.

Versions that correspond to a given hash should appear both:

* As a comment in the action's YAML file.
* In the [version.manifest](./version.manifest) file.

**NB:** When hash-locking Actions requirements, GitHub requires the full hash
of the release version (eg: `fdef6bc189425ecc84cc4543b2674566c0827053`
not `fdef6bc`).

**NB:** Remember to update [version.manifest](./version.manifest) (in YAML
format) with each **new** dependent action used by this repository.

_Terrible code:_

```yaml
[...]
   - name: 'Yamllint'
     uses: 'karancode/yamllint-github-action'
...
```

_Bad code:_

```yaml
[...]
   - name: 'Yamllint'
     uses: 'karancode/yamllint-github-action@2.1.1'
...
```

_Good code:_

```yaml
[...]
   - name: 'Yamllint'
     uses: 'karancode/yamllint-github-action@fdef6bc189425ecc84cc4543b2674566c0827053'
...
```

## Recommended Reading

* [GitHub Actions documentation - GitHub Docs](https://docs.github.com/en/actions)
