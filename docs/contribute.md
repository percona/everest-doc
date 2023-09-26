# Contributing guide

Thank you for deciding to contribute and help us improve Percona Everest! We also contribute to other open source projects and communities! Let’s make technology better!

By contributing, you agree to the [Percona Community code of conduct](https://percona.community/contribute/coc/).

We welcome all kinds of contributions so here's how you can get involved:

- Submit bug reports or feature requests
- Submit a code patch
- Contribute to documentation


## Submit a bug report or feature request

If you find a bug in Percona Everest, you can submit a report via the [Percona  Everest Community Forum](https://forums.percona.com). 
Start by searching the open topics for a similar report. If you find that someone else has already reported the same issue, you can upvote that report to increase its visibility.

If there is no existing report, submit a report following these steps:

1. Sign in to [Percona Everest Forum](hhttps://forums.percona.com/). You will need to create an account if you do not have one.

2. Create a report that:      
      -  describes the steps to reproduce the issue
      -  includes the version of Percona Everest, your environment, and so on
      -  has not been reported already 
      -  is scoped to a single bug

## Contribute to Percona Everest code:

If you’d like to submit a code patch, follow the [Contributing guide in Everest code repository](https://github.com/percona/percona-everest-backend/blob/main/CONTRIBUTING.md).


## Contribute to Percona Everest documentation

Found a typo or didn't find what you needed? Here's how you can contribute to the documentation:

1. **Request a doc change through a Jira issue**. If you’ve spotted a doc issue (a typo, broken links, inaccurate instructions, etc.) but don’t have time nor desire to fix it yourself - let us know about it.

	- Click the **Jira** link in the contact us section. This opens the [Jira issue tracker](https://jira.percona.com/projects/Everest).
	- Sign in (create a Jira account if you don’t have one) and click **Create** to create an issue.
	- Describe the issue you have detected in the Summary, Description, Steps To Reproduce, Affects Version fields.

2. **[Contribute to documentation directly](#contribute-to-documentation-yourself)**. There is the **Edit this page** link that leads you to the source file of the page on GitHub. There you make changes, create a pull request that we review and add to the doc project. For details how to do it, read on.

### Contribute to documentation directly

To contribute to the documentation, you should be familiar with the following technologies:

- [Markdown] markup language. We write the documentation in it.
- [MkDocs] generator. We use it to convert source ``.md`` files to html and PDF documents.
- [git](https://git-scm.com/) and [GitHub](https://guides.github.com/activities/hello-world/)
- [Docker]. It allows you to run MkDocs in a virtual environment instead of installing it and its dependencies on your machine.

The `.md` files are in the `docs/` directory. 

#### Edit documentation online via GitHub

1. Select the pencil icon next to the page title to open the source file in the GitHub editor. In this editor, you can make the changes, view the changes in the Preview tab, and create a pull request. If you haven’t worked with the repository before, GitHub creates a [fork](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo) of it for you.

2. Edit the page. You can check your changes on the **Preview** tab.

3. Commit your changes.

	 - In the *Commit changes* section, describe your changes.
	 - Select the **Create a new branch for this commit and start a pull request** option
	 - Click **Propose changes**.

4. GitHub creates a branch and a commit for your changes. It loads a new page on which you can open a pull request to Percona. The page shows the base branch - the one you offer your changes for, your commit message and a diff - a visual representation of your changes against the original page.  This allows you to make a last-minute review. When you are ready, click the **Create pull request** button.
5. Someone from our team reviews the pull request and if everything is correct, merges it into the documentation. Then it gets published on the site.

##### Edit documentation locally

This option is for users who prefer to work from their computer and / or have the full control over the documentation process.

The steps are the following:

1. Fork this repository
2. Clone the repository to your machine.

      ```sh
         git clone git@github.com:<your_account>/everest-doc.git
      ```

3. Change the directory to `everest-doc` and add the remote upstream repository:

      ```sh
      git remote add upstream git@github.com:percona/everest-doc.git
      ```

4. Create a separate branch for your changes:

      ```sh
      git checkout -b <my_changes>
      ```

5. Make changes
6. Commit your changes
7. Open a pull request to Percona

#### Building the documentation

To verify how your changes look, generate the static site with the documentation. This process is called *building*. You can do it in these ways:

- [use Docker](#use-docker)
- [build locally](#build-locally)

##### Use Docker

1. [Get Docker](https://docs.docker.com/get-docker/)

2. We use [our Docker image](https://hub.docker.com/repository/docker/perconalab/pmm-doc-md) to build documentation. Run the following command:

      ```sh
      docker run --rm -v $(pwd):/docs perconalab/pmm-doc-md mkdocs build
      ```
       If Docker can't find the image locally, it first downloads the image, and then runs it to build the documentation.

3. Go to the ``site/`` directory and open the ``index.html`` file to see the documentation.

      If you want to see the changes as you edit the docs, use this command instead:

      ```sh
      docker run --rm -v $(pwd):/docs -p 8000:8000 perconalab/pmm-doc-md mkdocs serve --dev-addr=0.0.0.0:8000
      ```

      Wait until you see the message `INFO    -  Start detecting changes`, then enter `0.0.0.0:8000` in the browser's address bar. The documentation automatically reloads after you save the changes in source files.


#### Build locally

1. Install [pip](https://pip.pypa.io/en/stable/installing/)
2. Install [MkDocs].
3. While in the root directory of the doc project, run the following command to build the documentation:

      ```sh
      mkdocs build
      ```
4. Go to the ``site`` directory and open the ``index.html`` file in your web browser to see the documentation.
5. To automatically rebuild the documentation and reload the browser as you make changes, run the following:
   
      ```sh
      mkdocs serve
      ```
   Wait until you see the message `INFO    -  Start detecting changes`, then enter `0.0.0.0:8000` in the browser's address bar. 

### Create a PDF version

To create the PDF version of the documentation, use the following command:

* With Docker:

    ```sh
    docker run --rm -v $(pwd):/docs -e ENABLE_PDF_EXPORT=1 perconalab/pmm-doc-md mkdocs build -f mkdocs-pdf.yml
    ```

* With MkDocs:

    ```sh
    ENABLE_PDF_EXPORT=1 mkdocs build -f mkdocs-pdf.yml
    ```

The PDF is in `site/_pdf`.

### Repository structure

The repository includes the following directories and files:

- `mkdocs-base.yml` - the base configuration file. It includes general settings and documentation structure.
- `mkdocs.yml` - configuration file. Contains the settings for building the docs with Material theme.
- `mkdocs-pdf.yml` - configuration file. Contains the settings for building the PDF docs.
- `docs`:

  - `*.md` - source markdown files.
  - `images` - images, logos and favicons
  - `css` - styles
  - `js` - javascript files

    
[MkDocs]: https://www.mkdocs.org/
[Markdown]: https://daringfireball.net/projects/markdown/
[Git]: https://git-scm.com
[Python]: https://www.python.org/downloads/
[Docker]: https://docs.docker.com/get-docker/
