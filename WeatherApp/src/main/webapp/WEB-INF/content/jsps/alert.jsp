<%@taglib uri="/struts-tags" prefix="s" %>

<s:if test="hasActionErrors()">
<s:iterator value="actionErrors">
<br/>
<div class="alert-message alert alert-danger"><s:property escape="false"/></div>
</s:iterator>
</s:if>

<s:if test="hasFieldErrors()">
<s:iterator value="fieldErrors">

<s:iterator value="value">
<div class="alert-message alert alert-danger"><s:property escape="false"/></div>
<br/>
</s:iterator>
</s:iterator>
</s:if>
<s:if test="hasActionMessages()">
<s:iterator value="actionMessages">
<br/>
<div class="alert-message alert alert-success"><s:property escape="false"/></div>
</s:iterator>
</s:if>
</html>