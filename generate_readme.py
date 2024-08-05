#!/usr/bin/python3

##
## generate_readme.py
##
## Copyright (c) 2021-2023 Bartek Kryza <bkryza@gmail.com>
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##

import yaml
import os
import sys


def load_clanguml_config(name, path):
    if path is None:
        clanguml_config_path = os.path.join(name, '.clang-uml')
    else:
        clanguml_config_path = path

    with open(clanguml_config_path, 'r') as f:
        config = yaml.full_load(f)

    # load included config files
    for diagram_name in config['diagrams'].keys():
        if 'include!' in config['diagrams'][diagram_name]:
            include_path = os.path.join(name,
                                        config['diagrams'][diagram_name][
                                            'include!'])
            with open(include_path, 'r') as f:
                config['diagrams'][diagram_name] = yaml.full_load(f)

    return config


def generate_readme(config, name):

    with open(os.path.join("README.md"), 'w') as f:
        f.write(f'# {name} UML diagrams\n')

        for diagram_name in config["diagrams"].keys():
            title = config['diagrams'][diagram_name]['title']
            f.write(f'## {title}\n')
            f.write(f'![puml](puml/{diagram_name}.svg)\n\n')


if __name__ == "__main__":
    name = sys.argv[1]
    path = None
    if len(sys.argv) > 2:
        path = sys.argv[2]
    config = load_clanguml_config(name, path)
    generate_readme(config, name)

