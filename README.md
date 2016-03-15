[Русский текст](https://github.com/gkpromtech/exhibition-db/wiki)

# Exhibition online database

Database schema created for MySQL server.

## Project

    /db
    /db /model - DB schema
    /db /data  - data
    /db /patches - migration patches
    /db /backup - backups

## Setup

You need to run script ```install```

Installation script uses configuration parameters from file ```db.conf```. 
You need to rename file ```db.conf.example``` and modify parameters:

    dbname=exhibition
    user=root
    pass=12345678

Next, run script:

> bash -e ./install --force -- drop

Parameters:

    -- force - install schema, data, patches 
    -- drop - drop old schema & data

Setup process:

1. First, make DB backup in ``/db/backup``
2. Next, setup DB schema and triggers from ``/db/model``
3. Next, setup data from ``/db/data``
4. Next, setup migration patches from ``/db/patches``

## License

Copyright 2016 gkpromtech 

https://gkpromtech.ru

info@gkptomtech.ru

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
