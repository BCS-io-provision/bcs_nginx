bcs_nginx Cookbook
======================
Configures nginx in a consistent manner for the bcs systems.
Installing nginx and adding virtual_servers are the main responsiblities.

Note: We are switching from a cookbook named [nginx](https://github.com/miketheman/nginx) to cookbook named [chef_nginx](https://github.com/chef-cookbooks/chef_nginx) until nginx cookbook has finished the 3.0.0 branch.
It is not obvious and I can't find it in the documentation of nginx cookbook.

> nginx vs. chef_nginx
>
> This cookbook is a fork from the 2.7.x branch of the community nginx cookbook.
>
> This fork will be actively supported by Chef Software and we will continue to migrate the cookbook to a more resource driven model, with incremental changes following the SemVer model.


Requirements
------------

The System requirements along with the versions.

Default recipe

| Requirement | Tested Version                                                  |
| ----------- | ----------------------------------------------------------------|
| Chef        | 12.0+                                                           |
| Ruby        | 2.2.1+                                                          |
| Ubuntu      | 14.04+                                                          |
| nginx       | Cookbook Opscode 2.4.4+                                         |

Monit_virtual_server recipe

| Requirement | Version                                                         |
| ----------- | ----------------------------------------------------------------|
| monit       | 5.3.2                                                           |


Attributes
----------



HTTPD Attributes

Attibutes are namespaced under nginx. `nodes['nginx']`

| Attribute        | Description                | Default             |
| ---------------- | -------------------------- | --------------------|
| monit_available  | If monit site is included  | false               |
| monit_address    | url to monit               | 'monit.islay'       |
| monit_port       | port monit listening on    | '2812'              |
| kibana_available | If kibana site is included | false               |


Usage
-----

| Recipe      | Description                                                           |
| ----------- | --------------------------------------------------------------------- |
| default     | Installs nginx through the package management system                  |
| monit_site  | Add virtual_server block for monit into sites-available and link to sites-enabled  |
| kibana_site | Add virtual_server block for kibana into sites-available and link to sites-enabled |

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[bcs_nginx::default]"
  ]
}
```

Verify
------

Verifying Monit Virtual Server
* spin up only monit-virtual-server-ubuntu-1204
* cat /etc/hosts should include: 192.168.1.240      monit.islay
* ping kitchen private network: ping 192.168.1.240
* login netstat -tulpn: should see 127.0.0.1:2812 (or whatever port)
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
