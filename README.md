bcs_nginx Cookbook
======================
Configures nginx in a consistent manner for the bcs systems.
Installing nginx and adding virtual_servers are the main responsiblities.


Requirements
------------

The System requirements along with the versions.

Default recipe

| Requirement | Tested Version                                                  |
| ----------- | ----------------------------------------------------------------|
| Chef        | 11.0+                                                           |
| Ruby        | 2.1.1+                                                          |
| Ubuntu      | 12.04+                                                          |
| nginx       | Cookbook Opscode 2.4.4+                                         |

Monit_virtual_server recipe

| Requirement | Version                                                         |
| ----------- | ----------------------------------------------------------------|
| monit       | 5.3.2                                                           |


Attributes
----------

HTTPD Attributes
| Attribute     | Description             | Default             |
| ------------- | ------------------------| --------------------|
| monit_address | url to monit            | 'monit.islay'       |
| monit_port    | port monit listening on | '2812'              |


Usage
-----

| Recipe               | Description                                             |
| -------------------- | ------------------------------------------------------- |
| default              | Installs nginx through the package management system    |
| monit_virtual_server | Add nginx virtual_server block into sites-enabled       |

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx-wrapper::default]"
  ]
}
```

Verify
------

Verifying Monit Virtual Server
* spin up only monit-virtual-server-ubuntu-1204
* cat /etc/hosts should include: 192.168.1.240      monit.islay
* visit monit.islay with browser


Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: richard wigley
