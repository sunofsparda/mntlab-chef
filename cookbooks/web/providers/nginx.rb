action :install do
  package "nginx" do
    action :install
  end
end

action :start do
  service "nginx" do
    action :start
  end
end

action :stop do
  service "nginx" do
    action :stop
  end
end

action :restart do
  service "nginx" do
    action :restart
  end
end

action :reload do
  service "nginx" do
    action :reload
  end
end

action :enable do
  service "nginx" do
    action :enable
  end
end