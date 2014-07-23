michaloo/mongodb
=========

Simple mongodb docker image.

## Usage

Create volume container:
`docker run -d --name data_mongodb -v /data/db tianon/true`

And Mongodb itself:
`docker run -d --name mongodb --volumes-from data_mongodb -P michaloo/mongodb`
