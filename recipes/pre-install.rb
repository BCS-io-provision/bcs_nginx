# Make sure the default webserver is not installed

service "apache2" do
  action [:stop]
end

