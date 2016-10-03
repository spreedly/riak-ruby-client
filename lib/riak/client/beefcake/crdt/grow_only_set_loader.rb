# Copyright 2010-present Basho Technologies, Inc.
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

class Riak::Client::BeefcakeProtobuffsBackend
  class CrdtLoader
    class GrowOnlySetLoader
      def self.for_value(resp)
        return nil unless resp.gset_value
        new resp.gset_value
      end

      def initialize(gset_value)
        @value = gset_value
      end

      def rubyfy
        ::Set.new @value
      end
    end
  end
end