
# Percona Everest Documentation
[![render](https://img.shields.io/badge/everest--doc-render-Green)](https://everest-doc.onrender.com/)
[![Build](https://github.com/percona/everest-doc/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/percona/everest-doc/actions/workflows/build.yml)


This repo holds the source files for the official [Everest technical documentation].

To contribute to that documentation, you can:

- **report a general problem** -- open a [Jira] issue.

- **fix a problem yourself** -- Use the _Edit this page_ link to take you to the Markdown source file for that page. Make your changes (you'll have to fork the repo unless you're Percona staff) and submit a PR which we'll review and adjust where necessary before merging and publishing. If the changes are more than a few lines, you might want to build the website locally to see how it looks in context. That's what the rest of this README covers.

## Introduction

We use [MkDocs] to convert [Markdown] files into a static HTML website (or [PDF](#pdf)). This process is called [_building the documentation_](#building-the-documentation).

The documentation source files are in the `docs` directory. (Other files in this repo are explained in [Directories and files](#directories-and-files).)

Before you start, it helps to know what [Git], [Python] and [Docker](https://docs.docker.com/get-docker/) are, what [Markdown] is and how to write it, and how to install and use those things on the command line. (If you don't, consider opening a [Jira] issue instead.)

## Building the documentation

If you'd like to have a local copy of Everest documentation, or are thinking about contributing, it helps if you can build the documentation to see how it will look when published. The easiest way is to use Docker, as this avoids having to install MkDocs and its dependencies.

### With Docker

1. Install [Docker].

2. Clone this repository.

3. Change directory to `everest-doc`.

4. Use our [PMM documentation Docker image] to _build the documentation_:

   ```sh
   docker run --rm -v $(pwd):/docs perconalab/pmm-doc-md mkdocs build
   ```

5. Find the `site` directory, open `index.html` in a browser to view the first page of documentation.

If you want to see how things look as you edit, MkDocs has a built-in server for live previewing. After (or instead of) building, run:

```sh
docker run --rm -v $(pwd):/docs -p 8000:8000 perconalab/pmm-doc-md mkdocs serve --dev-addr=0.0.0.0:8000
```

Wait until you see `INFO    -  Start detecting changes` then point your browser to [http://0.0.0.0:8000](http://0.0.0.0:8000).

### Without Docker

_If you don't use Docker, you must install MkDocs and all its dependencies._

1. Install [Python].

2. Install MkDocs and required extensions:

   ```sh
   pip install -r requirements.txt
   ```

3. Build the site:

   ```sh
   mkdocs build
   ```

4. Open `site/index.html`

Or, to run the built-in web server:

```sh
mkdocs serve
```

View the site at <http://0.0.0.0:8000>

## PDF

_How to create a PDF version of the documentation._

1. (For Percona staff) If building for a release of PMM, edit `mkdocs-base.yml` and change:

   - The release number in `plugins.with-pdf.output_path`
   - The release number and date in `plugins.with-pdf.cover_subtitle`

2. Build

   - With Docker:

     ```sh
     docker run --rm -v $(pwd):/docs -e ENABLE_PDF_EXPORT=1 perconalab/pmm-doc-md mkdocs build -f mkdocs-pdf.yml
     ```

   - Without:

     ```sh
     ENABLE_PDF_EXPORT=1 mkdocs build -f mkdocs-pdf.yml
     ```

3. The PDF is in `site/pdf`.

## Directories and files

- `mkdocs.yml`: Default MkDocs configuration file. Creates (Material) themed HTML for hosting anywhere.

- `mkdocs-pdf.yml`: MkDocs configuration file. Creates themed [PDF](#pdf).

- `docs`:

  - `*.md`: Markdown files.

  - `images/*`: Images, image resources, videos.

  - `css`: Styling.

  - `js`: JavaScript files.

- `_resources`:

  - `bin`

    - `glossary.tsv`: Export from a spreadsheet of glossary entries.

    - `make_glossary.pl`: Script to write Markdown page from `glossary.tsv`.

  - `templates`: Stylesheet for PDF output (used by [mkdocs-with-pdf](https://github.com/orzih/mkdocs-with-pdf) extension).

  - `theme`:

    - `main.html`: MkDocs template for HTML published on percona.com.

- `requirements.txt`: Python package dependencies.

- `variables.yml`: Values used throughout the Markdown, including the current Everest version/release number.

- `.spelling`: Words regarded as correct by `mdspell` (See [Spelling and grammar](#spelling-and-grammar).)

- `.github`:

  - `workflows`:

    - `build.yml`: Workflow specification for building the documentation via a GitHub action. (Uses `mike` which puts HTML in `publish` branch.)

- `site`: When building locally, directory where HTML is put.

## Version switching


A [GitHub actions] workflow runs `mike` which in turn runs `mkdocs`. The HTML is committed and pushed to the `publish` branch. The whole branch is then copied (by an internal Percona Jenkins job) to our web server.




## Spelling and grammar

The GitHub actions build job performs a basic spell check. (A grammar check is currently commented out in the actions file.) You can do these yourself on the command line if you have [Node.js] installed.

```sh
npm i markdown-spellcheck -g
mdspell --report --en-us --ignore-acronyms --ignore-numbers docs/<path to file>.md
```

To check all files:

```sh
mdspell --report --en-us --ignore-acronyms --ignore-numbers "docs/**/*.md"
```

Add any custom dictionary words to `.spelling`. The results of the spell check are printed, but the job ignores the return status.

Grammar is checked using [`write-good`](https://github.com/btford/write-good).

```sh
npm i write-good -g
write-good docs/<path to file>.md
```

To check all files:

```sh
write-good docs/**/*.md
```

## Link checking

We're using the `mkdocs-htmlproofer-plugin` link checking plugin to detect broken URLs. It works well, but increases the build time significantly (by between 10 and 50 times longer).

The plugin is installed in our [Documentation Docker image] and by the GitHub action, but it is commented out in `mkdocs.yml`.

To enable it for local builds, uncomment the line with `htmlproofer` in the `plugins` section of `mkdocs.yml` and parse the build output for warnings.


[MkDocs]: https://www.mkdocs.org/
[Markdown]: https://daringfireball.net/projects/markdown/
[Git]: https://git-scm.com
[Python]: https://www.python.org/downloads/
[Docker]: https://docs.docker.com/get-docker/

[mike]: https://github.com/jimporter/mike
[GitHub actions]: https://github.com/percona/everest-doc/actions
[ImageMagick]: https://imagemagick.org/script/download.php
[composite]: https://imagemagick.org/script/composite.php
[Node.js]: https://nodejs.org/en/download/
