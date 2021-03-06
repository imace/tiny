/**
 *  Copyright (c) 1997-2013, www.tinygroup.org (luo_guo@icloud.com).
 *
 *  Licensed under the GPL, Version 3.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *       http://www.gnu.org/licenses/gpl.html
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.tinygroup.database.config.view;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

@XStreamAlias("view-field-ref")
public class ViewFieldRef {
	@XStreamAsAttribute
	@XStreamAlias("view-table-id")
	String viewTableId;
	@XStreamAsAttribute
	@XStreamAlias("table-field-id")
	String tableFieldId;
	@XStreamAsAttribute
	@XStreamAlias("view-field-id")
	String viewFieldId;
	public String getViewTableId() {
		return viewTableId;
	}
	public void setViewTableId(String viewTableId) {
		this.viewTableId = viewTableId;
	}
	public String getTableFieldId() {
		return tableFieldId;
	}
	public void setTableFieldId(String tableFieldId) {
		this.tableFieldId = tableFieldId;
	}
	public String getViewFieldId() {
		return viewFieldId;
	}
	public void setViewFieldId(String viewFieldId) {
		this.viewFieldId = viewFieldId;
	}
	
	
}
