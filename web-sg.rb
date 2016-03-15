require 'fog'
require 'fog/aws'
require 'yaml'
require "yaml/store"

@rules =  YAML.load_file("aws.yaml")
def ingress
@ingress =  YAML.load_file("ingress.yaml")

end
fog = Fog::Compute.new({:provider=>"AWS", :aws_access_key_id=>"xxxxxxxxxxx", :aws_secret_access_key=>"xxxxxxxxxxxxxxxx"})


result = fog.security_groups.create(@rules)

security_group1 = fog.security_groups.get("web-sg")
#fog.security_groups.authorize_cidrip("0.0.0.0/0")
#security_group.authorize_port_range(80..80)

#security_group = fog.security_groups.get(test)
#fog.security_groups.authorize_cidrip()
security_group1.authorize_port_range @ingress

