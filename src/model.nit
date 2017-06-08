# Copyright 2016 Alexandre Terrasa <alexandre@moz-code.org>.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module model

import popcorn::pop_config
import popcorn::pop_repos

redef class AppConfig
	redef var default_db_name = "catfacts"
	var facts = new FactsRepo(db.collection("facts")) is lazy
end

class CatFact
	super RepoObject
	serialize

	var user: String is writable

	var fact: String is writable
end

class FactsRepo
	super MongoRepository[CatFact]
end
