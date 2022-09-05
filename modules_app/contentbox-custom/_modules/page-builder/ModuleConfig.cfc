/**
* This is the Custom Content Type Editor Module - this allows us to edit the entries for each Custom Content Type
*/
component {

	property name="cb"					inject="id:cbHelper@contentbox";
	property name="securityService"		inject="securityService@contentbox";

	// Module Properties
	this.title 				= "The page builder module";
	this.author 			= "Ortus Solutions";
	this.webURL 			= "www.ortussolutions.com";
	this.description 		= "Dynamic page builder module for ContentBox";
	this.version			= "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "page-builder";
	// Model Namespace
	this.modelNamespace		= "page-builder";
	// CF Mapping
	this.cfmapping			= "page-builder";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= [ "contentbox" ];

	// menu Options
	variables.menuOptions = [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {

			contentboxAutoLoaders = {}

		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{
				pattern="/categories",
				handler="CustomContent",
				action="getCategories"
			},
			{
				pattern="/editor",
				handler="CustomContent",
				action 	= { GET = "index" }
			},
			{
				pattern="/search",
				handler="CustomContent",
				action={ GET = "search" }
			},
			// Module Entry Point
			{
				pattern="/manager", 
				handler="main",
				action="index"
			},
			// Convention Route
			{pattern="/:handler/:action?"}
		];


		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section
		var menuService = wirebox.getInstance( "AdminMenuService@contentbox" );
		
		menuService.addTopMenu(
			name        = "page_editor_topmenu",
			label       = "<i class='fas fa-pencil-alt'></i> Page Builder",
			permissions = "	CONTENTBOX_ADMIN"
		);

		menuService.addSubMenu(
			topMenu     = "page_editor_topmenu",
			name        = "page_builder_template_menu",
			label       = "<i class='fas fa-rocket'></i> Template Management",
			href        = "/cbadmin/module/page-builder/manager",
			permissions = "	CONTENTBOX_ADMIN"
        );

		menuService.addSubMenu(
			topMenu     = "page_editor_topmenu",
			name        = "page_builder_editor_menu",
			label       = "<i class='fas fa-edit'></i> Page Editor",
			href        = "/cbadmin/module/page-builder/editor",
			permissions = "	CONTENTBOX_ADMIN"
        );
	}

	/**
	* Fired when the module is activated by ContentBox
	*/
	function onActivate(){
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// TODO: Do not use CBORM here
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = wirebox.getInstance( "AdminMenuService@contentbox" );
		for( var slug in menuOptions ){
			// Remove Menu Contribution only if registered
			if( menuService.getTopMenuMap().keyExists( "page_editor_topmenu" ) ){
				// writedump(cct); abort;
				menuService.removeSubMenu( name="cct_editor_#slug#", topMenu = "page_editor_topmenu" );
			}
		}
	}

	/**
	* Fired when the module is deactivated by ContentBox
	*/
	function onDeactivate(){
	}

}