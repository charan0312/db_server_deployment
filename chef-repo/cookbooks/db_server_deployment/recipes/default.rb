#
# Cookbook Name:: db_server_deployment
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
file "C:\\Users\\Administrator\\Documents\\script.sql" do
   action :delete
end

remote_file "C:\\Users\\Administrator\\Documents\\sample_db.zip" do
  source 'https://s3-ap-northeast-1.amazonaws.com/swamykonanki/script.zip'
  action :create
end

dsc_script 'Unzip' do
    code <<-EOH
      Archive Download {
        Ensure = "Present"
        Path = "C:\\Users\\Administrator\\Documents\\sample_db.zip"
        Destination = "C:\\Users\\Administrator\\Documents\\"
      }
    EOH
  end

file "C:\\Users\\Administrator\\Documents\\sample_db.zip" do
   action :delete
end
