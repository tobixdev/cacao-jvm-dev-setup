# Acknowledgements

Thanks to [dinfuehr](https://gist.github.com/dinfuehr) for providing [cacao-jvm-dockerfile](https://gist.github.com/dinfuehr/ab83ad825cd24be0e816588d0465a7fb), which is the core of this repository.

# What is this?

This guide summarizes the setup of a [cacaojvm](http://www.cacaojvm.org/) dev container using Windows 10 with docker. In theory a similar approach should work on Linux based systems, if you want to isolate your cacao-dev environment from your day-to-day system.

This repository solely extends the gist provided by [dinfuehr](https://gist.github.com/dinfuehr) with an "Getting Started" installation guide.

Tools used in this guide:
* Windows 10 Pro
* docker for Desktop
* Visual Studio Code
 * [Remote - Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

# Getting Started

* Fork the repository using your BitBucket account. [Further information](http://c1.complang.tuwien.ac.at/cacaowiki/Draft/CodeSubmissionProcess?action=show&redirect=Contributing) on the code submission process.
* Clone the forked repository into a well known location (e.g. `C:\Development`)
* Open VS Code
* Open the cacao folder in the dev container
 * Press F1 to open the command palette.
 * Execute the command `Remove-Containers: Open Folder in Container`
 * Select the folder created through cloning this repository in Step #1.
* Let VS Code do the rest
 * VS Code will setup the container for you
* Verify the installation
 * Toggle the integrated terminal
 * Open a new bash shell
 * Try to locate the `cacao-staging` repository under `/code/cacao-staging`
* You should now be able to use the `Open Folder` command to open the folder `/code` in the container