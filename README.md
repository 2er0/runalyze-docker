# Runalyze Docker

## Requirements for this how-to

* Knowledge about:
   * SQL/MySQL
   * PHP
   * Docker

## Install Steps

### MYSQL

* Create a MySQL instanze 
* run if you are using MYSQL-5.7 `SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));` acording to [FAQ](https://docs.runalyze.com/en/latest/faq.html#runalyze-does-not-show-up-completely-mysql-only-full-group-by-problem)
* create a database for the application

### Map-Data

* download elevation data for your region from [DWTKNS](http://dwtkns.com/srtm/) to [./data/srtm](./data/srtm) as ZIP-Files

### Config-File

* Copy ./data/config/example-config.yml to ./data/config/config.yml
* fill out as much as possible, required: Database & Mail parts

### Get-Version

* download a prebuild version from [Runalyze Releases](https://github.com/Runalyze/Runalyze/releases) to [./data/version](./data/version)
* extract the the version to [./data/version/runalyze](./data/version/runalyze)
* fix a bug with Perl and Fit-Files [ISSUE 1701](https://github.com/Runalyze/Runalyze/issues/1701)

### Build-Container

* run `docker build -t <image-name> .` to build the docker image

### Run

* create a container like others with port mapping or not

## Thank

Thanks to the team of [Runalyze](https://github.com/Runalyze/Runalyze), for the awesome alternative to Garmin Cloud and others.
[Offical Install Guide](https://docs.runalyze.com/en/latest/installation/4.x.html#ubuntu-debian-distributions)

## LICENSE

* [GPL v3](./LICENSE)

## Contribution

For typos and other issues - pleace create a issue and for fixes -> pull requests
