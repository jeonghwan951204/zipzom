<%@page import="java.text.DecimalFormat"%>
<%@page import="modelTO.rtpTO"%>
<%@page import="modelTO.pfsTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<% 
	ArrayList<rtpTO> lists = (ArrayList)request.getAttribute( "rtpList" );
	JSONArray jsonArray = new JSONArray();
	DecimalFormat format = new DecimalFormat("###,###");
	for(rtpTO rto : lists) {
		int seqRtp = rto.getSeqRtp();
		String si = rto.getSi();
		String gu = rto.getGu();
		String dong = rto.getDong();
		String bunji = rto.getBunji();
		String bName = rto.getbName();
		String bType = rto.getbType();
		int area2 = rto.getArea2();
		String contractDate = rto.getContractDate();
		String price = format.format(rto.getPrice());
		int floor = rto.getFloor();
		String bYear = rto.getbYear() + "년";
		String roadAddress = rto.getRoadAddress();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("seqRtp", seqRtp);
		jsonObject.put("si", si);
		jsonObject.put("gu", gu);
		jsonObject.put("dong", dong);
		jsonObject.put("bunji",bunji);
		jsonObject.put("bName", bName);
		jsonObject.put("bType", bType);
		jsonObject.put("area2", area2);
		jsonObject.put("contractDate",contractDate);
		jsonObject.put("price",price);
		jsonObject.put("floor",floor);
		jsonObject.put("bYear",bYear);
		jsonObject.put("roadAddress",roadAddress);
		
		jsonArray.add(jsonObject);
	}
	
	JSONObject result = new JSONObject(); 
	result.put( "totalRecord", lists.size() );
	result.put( "data", jsonArray );
	out.println( result );
	
	
%>