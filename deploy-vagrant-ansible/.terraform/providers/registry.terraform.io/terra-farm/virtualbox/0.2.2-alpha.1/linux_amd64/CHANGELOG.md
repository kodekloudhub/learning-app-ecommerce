# In progress

- Updated to use the Terraform Plugin SDK
- Test setup uses a mocking framework for easy testing
- Migrated from Travis CI to Github Actions

# v0.2.0

- Add support for Terraform v0.12
- Releases automated via Travis CI after the migration of the repository to the Terra-Farm Github organization

# v0.1.6

- Adding optical disks property to `virtualbox_vm` resource.

# v0.1.5

- Fixes for better automated releases via Travis CI

# v0.1.4

- Added code coverage generation

# v0.1.3

- Releases automated via Travis CI

# v0.1.2

- Add support for using external vagrant box and archives as source for deploy
- Add support for Terraform v0.9.5
- Activate Travis CI builds

# v0.1.1

- Add new optional field "user_data" in schema, accepts arbitary string, your VM specific configuration can be stored here.
  Some 3rdparty tool expects certain content be set in this field.
  For example, [mantl/terraform.py](https://github.com/mantl/terraform.py) (a terraform-ansible bridging tool) interprete 'user_data' as a JSON string:
  ```
  {
    "role": "foobar",
    ...
  }
  ```
  It uses the 'role' field to group hosts.
