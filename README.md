Ambari Cookbook
===============
![Travis CI status](https://travis-ci.org/jp/ambari.svg)

Installs ambari-server and ambari-agent in order to provision a cluster with the Hortonworks Data Platform.  This cookbook also supports provisioning supported services through the Ambari API via Ambari Blueprints.  For more on blueprints, please refer to the Apache project's documentation [here](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints).

Supports Ambari 1.7 and 2.0.

Requirements
------------
Supports all OS distributions and versions supported by Ambari.

- RHEL, CentOS, and Oracle Linux 5, 6, and 7.
- Suse 11
- Ubuntu 12 and 14.
- Debian 7

Usage
-----
#### ambari::server

Include `ambari::server` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ambari::server]"
  ]
}
```

#### ambari::agent

Include `ambari::agent` in your node's `run_list` (all the nodes of your cluster):

The Ambari Server will be automatically detected, but you can override this detection using the attribute `node['ambari']['server_fqdn']`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ambari::agent]"
  ]
}
```

#### ambari::blueprints

Include `ambari::blueprints` in your node's `run_list`. Then configure the `blueprints` attributes listed below.

Main Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>node['ambari']['rhel_5_repo']</tt></td>
    <td>URL for the RHEL 5.x repository</td>
    <td><tt>http://public-repo-1.hortonworks.com/ambari/centos5/2.x/updates/2.0.0/ambari.repo</tt></td>
  </tr>
  <tr>
    <td><tt>node['ambari']['rhel_6_repo']</tt></td>
    <td>URL for the RHEL 6.x repository</td>
    <td><tt>http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.0/ambari.repo</tt></td>
  </tr>
  <tr>
    <td><tt>node['ambari']['suse_11_repo']</tt></td>
    <td>URL for the Suse 11.x repository</td>
    <td><tt>http://public-repo-1.hortonworks.com/ambari/suse11/2.x/updates/2.0.0/ambari.repo</tt></td>
  </tr>
  <tr>
    <td><tt>node['ambari']['server_fdqn']</tt></td>
    <td>FQDN for the Ambari server</td>
    <td><tt>Found by searching a node using the recipe ambari::server in the same environment</tt></td>
  </tr>
</table>

Blueprints Attributes
----------

<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>node['ambari']['blueprints']['blueprint_name']</tt></td>
    <td>Name of the cluster's blueprint</td>
  </tr>
  <tr>
    <td><tt>node['ambari']['blueprints']['blueprint_json']</tt></td>
    <td>JSON description of the Blueprint. See a single-node example here : https://cwiki.apache.org/confluence/display/AMBARI/Blueprints#Blueprints-ExampleBlueprint</td>
  </tr>
  <tr>
    <td><tt>node['ambari']['blueprints']['cluster_name']</tt></td>
    <td>Cluster's name</td>
  </tr>
  <tr>
    <td><tt>node['ambari']['blueprints']['cluster_json']</tt></td>
    <td>JSON template for the Cluster. See a single-node example here: https://cwiki.apache.org/confluence/display/AMBARI/Blueprints#Blueprints-ExampleClusterCreationTemplate</td>
  </tr>
</table>


Contributing
------------

If you wish to contribute on this cookbook:

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author: [Julien Pellet](https://twitter.com/julienpellet)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
