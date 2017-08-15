require 'sinatra'
require 'sinatra/reloader' if development?
require 'open3'

# omitting at this time: files_quota, files_grace, blocks_quota, blocks_grace
Volume = Struct.new(:name, :blocks_count, :blocks_limit, :files_count, :files_limit)

get '/' do
  # Define your variables
  @title = "Quota"
  # TODO:
  # @command = "quota"
  # or
  # real time quota info on scratch and project:
  # /usr/lpp/mmfs/bin/mmlsquota -j <projectid> --block-size auto project
  # or other?
  @command = "grep efranz /users/reporting/storage/quota/netapp.netapp-home.ten.osc.edu-users_quota.txt"
  # TODO:
  # stdout_str, stderr_str, status = Open3.capture3(@command)
  # @output = stdout_str
  # @error = stderr_str unless status.success?

  @output = "As of 2017-08-13T16:02:39.194266 userid efranz on /users/PZS0530 used 32.57MB of quota 500GB and 2 files of quota 1000000 files\n" \
  "As of 2017-08-13T16:02:39.483896 userid efranz on /users/PZS0562 used 97.08GB of quota 500GB and 916417 files of quota 1000000 files\n"

  # example of what the model data could look like
  @volumes = []
  @volumes << Volume.new("/users/PZS0562", 101800800, 524288000, 916417, 1000000)
  @volumes << Volume.new("/users/PZS0530", 33352, 524288000, 2, 1000000)


  # Variables will be available in views/index.erb
  erb :index
end

run Sinatra::Application
