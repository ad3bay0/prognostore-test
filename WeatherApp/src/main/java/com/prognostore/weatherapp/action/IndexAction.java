/**
 * 
 */
package com.prognostore.weatherapp.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.prognostore.weatherapp.model.WeatherOb;
import com.prognostore.weatherapp.service.GeonamesWeatherServiceClient;

/**
 * Action class returns index.jsp and geolocation weather observation method
 * 
 * @author Adebayo Adeniyan
 *
 */

@SuppressWarnings("serial")
public class IndexAction extends BaseAction {
	
    private Double lat=6.5833;
	
	private Double lon=3.3333;
	
	private WeatherOb wob;
	
	
	@Action(value="/",results={@Result(name="success",location="/WEB-INF/content/jsps/index.jsp")})
	public String initAction(){
			
		
		return SUCCESS;
	}
	

	@Action(value="load-weather",results={@Result(name="success",location="/WEB-INF/content/jsps/weatherObservationDiv.jsp")})
	public String loadWeatherOb(){
		
		if(getLon()==null || getLat()==null){
			
          addActionError("please input a longitude and latitude value before submitting");
			
			return SUCCESS;	
		}
		
			
		wob = GeonamesWeatherServiceClient.findNearByWeatherByGeolocation(getLon(), getLat());
		
		if(wob==null){
			
			addActionError("no weather observation found for this geolocation");
			
			return SUCCESS;
		}
		
		session.put("wobserv", wob);
		
		addActionMessage("geolocation weather observation updated!");
		
		return SUCCESS;
	}


	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLon() {
		return lon;
	}

	public void setLon(Double lon) {
		this.lon = lon;
	}

	public WeatherOb getWob() {
		return wob;
	}

	public void setWob(WeatherOb wob) {
		this.wob = wob;
	}
	
}
