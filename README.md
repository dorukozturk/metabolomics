# Instructions

### Prerequisites

In order to build the containers install the following:

1) Docker
2) Packer
3) Ansible
4) Singularity

Latest versions of prerequisites should be ok to install.

### Building the Singularity Image

After all the preprequisites are installed run:

```sh
cd devops
./build
```

This should place the __singularity.img__ file which is a singularity image.
The image will have R as well as [MetaboAnalystR](https://github.com/xia-lab/MetaboAnalystR) package installed.

### Building the Docker Image

There is also a Dockerfile for creating a docker image.

In order to build the docker image:

```sh
cd devops
docker build -t metabolomics .
```

### Running R Scripts Against the Container

After we build the images we can run R scripts against the container.
There are currently 2 simple examples that could be used as starting points.

Simply run:

```sh
 singularity exec metabolomics.simg Rscript examples/simple.R examples/data_original.csv
```

We just ran a simple R script and the script requires a data file as an argument (which is data_original.csv) file.
This should produce a pdf file in your current directory which should have a plot.

Also to call some of the functions that MetaboAnalystR library provides check the other R example.

```sh
singularity exec metabolomics.simg Rscript examples/metaboanalyst.R
```
