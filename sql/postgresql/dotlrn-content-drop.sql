
select acs_sc_impl__delete(
	   'dotlrn_applet',		-- impl_contract_name
       'dotlrn_content'		-- impl_name
);


-- add all the hooks

-- GetPrettyName
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'GetPrettyName'
);

-- AddApplet
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'AddApplet'
);

-- RemoveApplet
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'RemoveApplet'
);

-- AddAppletToCommunity
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'AddAppletToCommunity'
);

-- RemoveAppletFromCommunity
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'RemoveAppletFromCommunity'
);

-- AddUser
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'AddUser'
);

-- RemoveUser
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'RemoveUser'
);

-- AddUserToCommunity
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'AddUserToCommunity'
);

-- RemoveUserFromCommunity
select acs_sc_impl_alias__delete (
	       'dotlrn_applet',
	       'dotlrn_content',
	       'RemoveUserFromCommunity'
);

-- AddPortlet
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_content',
        'AddPortlet'
    );

-- RemovePortlet
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_content',
        'RemovePortlet'
);

-- Clone
select acs_sc_impl_alias__delete (
        'dotlrn_applet',
        'dotlrn_content',
        'Clone'
);


-- Add the binding
select acs_sc_binding__delete (
	    'dotlrn_applet',
	    'dotlrn_content'
);
