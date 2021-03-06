#
# Author:: Adam Jacob (<adam@opscode.com>)
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

###
# Given
###

Given /^we have an empty file named '(.+)'$/ do |filename|
  filename = File.new(File.join(tmpdir, filename), 'w')
  filename.close
end

Given /^we have the atime\/mtime of '(.+)'$/ do |filename|
  @mtime = File.mtime(File.join(tmpdir, filename))
  @atime = File.atime(File.join(tmpdir, filename))
end

####
# Then
####

Then /^a file named '(.+)' should exist$/ do |filename|
  File.exists?(File.join(tmpdir, filename)).should be(true)
end

Then /^a file named '(.+)' should not exist$/ do |filename|
  File.exists?(File.join(tmpdir, filename)).should be(false)
end

Then /^the (.)time of '(.+)' should be different$/ do |time_type, filename|
  case time_type
  when "m"
    current_mtime = File.mtime(File.join(tmpdir, filename))
    current_mtime.should_not == @mtime
  when "a"
    current_atime = File.atime(File.join(tmpdir, filename))
    current_atime.should_not == @atime
  end
end

Then /^a file named '(.+)' should contain '(.+)'$/ do |filename, contents|
  file = IO.read(File.join(tmpdir, filename))
  file.should =~ /#{contents}/m
end

Then /^a file named '(.+)' should be from the '(.+)' specific directory$/ do |filename, specificity|
  file = IO.read(File.join(tmpdir, filename))
  file.should == "#{specificity}\n"
end

