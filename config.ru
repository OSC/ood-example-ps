require 'sinatra'
require 'sinatra/reloader' if development?
require 'open3'

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

  # Variables will be available in views/index.erb
  erb :index
end

run Sinatra::Application
