# Fedora IoT Edition documentation

This is the build repository for the Fedora IoT Documentation Website. The latest
published version of the site can be found at [Fedora IoT Docs](https://docs.fedoraproject.org/en-US/iot/).

Please report issues with IoT related docs and submit Pull Requests for **IoT Documentation Enhancements and Fixes** here.

The IoT documentation is built using [Antora](https://antora.org). General details for
getting started can be found on the main docs.fp.o [guide](https://docs.fedoraproject.org/en-US/fedora-docs/contributing-docs/).

## Testing your changes locally

Build and preview is done in Docker containers and should work on any Linux distro running Docker.
Should also work on macOS running the Docker CE.

**To build the site**, run:

```bash
$ ./build.sh
```

Please note the build script uses Docker to build the site in an isolated environment.
You might be asked for a root password in order to run it.

The result will be in a `./public/` directory.

**To preview the site**, either open the `./public/en_US/index.html` file in a web browser, or run:

```bash
$ ./preview.sh
```

