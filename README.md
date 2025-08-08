<h1 align="center">
  😍 + 🚀
  <br>JJ Spaceship Section<br>
</h1>

<h4 align="center">
  A <a href="https://jj-vcs.github.io/jj/latest/" target="_blank">JJ</a> section for Spaceship prompt
</h4>

<p align="center">
  <a href="https://github.com/spaceship-prompt/spaceship-section/releases">
    <img src="https://img.shields.io/github/v/release/spaceship-prompt/spaceship-section.svg?style=flat-square"
      alt="GitHub Release" />
  </a>

  <a href="https://github.com/spaceship-prompt/spaceship-section/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/spaceship-prompt/spaceship-gradle/ci.yaml?style=flat-square"
      alt="GitHub Workflow Status" />
  </a>

  <a href="https://twitter.com/SpaceshipPrompt">
    <img src="https://img.shields.io/badge/twitter-%40SpaceshipPrompt-00ACEE.svg?style=flat-square"
      alt="Spaceship Twitter" />
  </a>

  <a href="https://discord.gg/NTQWz8Dyt9">
    <img
      src="https://img.shields.io/discord/859409950999707668?label=discord&logoColor=white&style=flat-square"
      alt="Chat on Discord"
    />
  </a>
</p>

Current JJ bookmark/branch status, through jj (`😍`).

## Installing

You need to source this plugin somewhere in your dotfiles. Here's how to do it with some popular tools:

### [Oh-My-Zsh]

Execute this command to clone this repo into Oh-My-Zsh plugin's folder:

```zsh
git clone https://github.com/lazarust/jj-spaceship-section.git $ZSH_CUSTOM/plugins/jj-spaceship-section
```

Include `spaceship-section` in Oh-My-Zsh plugins list:

```zsh
plugins=($plugins spaceship-section)
```

### [zplug]

```zsh
zplug "jj-spaceship-section/jj-spaceship-section"
```

### [antigen]

```zsh
antigen bundle "jj-spaceship-section/jj-spaceship-section"
```

### [antibody]

```zsh
antibody bundle "jj-spaceship-section/jj-spaceship-section"
```

### [zinit]

```zsh
zinit light "jj-spaceship-section/jj-spaceship-section"
```

### [zgen]

```zsh
zgen load "jj-spaceship-section/jj-spaceship-section"
```

### [sheldon]

```toml
[plugins.spaceship-section]
github = "jj-spaceship-section/jj-spaceship-section"
```

### Manual

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/jj-spaceship-section`.
2. Source this section in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/lazarust/jj-spaceship-section.git "$HOME/.zsh/jj-spaceship-section"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "~/.zsh/jj-spaceship-section/jj-spaceship-section.plugin.zsh"
```

## Usage

After installing, add the following line to your `.zshrc` in order to include JJ section in the prompt:

```zsh
spaceship add jj
```

## Options

This section is shown only in directories within a JJ repository (containing a `.jj` directory).

| Variable              |              Default               | Meaning                               |
| :-------------------- | :--------------------------------: | ------------------------------------- |
| `SPACESHIP_JJ_SHOW`   |               `true`               | Show current section                  |
| `SPACESHIP_JJ_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before section                 |
| `SPACESHIP_JJ_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after section                  |
| `SPACESHIP_JJ_SYMBOL` |               `😍 `                | Character to be shown before bookmark |
| `SPACESHIP_JJ_COLOR`  |              `yellow`              | Color of section                      |

The section displays:

- Current bookmark/branch name
- `*` suffix if working copy has changes
- `!` suffix if there are conflicts

## Contributing

First, thanks for your interest in contributing!

Contribute to this repo by submitting a pull request. Please use [conventional commits](https://www.conventionalcommits.org/), since this project adheres to [semver](https://semver.org/) and is automatically released via [semantic-release](https://github.com/semantic-release/semantic-release).

## License

MIT © [lazarust](http://github.com/lazarust)

<!-- References -->

[Oh-My-Zsh]: https://ohmyz.sh/
[zplug]: https://github.com/zplug/zplug
[antigen]: https://antigen.sharats.me/
[antibody]: https://getantibody.github.io/
[zinit]: https://github.com/zdharma/zinit
[zgen]: https://github.com/tarjoilija/zgen
[sheldon]: https://sheldon.cli.rs/
