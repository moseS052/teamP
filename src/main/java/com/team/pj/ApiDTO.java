package com.team.pj;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ApiDTO {
	String getTagValue(String sTag, Element eElement) {
		NodeList nlist = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
		Node nValue =(Node)nlist.item(0);
		return nValue.getNodeValue();
	}
}
