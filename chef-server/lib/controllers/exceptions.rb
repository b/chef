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

class Exceptions < Application
  
  provides :html, :json
  
  # handle NotFound exceptions (404)
  def not_found
    display params
  end

  # handle NotAcceptable exceptions (406)
  def not_acceptable
    display params
  end
  
  # handle BadRequest exceptions (400)
  def bad_request
    display params
  end

end