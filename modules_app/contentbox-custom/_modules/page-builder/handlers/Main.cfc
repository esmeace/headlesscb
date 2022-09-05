/**
 * Main handler
 */
component {

	//DI
	property name="contentStoreService"				inject="id:contentStoreService@contentbox";
	property name="categoryService"					inject="id:CategoryService@contentbox";
	property name="populator"						inject="wirebox:populator";


	/**
	 * Root Entry point for the cct editor
	 */
	function index( event, rc, prc ){
		event.setView( "main/index" );
	}

	/**
	 * @route (GET) /cct/:cctslug/search"
	 * 
	 * Search Items
	 * 
	 * @x-parameters /resources/apidocs/cct/Api/search/parameters.json##parameters
	*/
	function search( event, rc, prc ){
		// BEFORE ADDING EVENT CACHING, SEE THAT WE ALREADY DO IT BELOW INLINE.
		// THIS IS TO AVOID CORS CACHING ISSUES. PLEASE DON'T ADD EVENT
		// CACHING TO THIS FUNCTION.

		// param name="rc.sort" 				default="publishedDate";
		// param name="rc.sort2" 				default="";
		// param name="rc.max"         		default="#variables.MAX_RECORDS#";
		// param name="rc.isPublished" 		default="1";
		// param name="rc.isExpired" 			default="all";
		// param name="rc.onlyVisible" 		default="true";
		// param name="rc.date"  		  		default="#now()#";
		// param name="rc.offset"      		default="0";
		// param name="rc.filter_title"    	default="";
		// param name="rc.filter_published"	default="All";
		// param name="rc.filter_pubStart"		default="";
		// param name="rc.filter_pubEnd"		default="";
		// param name="rc.filter_expStart"		default="";
		// param name="rc.filter_expEnd"		default="";
		// param name="rc.filter_tags"			default="";
		// param name="rc.filter_tagsByID"		default="";
		// param name="rc.filter_tagsWithOr"		default="";
		// param name="rc.filter_tagsNot"			default="";
		// param name="rc.filter_tagsByIDWithOr"	default="";
		// param name="rc.excludeTemplates"		default="true";

		// // Flag to load a light version when the metadata is not needed (page editor vue)
		// param name="rc.getSnapshot"			default="false";
		// param name="rc.getListDetails"		default="false";
		// param name="rc.slim"      			default="false";
		// param name="rc.multipleBuckets"		default="false";


		// // fields for vuetables2
		// param name="rc.page"      		default="1";
		// param name="rc.per_page"      	default="0";
		// param name="rc.includeResultMap" default=false;

		// // TODO: Check for a valid CCT Slug

		// // vuetables2 overrides
		// if( rc.per_page && isNumeric( rc.per_page ) ){
		// 	rc.max = rc.per_page;
		// 	rc.offset = ( ( rc.page - 1) * rc.per_page );
		// }

		// if( isDate ( rc.date ) ){
		// 	rc.date = ParseDateTime( rc.date );
		// } else {
		// 	rc.date = now();
		// }

		// // Prepare variables for Service call
		// rc.max         	= ( rc.max > variables.MAX_RECORDS ? variables.MAX_RECORDS : rc.max )
		// rc.slug			= rc.cctslug;
		// rc.targetDate	= rc.date;
		// rc.sortOrder	= rc.sort;
		// rc.sortOrder2	= rc.sort2;

		// // Call search method
		// var results = customContentItemService.search( argumentCollection=rc );

		// if( rc.getSnapshot ) {

		// 	var cacheKey = generateCacheKey( "CCT_search_snapshot" & "_" & rc.cctslug, arguments.rc );
		// 	results[ "data" ] = cache.getOrSet( cacheKey, function() {
		// 		return getSearchSnapshot( results[ "data" ], rc.cctslug, rc.getListDetails, rc.slim, rc.multipleBuckets );
		// 	}, getMinutesUntilMidnight() );

		// 	var pagination = {};
		// 	if( rc.per_page ){
		// 		var totalRecords = results[ "count" ];
		// 		pagination = paginationUtil.generatePagination( rc, totalRecords );
		// 	}

		// 	theResults = paginationUtil.generateReturn(
		// 		results=results[ "data" ],
		// 		resultIDKey="contentID",
		// 		pagination=pagination,
		// 		includeResultMap=rc.includeResultMap,
		// 		includePagination=( rc.per_page > 0)
		// 	);
		// } else {
		// 	var cacheKey = generateCacheKey( "CCT_search" & "_" & rc.cctslug, arguments.rc );
		// 	var theResults = cache.getOrSet( cacheKey, function() {
		// 		results[ "data" ] = results[ "data" ].map( function( item ){
		// 			return serializeItem( item, rc.cctslug, rc.slim );
		// 		} );

		// 		var pagination = {};
		// 		if( rc.per_page ){
		// 			var totalRecords = results[ "count" ];
		// 			pagination = paginationUtil.generatePagination( rc, totalRecords );
		// 		}

		// 		return paginationUtil.generateReturn(
		// 			results=results[ "data" ],
		// 			resultIDKey="contentID",
		// 			pagination=pagination,
		// 			includeResultMap=rc.includeResultMap,
		// 			includePagination=( rc.per_page > 0)
		// 		)
		// 	}, getMinutesUntilMidnight() );

		// }

		prc.response.setData(
			"theResults"
		);
	}

	
	/**
	 * Ajax response to return a Custom Content Type record by Slug
	 */
	function getCategories( event, rc, prc ){
		var categories = categoryService.getAllForExport( prc.oCurrentSite ).sort( function ( c1, c2 ) {
			return compare( c1.category, c2.category );
		} );
		prc.response.setData( categories );
	}


	/**
	 * Save Event Action - Processes create / update / duplicate forms and saves the item.
	 */
	// function update( event, rc, prc ){
	// 	// TODO: Update to use jsonPayloadToRC - https://coldbox.ortusbooks.com/intro/introduction/whats-new-with-5.1.2#automatic-json-payload-setting
	// 	// Add body to rc scope
	// 	if(
	// 		len( event.getHTTPContent() )
	// 		&& isJSON(  event.getHTTPContent() )
	// 		&& isStruct( event.getHTTPContent( json=true ) )
	// 	) {
	// 		structAppend( rc, event.getHTTPContent( json=true ) );
	// 	}

	// 	// Param missing rc scope variables
	// 	event.paramValue( "contentID", "" );
	// 	event.paramValue( "cctSlug", "" );
	// 	event.paramValue( "slug", "" );
	// 	event.paramValue( "publishedDate", now() );
	// 	event.paramValue( "expireDate", now() );

	// 	// Find the custom content type
	// 	prc.cct = customContentTypeService.findBySlug( rc.cctSlug );
	// 	if( isNull( prc.cct ) ){
	// 		prc.response.setError( true );
	// 		prc.response.addMessage( "Custom Content Type not found" );
	// 	}

	// 	// Find the custom content type's Content Store item to set as the parent
	// 	prc.parent = customContentItemService.findBySlug( "#customContentTypeService.getSlugPrefix()##rc.cctSlug#" );
	// 	if( isNull( prc.parent ) ){
	// 		prc.response.setError( true );
	// 		prc.response.addMessage( "Custom Content Type not setup in the Content Store" );
	// 	}

	// 	// Check if we are creating a new item, or updating an existing
	// 	if( len( rc.contentID ) ){
	// 		prc.oItem = customContentItemService.get( rc.contentID );
	// 	}
	// 	if( isNull( prc.oItem ) ){
	// 		prc.oItem = customContentItemService.new();
	// 		prc.oItem.setCreator( prc.oCurrentAuthor );
	// 		prc.oItem.setParent( prc.parent );
	// 	}

	// 	if( arrayLen( rc.categories ) ){
	// 		// Create categories that don't exist first
	// 		var allCategories = [];
	// 		for( var thisCategory in rc.categories ){
	// 			if( structKeyExists( thisCategory, "slug" ) ){
	// 				var oCategory = categoryService.findBySlug( thisCategory.slug );
	// 			} else {
	// 				var oCategory = categoryService.findBySlug( "" );
	// 			}
	// 			oCategory = ( isNull( oCategory ) ? populator.populateFromStruct( target=categoryService.new(), memento=thisCategory, exclude="categoryID" ) : oCategory );
	// 			// save category if new only
	// 			if( !oCategory.isLoaded() ){ categoryService.save( entity=oCategory ); }
	// 			// append to add.
	// 			arrayAppend( allCategories, oCategory );
	// 		}
	// 		// detach categories and re-attach
	// 		prc.oItem.setCategories( allCategories );
	// 	}

	// 	// Set slug
	// 	prc.oItem.setSlug( "#customContentTypeService.getSlugPrefix()##rc.cctSlug#/#rc.slug#:#createUUID()#" );

	// 	if( structKeyExists( rc, "startDate" ) ){
	// 		rc.publishedDate 	= rc.startDate;
	// 	}
	// 	if( structKeyExists( rc, "endDate" ) ){
	// 		rc.expireDate 		= rc.endDate;
	// 	}

	// 	var fields = prc.cct.getSchemaAsStruct().fields;
	// 	prc.oItem = populateItem( prc.oItem, fields, rc, prc.oCurrentAuthor );

	// 	// Set current site
	// 	prc.oItem.setSite( prc.oCurrentSite );

	// 	// TODO: Extract to the model.
	// 	var newConstraints = duplicate( prc.oItem.constraints );
	// 	structDelete( newConstraints, "HTMLKeywords" );
	// 	structDelete( newConstraints, "HTMLDescription" );
	// 	structDelete( newConstraints, "featuredImage" );
	// 	structDelete( newConstraints, "featuredImageURL" );
	// 	structDelete( newConstraints, "passwordProtection" );

	// 	prc.validationResults = validateModel( target=prc.oItem, constraints=newConstraints );
	// 	if( prc.validationResults.hasErrors() ){
	// 		prc.response.setError( true );
	// 		prc.response.addMessage( "Error saving" );
    //         prc.response.addMessage( prc.validationResults.getAllErrors() );
	// 	} else {
	// 		// announce event
	// 		customContentItemService.save( prc.oItem );
	// 		cache.clearByKeySnippet( "CCT_get" & "_" & rc.cctslug & "_slug_contentID=" & rc.slug );
	// 		cache.clearByKeySnippet( "CCT_get" & "_" & rc.cctslug & "_contentID=" & rc.contentID );
	// 		cache.clearByKeySnippet( "CCT_search" & "_" & rc.cctslug );
	// 		cache.clearByKeySnippet( "CCT_search_snapshot" & "_" & rc.cctslug );
	// 		prc.response.setData( prc.oItem.getContentID() )
	// 		prc.response.addMessage( "Item Saved" );
    //     }
	// }

}