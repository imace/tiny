--
--  Copyright (c) 1997-2013, www.tinygroup.org (luo_guo@icloud.com).
--
--  Licensed under the GPL, Version 3.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--       http://www.gnu.org/licenses/gpl.html
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
--

with o as
(
	select 'a' obj, 'b' link from dual union all
	select 'a', 'c' from dual union all
	select      'c', 'd' from dual union all
	select           'd', 'c' from dual union all
	select           'd', 'e' from dual union all
	select                'e', 'e' from dual
)
select 
  connect_by_root obj root,
  level,
  obj,link,
  sys_connect_by_path(obj||'->'||link,','),
  connect_by_iscycle,
  connect_by_isleaf
from o
connect by nocycle obj=prior link
start with obj='a'

