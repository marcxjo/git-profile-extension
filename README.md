Git Profile Extension
=

Convenient management and runtime invocation of custom global Git configs
-

`git-profile` enables specifying the working global Git profile for the current
command using idiomatic Git syntax. This is normally accomplished by specifying
the environment variable `GIT_CONFIG_GLOBAL`.

* How do I use this extension?

The command's syntax is kept as simple as possible, offering only subcommands
required to initialize and enable the use of custom profiles.

Use

```
git profile add
```
to create a new _empty_ profile (you'll need to add your own settings after
creation!).

Use

```
git profile PROFILE [git-commands]
```
to perform any standard Git operation using PROFILE as the global Git config.

For more on Git configuration scopes, see the [git-config manual](https://git-scm.com/docs/git-config#SCOPES).

* How does this differ from using a structured repository workspace and
`gitconfig`'s `includeIf` syntax?

This extension was developed with a workflow leveraging workspaces and
`includeIf`s in mind. It _can_ provide an alternative solution, but also works
well as a compliment to the existing implementations.

One of the the main conveniences that `git-profile` provides in such a workflow,
is the ability to perform scripted actions in response to Git operations
utilizing custom configuration (such as hooks), even overriding a
workspace-specific static configuration. (This can be especially useful at clone
time if a repository has particularly custom setup needs.) A real life use case
involves utilizing fzf to navigate directly to repository directories from
outside of a given workspace, utilizing custom git properties. (There are many
ways to achieve this capability, but a git extension becomes handy in the event
that you manage multiple workspaces, e.g., personal and work projects.)

* How does this plugin interact with other Git commands/extensions?

The intent is to enable chaining `git-profile` with all supported Git commands.
This may prove difficult for more complex or rigid extensions. A few
preliminary (_non-comprehensive_) tests of `git-profile` in conjunction with
[`git-flow`](https://github.com/petervanderdoes/gitflow-avh) have demonstrated
expected behavior.

* What's on the roadmap?

The following:
* Makefile support (e.g., to enable build-time configuration of script-internal
variables)
* * I _may_ go with Meson support for easier maintainability, but that seems
hard to justify for such a small project
* `rm` command support
* a `get` and `set` API for direct profile configuration
