/**
 * 
 */
package com.prognostore.weatherapp.action;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * BaseAction class
 * 
 * 
 * @author Adebayo Adeniyan
 *
 */
@SuppressWarnings("serial")
public class BaseAction extends ActionSupport implements SessionAware {

	protected Logger _log = Logger.getLogger(getClass());
	
	protected Map<String, Object> session;

	public void setSession(Map<String, Object> sess) {
		this.session = sess;

	}

}
