<cfoutput>
	<h2>Template Manager</h2>

	<div>
		Content
	</div>

	<cfif getSetting( "environment" ) eq "development">
		<script type="application/javascript" src="#prc.cbroot#/includes/js/contentbox-editors.js"></script>
	<cfelse>
		<script type="application/javascript" src="#prc.cbroot#/includes/js/contentbox-editors.min.js"></script>
	</cfif>

</cfoutput>
