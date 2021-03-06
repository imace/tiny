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

select
	"a3"."r_id" "r_id"
from
	"pe" "a3",
	"me" "a2"
where
	 "a3"."m_id"="a2"."m_id"
	 and "a2"."mi_t" =
	 any
	 (((
		select "a4"."sys$"."id"
		from the
		(
 		 	select "qa"."u_pkg"."getchartable"
 		 	(
 		 	 	"qa"."u_pkg"."glist"
 		 	 	(
 		 	 		cursor
 		 	 		(
 		 	 			select "qa"."u_pkg"."glist"
 		 	 			(
 		 	 				cursor
 		 	 				(
		 	 					select "a6"."mi_t" "mi_t"
		 	 					from "me" "a6"
		 	 					connect by "a6"."mi_uid"=prior "a6"."mi_id"
		 	 					start with "a6"."mi_t"=:b1
	 	 	 				)
	 	 	 			)
 	 	 	 			"lst"
	 	 	 			from "sys"."dual" "a5"
	 	 	 		)
	 	 	 	)
	 	 	)
	 	 	from dual
	 	)
	 	"a4"
	)))

