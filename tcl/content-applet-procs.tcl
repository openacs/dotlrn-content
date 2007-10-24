
ad_library {
    Procs to set up the content applet
}

namespace eval content {
    
    ad_proc -public applet_key {
    } {
        What's my applet key?
    } {
        return "dotlrn_content"
    }
    
    ad_proc -public my_package_key {
    } {
        What package do I deal with?
    } {
	return "dotlrn-content"
    }
    
    ad_proc -public package_key {
    } {
        What package do I deal with?
    } {
	return "xowiki"
    }
    
#    ad_proc -private node_name {
#    } {
#	returns the node name
#    } {
#	return "xowiki"
#    }
    
    ad_proc -public get_pretty_name {
    } {
      returns the pretty name
    } {
       	return "#content-portlet.content#"
   
    }
    
    ad_proc -public add_applet {
    } {
	One time init - must be repeatable!
    } {
	dotlrn_applet::add_applet_to_dotlrn -applet_key [applet_key] -package_key [my_package_key]
    }
    
    ad_proc -public remove_applet {
    } {
	One time destroy. 
    } {
	ad_return_complaint 1 "[applet_key] remove_applet not implimented!"
    }
    
    ad_proc -public add_applet_to_community {
	community_id
    } {
	Add the content applet to a specifc dotlrn community
    } {
	# get the community portal id
	set portal_id [dotlrn_community::get_portal_id -community_id $community_id]
	# get applet id
	set applet_id [dotlrn_applet::get_applet_id_from_key -applet_key [applet_key]]
	
      # create the package instance
	set package_id [dotlrn::instantiate_and_mount -mount_point "content" $community_id [package_key]]
	apm_package_rename -package_id $package_id -instance_name [get_pretty_name]
	parameter::set_value -package_id $package_id -parameter "security_policy" -value "::xowiki::policyb"
	parameter::set_value -package_id $package_id -parameter "template_file" -value "ges-view"
	parameter::set_value -package_id $package_id -parameter "extra_css" -value "/resources/content-portlet/template/Gestheme.css"
	parameter::set_value -package_id $package_id -parameter "with_tags" -value "0"
	parameter::set_value -package_id $package_id -parameter "with_general_comments" -value "0"
	parameter::set_value -package_id $package_id -parameter "show_per_object_categories" -value "0"
	parameter::set_value -package_id $package_id -parameter "display_page_order" -value "0"
	set wk_folder_id [::xowiki::Page require_folder -name xowiki -package_id $package_id]

	ns_log notice "el pagquete $package_id y $wk_folder_id"


	::xowiki::Object create ::$wk_folder_id
          ::$wk_folder_id set text "\# this is the payload of the folder object\n\n\
                \#set index_page \"index\"\n
                 set xinha \{richtext(richtext),nospell
                             \{options \{editor xinha plugins \{
                             GetHtml CharacterMap ContextMenu FullScreen InsertAnchor
                             ListType TableOperations EditTag LangMarks Abbreviation OacsFs                                                                                 
                             \} height 350px \}\}
                             \{html \{rows 15 cols 50 style \{width: 100%\}\}\}
                             \{htmlarea_p 1\}\}
                  set tit \{text \{label \\\#xowiki.title\\\#\} \{html \{size 40 maxlength 50\}\} \{values \"\"\}\}
                  set widget_specs \[list *,contenido \$xinha *,title \$tit\]\n"
          ::$wk_folder_id set parent_id $wk_folder_id
          ::$wk_folder_id set name ::$wk_folder_id
          ::$wk_folder_id set title ::$wk_folder_id
          ::$wk_folder_id set package_id $package_id
          ::$wk_folder_id set publish_status "production"
          ::$wk_folder_id save_new
#          ::$wk_folder_id initialize_loaded_object


       
	set fn "[get_server_root]/packages/content-portlet/www/prototypes/gestemplate/GesTemplateIndex.page"
	set standard_page "index"
	if {[file readable $fn]} {
	    # create from default Template                                   
	    ns_log notice  "--in dotlrn sourcing page definition $fn, using name '$standard_page'"
	    set page [source $fn]
	    $page configure -name $standard_page \
		-parent_id $wk_folder_id -package_id $package_id
	    if {![$page exists title]} {
		$page set title $template1
	    }
	    $page destroy_on_cleanup
	    $page set_content [string trim [$page text] " \n"]
	    $page initialize_loaded_object
	    $page save_new
	}


	set fn "[get_server_root]/packages/content-portlet/www/prototypes/gestemplate/GesTemplateIndexe.page"
        set standard_page "es:o_index"
        if {[file readable $fn]} {
	    # create from default Template                                                                                                                                   
            ns_log notice  "--in dotlrn sourcing page definition $fn, using name '$standard_page'"
            set page [source $fn]
            $page configure -name $standard_page \
                -parent_id $wk_folder_id -package_id $package_id
            if {![$page exists title]} {
                $page set title $template1
            }
            $page destroy_on_cleanup
	    $page set_content [string trim [$page text] " \n"]
#            $page initialize_loaded_object
            $page save_new
        }



	set fn "[get_server_root]/packages/content-portlet/www/prototypes/gestemplate/GesTemplatebody.page"
	set standard_page "es:Template_de_ges"
	if {[file readable $fn]} {
	    # create from default Template                                                                                                                                 
	    ns_log notice  "--sourcing page definition $fn, using name '$standard_page'"
	    set page [source $fn]
	    $page configure -name $standard_page \
		-parent_id $wk_folder_id -package_id $package_id
	    if {![$page exists title]} {
		$page set title $template1
	    }
	    $page destroy_on_cleanup
	    $page set_content [string trim [$page text] " \n"]
	    $page initialize_loaded_object
	    $page save_new
	    
	}
	

	set fn "[get_server_root]/packages/content-portlet/www/prototypes/gestemplate/GesTemplateheader.page"
        set standard_page "es:Template_de_header"
        if {[file readable $fn]} {
	    # create from default header Template
            ns_log notice  "--sourcing page definition $fn, using name '$standard_page'"
            set page [source $fn]
            $page configure -name $standard_page \
                -parent_id $wk_folder_id -package_id $package_id
            if {![$page exists title]} {
                $page set title $template1
            }
            $page destroy_on_cleanup
            $page set_content [string trim [$page text] " \n"]
            $page initialize_loaded_object
            $page save_new
            set tmp_item_id [$page set item_id]

        }

	    set facultad "Facultad"
            set carrera "Carrera"
            set cours_name "Curso"

	set fn "[get_server_root]/packages/content-portlet/www/prototypes/gestemplate/GesTemplateheaderpage.page"
	set standard_page "es:header_page"
	if {[file readable $fn]} {
	    # create from default header page Template
	    ns_log notice  "--in dotlrn sourcing page definition $fn, using name '$standard_page'"
	    set page [source $fn]
	    $page configure -name $standard_page -parent_id $wk_folder_id -package_id $package_id
	    if {![$page exists title]} {
		$page set title $template1
	    }
	    $page set page_template $tmp_item_id
	    $page destroy_on_cleanup
	    $page set instance_attributes "Curso $cours_name Carrera $carrera Facultad $facultad"
	    $page set_content [string trim [$page text] " \n"]
	    $page initialize_loaded_object
	    $page save_new
	}


	content_category::map_new_tree -object_id $package_id -tree_name "Content"

    # set up the admin portlet
    
    set admin_portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
    content_admin_portlet::add_self_to_page \
	-portal_id $admin_portal_id \
	-package_id $package_id
    
    # set up the content portlet for this community
    
    
    set portal_id [dotlrn_community::get_portal_id -community_id $community_id]
    
    #add portlet to community portal
    set args [ns_set create]
    ns_set put $args package_id $package_id
    ns_set put $args param_action "overwrite"
    add_portlet_helper $portal_id $args
	
	return $package_id
    }
    
    ad_proc -public remove_applet_from_community {
	community_id
    } {
	remove the applet from the community
    } {
	
	ad_return_complaint 1 "[applet_key] remove_applet_from_community not implimented!"
    }
    
    ad_proc -public add_user {
	user_id
    } {
	one time user-specifuc init
    } {
        # noop
    }
    
    ad_proc -public remove_user {
        user_id
    } {
    } {
        ad_return_complaint 1 "[applet_key] remove_user not implimented!"
    }
    
    ad_proc -public add_user_to_community {
	community_id
	user_id
    } {
	Add a user to a specifc dotlrn community
    } {
#     	set portal_id [dotlrn::get_portal_id -user_id $user_id]
#         set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]

#         # use "append" here since we want to aggregate
#         set args [ns_set create]
#         ns_set put $args package_id $package_id
#         ns_set put $args param_action append
#         add_portlet_helper $portal_id $args
#         # flush cache for this portal
#         ::tlf_global flush_portal $portal_id
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        Remove a user from a community
    } {
#         set package_id [dotlrn_community::get_applet_package_id -community_id $community_id -applet_key [applet_key]]
#         set portal_id [dotlrn::get_portal_id -user_id $user_id]

#         set args [ns_set create]
#         ns_set put $args package_id $package_id

#         remove_portlet $portal_id $args
#         # flush cache for this portal
#         ::tlf_global flush_portal $portal_id
    }
	
    ad_proc -public add_portlet {
        portal_id
    } {
        A helper proc to add the underlying portlet to the given portal. 
        
        @param portal_id
    } {
        # simple, no type specific stuff, just set some dummy values

         set args [ns_set create]
         ns_set put $args package_id 0
         add_portlet_helper $portal_id $args
    }

    ad_proc -public add_portlet_helper {
      portal_id
      args
    } {
      A helper proc to add the underlying portlet to the given portal.
      @param portal_id
    } {
      content_portlet::add_self_to_page \
	  -portal_id $portal_id \
	  -package_id [ns_set get $args "package_id"] \
	  -force_region [ns_set get $args "force_region"] \
	  -page_name [get_pretty_name] \
	  -param_action [ns_set get $args "param_action"]
     }
    
    ad_proc -public remove_portlet {
        portal_id
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param portal_id
        @param args A list of key-value pairs (possibly user_id, community_id, and more)
    } { 
     	content_portlet::remove_self_from_page \
             -portal_id $portal_id \
             -package_id [ns_set get $args "package_id"] 
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        ns_log notice "Cloning: [applet_key]"
        set new_package_id [add_applet_to_community $new_community_id]
        set old_package_id [dotlrn_community::get_applet_package_id \
            -community_id $old_community_id \
            -applet_key [applet_key]
        ]

        db_exec_plsql clone_data {}
        return $new_package_id
    }

    ad_proc -public change_event_handler {
        community_id
        event
        old_value
        new_value
    } { 
        listens for the following events: 
    } { 
    }   
    
}
