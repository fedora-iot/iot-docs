# Fedora IoT Objective documentation

This is the build repository for the Fedora IoT Documentation Website. The latest
published version of the site can be found at [Fedora IoT Docs](https://docs.fedoraproject.org/en_US/iot/).

Please report general Issues and submit Pull Requests for **Publishing Fixes** here.

The IoT documentatin is built using [Antora](https://antora.org). General details for
getting started can be found on the main docs.fp.o [repository](https://pagure.io/fedora-docs/docs-fp-o/tree/master).

## Testing your changes locally

Build and preview is done in Docker containers and should work on any Linux distro running Docker.
Should also work on macOS running the Docker CE.

**To build the site**, run:

```
$ ./build.sh
```

Please note the build script uses Docker to build the site in an insolated environment.
You might be asked for a root password in order to run it.

The result will be in a `./public/` directory.

**To preview the site**, either open the `./public/en_US/index.html` file in a web browser, or run:

```
$ ./preview.sh
```

