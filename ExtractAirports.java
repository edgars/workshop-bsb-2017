package br.com.wso2.ext;


import org.apache.synapse.MessageContext; 
import org.apache.synapse.mediators.AbstractMediator;

public class ExtractAirports extends AbstractMediator { 

	public boolean mediate(MessageContext context) { 
		try {
			String xml = (String) context.getEnvelope().toString();
			
			String newXml = xml.replace("&lt;", "<").replace("&gt;", ">").trim();

			
			String coolXml = newXml.replace("Table", "Airport").replace("NewDataSet", "Airports");
			newXml = coolXml.replaceAll("\n","").replaceAll(" ", "").trim();
			
			coolXml = newXml.substring(newXml.indexOf("GetAirportInformationByCountryResult")+37, newXml.indexOf("/GetAirportInformationByCountryResult")-1);
			
			
			context.setProperty("AIRPORTS",  coolXml.toString());
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
