# Acknowledgements

Thanks to [dinfuehr](https://gist.github.com/dinfuehr) for providing [cacao-jvm-dockerfile](https://gist.github.com/dinfuehr/ab83ad825cd24be0e816588d0465a7fb), on which this guide is based.

# What is this?

This guide summarizes the setup of a [cacaojvm](http://www.cacaojvm.org/) dev container using Windows 10 with docker.

In theory a similar approach should work on Linux based systems, if you want to isolate your cacao-dev environment from your day-to-day system.

Tools used in this guide:
* Windows 10 Pro
* docker for Desktop
* Visual Studio Code
    * [Remote - Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

# Getting Started

* Fork the repository using your BitBucket account. [Further information](http://c1.complang.tuwien.ac.at/cacaowiki/Draft/CodeSubmissionProcess?action=show&redirect=Contributing) on the code submission process.
* Change the mercurial repository link in the docker file (`RUN hg clone https://bitbucket.org/cacaovm/cacao-staging`) to your forked repository.
* Open VS Code
* Create the dev container
    * Press F1 to open the command palette.
    * Execute the command `Remove-Containers: Reopen in Container`
* VS Code/docker will setup the container for you
* Verify the installation
    * Toggle the integrated terminal
    * Open a new bash shell
    * Try to locate the `cacao-staging` repository under `/code/cacao-staging`
* You should now be able to use the `Open Folder` command to open the folder `/code` in the container
* Validate the environment by invoking `make check` in the `/code/build` directory