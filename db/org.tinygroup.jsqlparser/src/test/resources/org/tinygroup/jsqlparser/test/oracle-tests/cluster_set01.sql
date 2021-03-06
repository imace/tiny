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

with
clus_tab as (
select id,
       a.attribute_name aname,
       a.conditional_operator op,
       nvl(a.attribute_str_value, round(a.attribute_num_value),4) val,
       a.attribute_support support,
       a.attribute_confidence confidence
  from table(dbms_data_mining.get_model_details_km('km_sh_clus_sample')) t,
       table(t.rule.antecedent) a
 where a.attribute_confidence > 0.55
),
clust as (
select id,
       cast(collect(cattr(aname, op, to_char(val), support, confidence))
         as cattrs) cl_attrs
  from clus_tab
group by id
),
custclus as (
select t.cust_id, s.cluster_id, s.probability
  from (select cust_id, cluster_set(km_sh_clus_sample, null, 0.2 using *) pset
          from mining_data_apply_v
         where cust_id = 101362) t,
       table(t.pset) s
)
select a.probability prob, a.cluster_id cl_id,
       b.attr, b.op, b.val, b.supp, b.conf
  from custclus a,
       (select t.id, c.*
          from clust t,
               table(t.cl_attrs) c) b
 where a.cluster_id = b.id
order by prob desc, cl_id asc, conf desc, attr asc, val asc
