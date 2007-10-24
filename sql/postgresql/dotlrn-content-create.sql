
-- create the implementation
select acs_sc_impl__new (
        'dotlrn_applet',
        'dotlrn_content',
        'dotlrn_content'
);

-- add all the hooks

-- GetPrettyName
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'GetPrettyName',
           'content::get_pretty_name',
           'TCL'
);

-- AddApplet
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'AddApplet',
           'content::add_applet',
           'TCL'
);

-- RemoveApplet
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'RemoveApplet',
           'content::remove_applet',
           'TCL'
);

-- AddAppletToCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'AddAppletToCommunity',
           'content::add_applet_to_community',
           'TCL'
);

-- RemoveAppletFromCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'RemoveAppletFromCommunity',
           'content::remove_applet_from_community',
           'TCL'
);

-- AddUser
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'AddUser',
           'content::add_user',
           'TCL'
);

-- RemoveUser
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'RemoveUser',
           'content::remove_user',
           'TCL'
);

-- AddUserToCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'AddUserToCommunity',
           'content::add_user_to_community',
           'TCL'
);

-- RemoveUserFromCommunity
select acs_sc_impl_alias__new (
           'dotlrn_applet',
           'dotlrn_content',
           'RemoveUserFromCommunity',
           'content::remove_user_from_community',
           'TCL'
);

-- AddPortlet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_content',
        'AddPortlet',
        'content::add_portlet',
        'TCL'
    );

-- RemovePortlet
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_content',
        'RemovePortlet',
        'content::remove_portlet',
        'TCL'
);

-- Clone
select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_content',
        'Clone',
        'content::clone',
        'TCL'
);

select acs_sc_impl_alias__new (
        'dotlrn_applet',
        'dotlrn_content',
        'ChangeEventHandler',
        'content::change_event_handler',
        'TCL'
);

-- Add the binding
select acs_sc_binding__new (
        'dotlrn_applet',
        'dotlrn_content'
);
