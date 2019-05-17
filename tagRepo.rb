#!/opt/chefdk/embedded/bin/ruby

require 'fileutils'

`git pull`

`git log --pretty=format:"%H;" -p metadata.rb | grep ';\\|+version' > .tmp-tag`
# | sed -r "N; s/([a-zA-Z0-9]*)¦\n\+version\s*'([0-9.]*)'/\1¦v\2/g"
file = File.open('.tmp-tag', 'rb')
raw_log = file.read
file.close

raw_log.gsub!(/([a-zA-Z0-9]*);\n\+version\s*'([0-9.]*)'/, '\1;v\2')

raw_log.split("\n").uniq { |commit| commit.split(';')[1] }.each do |commit|
  commit_arr = commit.split(';')
  next unless commit_arr.length == 2
  `git tag -a #{commit_arr[1]} #{commit_arr[0]} -m "Automatically adding tag to commit where metadata.rb version changed"`
end

`git push --tags`
FileUtils.rm('.tmp-tag')